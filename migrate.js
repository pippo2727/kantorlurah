#!/usr/bin/env node

const fs = require('node:fs');
const path = require('node:path');
const { spawn } = require('node:child_process');

const ROOT_DIR = __dirname;
const DEFAULT_SCHEMA_FILE = path.join(ROOT_DIR, 'supabase_schema.sql');
const DEFAULT_ACCOUNTS_FILE = path.join(ROOT_DIR, 'supabase_accounts.json');

function readJson(filePath) {
  try {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'));
  } catch (error) {
    throw new Error(`Gagal membaca JSON ${filePath}: ${error.message}`);
  }
}

function readText(filePath) {
  try {
    return fs.readFileSync(filePath, 'utf8');
  } catch (error) {
    throw new Error(`Gagal membaca file ${filePath}: ${error.message}`);
  }
}

function parseArgs(argv) {
  const args = {
    accountsFile: DEFAULT_ACCOUNTS_FILE,
    schemaFile: DEFAULT_SCHEMA_FILE,
    dryRun: false,
  };

  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];

    if (arg === '--accounts') {
      args.accountsFile = path.resolve(argv[++index]);
    } else if (arg === '--schema') {
      args.schemaFile = path.resolve(argv[++index]);
    } else if (arg === '--dry-run') {
      args.dryRun = true;
    } else if (arg === '--help' || arg === '-h') {
      args.help = true;
    } else {
      throw new Error(`Argumen tidak dikenal: ${arg}`);
    }
  }

  return args;
}

function printHelp() {
  console.log(`
Usage:
  node migrate.js [--accounts supabase_accounts.json] [--schema supabase_schema.sql] [--dry-run]

Environment optional:
  SUPABASE_DATABASE_URL Full connection string Postgres/Supabase.
  SUPABASE_DB_PASSWORD  Password database Supabase.
  SUPABASE_DB_USER      User database. Default: postgres
  SUPABASE_DB_NAME      Nama database. Default: postgres
  SUPABASE_DB_HOST      Host database. Default: db.<project-ref>.supabase.co
  SUPABASE_DB_PORT      Port database. Default: 5432

Catatan:
  Script ini membaca URL project dan password dari supabase_accounts.json,
  lalu menjalankan supabase_schema.sql lewat psql. Jika direct host gagal,
  isi supabase.database_url dengan Session Pooler connection string dari
  Supabase Dashboard > Connect.
`.trim());
}

function getProjectRef(supabaseUrl) {
  if (!supabaseUrl) {
    throw new Error('supabase.url tidak ditemukan di supabase_accounts.json');
  }

  const hostname = new URL(supabaseUrl).hostname;
  const [projectRef] = hostname.split('.');

  if (!projectRef) {
    throw new Error(`Gagal mengambil project ref dari URL: ${supabaseUrl}`);
  }

  return projectRef;
}

function getDatabasePassword(accounts) {
  return (
    process.env.SUPABASE_DB_PASSWORD ||
    accounts.supabase?.database_password ||
    accounts.supabase?.db_password ||
    accounts.database?.password ||
    accounts.account?.password
  );
}

function getDatabaseUrl(accounts) {
  return (
    process.env.SUPABASE_DATABASE_URL ||
    process.env.DATABASE_URL ||
    accounts.supabase?.database_url ||
    accounts.database?.url
  );
}

function getDatabaseConfig({ accounts, projectRef }) {
  return {
    url: getDatabaseUrl(accounts),
    host: process.env.SUPABASE_DB_HOST || accounts.supabase?.database_host || `db.${projectRef}.supabase.co`,
    port: process.env.SUPABASE_DB_PORT || accounts.supabase?.database_port || '5432',
    user: process.env.SUPABASE_DB_USER || accounts.supabase?.database_user || 'postgres',
    database: process.env.SUPABASE_DB_NAME || accounts.supabase?.database_name || 'postgres',
    password: getDatabasePassword(accounts),
  };
}

function runPsql({ schemaFile, db }) {
  return new Promise((resolve, reject) => {
    const connectionArgs = db.url
      ? [db.url]
      : [
          '--host',
          db.host,
          '--port',
          String(db.port),
          '--username',
          db.user,
          '--dbname',
          db.database,
        ];

    const child = spawn(
      'psql',
      [
        '--set',
        'ON_ERROR_STOP=1',
        ...connectionArgs,
        '--file',
        schemaFile,
      ],
      {
        stdio: 'inherit',
        env: {
          ...process.env,
          PGPASSWORD: db.password,
        },
      },
    );

    child.on('error', (error) => {
      if (error.code === 'ENOENT') {
        reject(new Error('Command psql tidak ditemukan. Install PostgreSQL client dulu, lalu jalankan lagi.'));
        return;
      }

      reject(error);
    });

    child.on('close', (code) => {
      if (code === 0) {
        resolve();
        return;
      }

      reject(
        new Error(
          [
            `Migrasi gagal. psql exit code: ${code}`,
            '',
            'Kalau error host db.<project-ref>.supabase.co tidak resolve, pakai Session Pooler URL dari Supabase Dashboard > Connect.',
            'Format: postgres://postgres.<project-ref>:<password>@aws-0-<region>.pooler.supabase.com:5432/postgres',
            'Simpan sebagai supabase.database_url di supabase_accounts.json atau set SUPABASE_DATABASE_URL.',
          ].join('\n'),
        ),
      );
    });
  });
}

async function main() {
  const args = parseArgs(process.argv.slice(2));

  if (args.help) {
    printHelp();
    return;
  }

  const accounts = readJson(args.accountsFile);
  const sql = readText(args.schemaFile).trim();

  if (!sql) {
    throw new Error(`Schema kosong: ${args.schemaFile}`);
  }

  const projectRef = getProjectRef(accounts.supabase?.url);
  const db = getDatabaseConfig({ accounts, projectRef });

  if (!db.url && !db.password) {
    throw new Error(
      'Password database tidak ditemukan. Tambahkan supabase.database_password/database_url di supabase_accounts.json atau set SUPABASE_DB_PASSWORD.',
    );
  }

  console.log(`Project ref : ${projectRef}`);
  if (db.url) {
    console.log('DB URL      : dari supabase_accounts.json/env');
  } else {
    console.log(`DB host     : ${db.host}`);
    console.log(`DB port     : ${db.port}`);
    console.log(`DB user     : ${db.user}`);
    console.log(`DB name     : ${db.database}`);
  }
  console.log(`Schema file : ${args.schemaFile}`);
  console.log(`Accounts    : ${args.accountsFile}`);
  console.log(`SQL length  : ${sql.length} chars`);

  if (args.dryRun) {
    console.log('Dry run aktif. SQL tidak dikirim ke Supabase.');
    return;
  }

  console.log('Menjalankan migrasi...');
  await runPsql({ schemaFile: args.schemaFile, db });

  console.log('Migrasi selesai.');
}

main().catch((error) => {
  console.error(error.message);
  process.exitCode = 1;
});

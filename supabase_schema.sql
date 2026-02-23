-- ============================================================
-- Schema: kantorlurah
-- Created: 2026-02-23
-- ============================================================

-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- ------------------------------------------------------------
-- Table: users
-- Linked to Supabase auth.users via id
-- ------------------------------------------------------------
create table if not exists public.users (
  id          uuid primary key references auth.users(id) on delete cascade,
  name        text not null,
  birth_date  date not null,
  email       text not null unique,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- Auto-update updated_at on row change
create or replace function public.handle_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create or replace trigger users_updated_at
  before update on public.users
  for each row execute procedure public.handle_updated_at();

-- ------------------------------------------------------------
-- Row Level Security
-- ------------------------------------------------------------
alter table public.users enable row level security;

-- Users can read only their own row
create policy "users: select own"
  on public.users for select
  using (auth.uid() = id);

-- Users can insert their own row (on register)
create policy "users: insert own"
  on public.users for insert
  with check (auth.uid() = id);

-- Users can update their own row
create policy "users: update own"
  on public.users for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

-- Service role can do everything (used for auto-create on login)
create policy "users: service role full access"
  on public.users for all
  using (auth.role() = 'service_role');

-- ------------------------------------------------------------
-- Function: auto-insert into public.users on new auth signup
-- Trigger-based approach for server-side upsert
-- ------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
as $$
begin
  insert into public.users (id, name, birth_date, email)
  values (
    new.id,
    coalesce(new.raw_user_meta_data->>'name', 'Unknown'),
    coalesce((new.raw_user_meta_data->>'birth_date')::date, now()::date),
    new.email
  )
  on conflict (id) do nothing;
  return new;
end;
$$;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

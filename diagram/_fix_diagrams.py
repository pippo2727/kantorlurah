#!/usr/bin/env python3
"""Fix all PlantUML diagram files."""
import os

BASE = os.path.dirname(os.path.abspath(__file__))

# ============================================================
# 1. UseCase Diagram
# ============================================================
usecase = r"""@startuml UseCase_Kantor_Lurah_Maharatu

skinparam actorStyle awesome
skinparam packageStyle rectangle
skinparam roundcorner 10
skinparam BackgroundColor white
skinparam shadowing false
skinparam usecaseBackgroundColor #FEFEFE
skinparam usecaseBorderColor #555555
skinparam usecaseFontSize 11
skinparam arrowColor #333333

left to right direction

title Use Case Diagram\nSistem Informasi Kantor Lurah Maharatu

actor "Masyarakat\n(User)" as User
actor "Admin\n(Lurah)" as Admin
actor "Supabase" as Supabase <<System>>
actor "Cloudinary" as Cloudinary <<System>>

rectangle "Sistem Informasi Kantor Lurah Maharatu" {

  package "Autentikasi" #E8F5E9 {
    usecase "Register Akun" as UC_Register
    usecase "Login" as UC_Login
    usecase "Logout" as UC_Logout
    usecase "Validasi Kredensial" as UC_ValidasiAuth
    usecase "Auto-Create User Row" as UC_AutoCreate
  }

  package "Manajemen Profil" #E3F2FD {
    usecase "Lihat Profil" as UC_LihatProfil
    usecase "Edit Profil\n(Nama & Tgl Lahir)" as UC_EditProfil
  }

  package "Pengaduan Masyarakat" #FFF3E0 {
    usecase "Buat Pengaduan Baru" as UC_BuatPengaduan
    usecase "Upload Lampiran\n(Foto)" as UC_UploadLampiran
    usecase "Lihat Pengaduan Saya" as UC_LihatPengaduanSaya
    usecase "Cari & Filter\nPengaduan" as UC_CariPengaduan
    usecase "Lihat Detail\nPengaduan" as UC_DetailPengaduan
  }

  package "Kelola Pengaduan (Admin)" #FFEBEE {
    usecase "Lihat Semua\nPengaduan" as UC_LihatSemuaPengaduan
    usecase "Lihat Dashboard\n& Statistik" as UC_Dashboard
    usecase "Ubah Status\nPengaduan" as UC_UbahStatus
    usecase "Tambah Catatan\nAdmin" as UC_TambahCatatan
    usecase "Cari & Filter\nPengaduan (Admin)" as UC_CariPengaduanAdmin
  }

  package "Informasi Layanan" #F3E5F5 {
    usecase "Lihat Informasi\nPersyaratan" as UC_LihatPersyaratan
    usecase "Lihat Persyaratan\nAhli Waris" as UC_AhliWaris
    usecase "Lihat Persyaratan\nNikah" as UC_Nikah
    usecase "Lihat Persyaratan\nSKTM" as UC_SKTM
    usecase "Lihat Persyaratan\nKeterangan" as UC_Keterangan
    usecase "Lihat Persyaratan\nSKPW" as UC_SKPW
    usecase "Lihat Persyaratan\nPenghasilan" as UC_Penghasilan
    usecase "Lihat Persyaratan\nKematian" as UC_Kematian
    usecase "Lihat Persyaratan\nSKBMR" as UC_SKBMR
    usecase "Lihat Persyaratan\nRekom Usaha" as UC_RekomUsaha
    usecase "Lihat Persyaratan\nDomisili" as UC_Domisili
    usecase "Lihat Persyaratan\nDomisili Usaha" as UC_DomisiliUsaha
    usecase "Lihat Jam\nPelayanan" as UC_JamPelayanan
    usecase "Lihat Profil\nKantor Kelurahan" as UC_ProfilKantor
  }
}

User --> UC_Register
User --> UC_Login
User --> UC_Logout
User --> UC_LihatProfil
User --> UC_EditProfil
User --> UC_BuatPengaduan
User --> UC_LihatPengaduanSaya
User --> UC_CariPengaduan
User --> UC_DetailPengaduan
User --> UC_LihatPersyaratan
User --> UC_JamPelayanan
User --> UC_ProfilKantor

Admin --> UC_Login
Admin --> UC_Logout
Admin --> UC_LihatProfil
Admin --> UC_LihatSemuaPengaduan
Admin --> UC_Dashboard
Admin --> UC_UbahStatus
Admin --> UC_TambahCatatan
Admin --> UC_CariPengaduanAdmin

UC_Login ..> UC_ValidasiAuth : <<include>>
UC_Register ..> UC_ValidasiAuth : <<include>>
UC_Register ..> UC_AutoCreate : <<include>>
UC_BuatPengaduan ..> UC_UploadLampiran : <<extend>>
UC_UbahStatus ..> UC_TambahCatatan : <<extend>>

UC_LihatPersyaratan ..> UC_AhliWaris : <<extend>>
UC_LihatPersyaratan ..> UC_Nikah : <<extend>>
UC_LihatPersyaratan ..> UC_SKTM : <<extend>>
UC_LihatPersyaratan ..> UC_Keterangan : <<extend>>
UC_LihatPersyaratan ..> UC_SKPW : <<extend>>
UC_LihatPersyaratan ..> UC_Penghasilan : <<extend>>
UC_LihatPersyaratan ..> UC_Kematian : <<extend>>
UC_LihatPersyaratan ..> UC_SKBMR : <<extend>>
UC_LihatPersyaratan ..> UC_RekomUsaha : <<extend>>
UC_LihatPersyaratan ..> UC_Domisili : <<extend>>
UC_LihatPersyaratan ..> UC_DomisiliUsaha : <<extend>>

UC_ValidasiAuth --> Supabase
UC_AutoCreate --> Supabase
UC_BuatPengaduan --> Supabase
UC_LihatPengaduanSaya --> Supabase
UC_LihatSemuaPengaduan --> Supabase
UC_UbahStatus --> Supabase
UC_EditProfil --> Supabase
UC_UploadLampiran --> Cloudinary

note right of UC_Login
  Admin teridentifikasi melalui
  email: **admin@demo.com**
  Login admin -> Admin Dashboard
  Login user -> User Home
end note

note right of UC_BuatPengaduan
  Form: Nama, NIK (16 digit),
  Tanggal, Alamat, Uraian (min 20 char),
  Lampiran foto (opsional)
end note

note right of UC_UbahStatus
  Status: menunggu -> diproses
  -> selesai / ditolak
end note

note bottom of UC_Dashboard
  Grafik bar mingguan
  jumlah pengaduan (Sen-Min)
  + 5 pengaduan terbaru
end note

@enduml
"""

# ============================================================
# 2. DFD Diagram
# ============================================================
dfd = r"""@startuml DFD_Kantor_Lurah_Maharatu

skinparam roundcorner 15
skinparam defaultFontSize 11
skinparam BackgroundColor white
skinparam shadowing false
skinparam rectangleBackgroundColor #FEFEFE
skinparam rectangleBorderColor #555555

title DFD Level 0 - Context Diagram\nSistem Informasi Kantor Lurah Maharatu

actor "Masyarakat\n(User)" as ExtUser0
actor "Admin\n(Lurah)" as ExtAdmin0

rectangle "Sistem Informasi\nKantor Lurah\nMaharatu" as SistemUtama #E8F5E9

database "Supabase\n(Database)" as DB0 #FFF9C4
cloud "Cloudinary\n(Image Storage)" as Cloud0 #FFF3E0

ExtUser0 -right-> SistemUtama : Data Registrasi,\nData Login,\nData Pengaduan,\nData Profil,\nLampiran Foto
SistemUtama -left-> ExtUser0 : Info Persyaratan,\nInfo Jam Pelayanan,\nInfo Profil Kantor,\nStatus Pengaduan,\nData Profil User

ExtAdmin0 -left-> SistemUtama : Data Login,\nPerubahan Status,\nCatatan Admin
SistemUtama -right-> ExtAdmin0 : Dashboard Statistik,\nDaftar Semua Pengaduan,\nDetail Pengaduan

SistemUtama -down-> DB0 : CRUD Data User,\nCRUD Data Pengaduan
DB0 -up-> SistemUtama : Data User,\nData Pengaduan

SistemUtama -down-> Cloud0 : Upload Gambar
Cloud0 -up-> SistemUtama : URL Gambar

newpage DFD Level 1 - Detail Proses\nSistem Informasi Kantor Lurah Maharatu

actor "Masyarakat\n(User)" as ExtUser
actor "Admin\n(Lurah)" as ExtAdmin

database "D1: users" as DS_Users #FFF9C4
database "D2: pengaduan" as DS_Pengaduan #FFF9C4
database "D3: auth.users" as DS_AuthUsers #FFF9C4
cloud "D4: Cloudinary" as DS_Cloudinary #FFF3E0
storage "D5: persyaratan_item\n(Static Data)" as DS_Persyaratan #F3E5F5

rectangle "P1\nRegistrasi\nAkun" as P1 #C8E6C9
rectangle "P2\nAutentikasi\n(Login/Logout)" as P2 #C8E6C9
rectangle "P3\nKelola\nProfil" as P3 #BBDEFB
rectangle "P4\nBuat\nPengaduan" as P4 #FFE0B2
rectangle "P5\nLihat Pengaduan\n(User)" as P5 #FFE0B2
rectangle "P6\nKelola Pengaduan\n(Admin)" as P6 #FFCDD2
rectangle "P7\nDashboard\nStatistik" as P7 #FFCDD2
rectangle "P8\nInformasi\nLayanan" as P8 #E1BEE7

ExtUser -down-> P1 : Nama, Email,\nPassword, Tgl Lahir
P1 -down-> DS_AuthUsers : INSERT auth.users\n(email, password, metadata)
P1 -down-> DS_Users : UPSERT public.users\n(id, name, birth_date, email)
P1 -left-> ExtUser : Konfirmasi Registrasi\nBerhasil / Gagal

ExtUser --> P2 : Email, Password
ExtAdmin --> P2 : Email, Password
P2 --> DS_AuthUsers : Verifikasi Kredensial
DS_AuthUsers --> P2 : Auth Token / Error
P2 --> DS_Users : Cek/Buat User Row\n(ensureUserRow)
DS_Users --> P2 : Data Profil User
P2 --> ExtUser : Redirect ke\nUser Home
P2 --> ExtAdmin : Redirect ke\nAdmin Dashboard

ExtUser --> P3 : Nama Baru,\nTgl Lahir Baru
P3 --> DS_Users : UPDATE name,\nbirth_date
DS_Users --> P3 : Data Profil\nTerbaru
P3 --> ExtUser : Konfirmasi Update\n& Data Profil

ExtUser --> P4 : Nama, NIK, Tanggal,\nAlamat, Uraian,\nLampiran (opsional)
P4 --> DS_Cloudinary : Upload Gambar\n(jika ada)
DS_Cloudinary --> P4 : secure_url
P4 --> DS_Pengaduan : INSERT pengaduan\n(+ user_id, attachment_url)
P4 --> ExtUser : Konfirmasi\nPengaduan Terkirim

ExtUser --> P5 : Request Pengaduan Saya\n+ Filter & Keyword
P5 --> DS_Pengaduan : SELECT WHERE\nuser_id = auth.uid()
DS_Pengaduan --> P5 : List Pengaduan\n(+ status, admin_note)
P5 --> ExtUser : Daftar & Detail\nPengaduan

ExtAdmin --> P6 : Filter, Keyword,\nStatus Baru,\nCatatan Admin
P6 --> DS_Pengaduan : SELECT ALL /\nUPDATE status,\nadmin_note
DS_Pengaduan --> P6 : List Semua\nPengaduan
P6 --> ExtAdmin : Daftar & Detail\nPengaduan

ExtAdmin --> P7 : Request Dashboard
P7 --> DS_Pengaduan : SELECT pengaduan\n(minggu ini)
DS_Pengaduan --> P7 : Data Statistik\nMingguan
P7 --> ExtAdmin : Grafik Bar &\n5 Pengaduan Terbaru

ExtUser --> P8 : Pilih Menu\n(Persyaratan /\nJam / Profil Kantor)
P8 --> DS_Persyaratan : Baca Data Statis\n(by index 0-10)
DS_Persyaratan --> P8 : Daftar Persyaratan\nDokumen
P8 --> ExtUser : Info Persyaratan,\nJam Pelayanan,\nProfil Kantor

@enduml
"""

# ============================================================
# 3. Activity Diagram
# ============================================================
activity = r"""@startuml Activity_Kantor_Lurah_Maharatu

skinparam roundcorner 10
skinparam BackgroundColor white
skinparam shadowing false
skinparam ActivityBackgroundColor #FEFEFE
skinparam ActivityBorderColor #555555
skinparam ActivityFontSize 11

title Activity Diagram - Registrasi Akun\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Buka Aplikasi;
:Tampilkan Splash Screen\n(3 detik);
:Tampilkan Halaman Welcome\n(FirstView);
:Pilih **Daftar**;
:Tampilkan Form Registrasi;
:Isi Nama Lengkap,\nTanggal Lahir,\nEmail, Password,\nKonfirmasi Password;

|#FFF9C4|Sistem|
:Validasi Input Form;
note right
  - Nama >= 2 karakter
  - Email format valid
  - Password >= 6 karakter
  - Password & Konfirmasi cocok
  - Tanggal lahir wajib diisi
end note

if (Validasi berhasil?) then (Ya)
  :Supabase Auth signUp\n(email, password, metadata);
  :Trigger handle_new_user()\nINSERT ke public.users;
  :Client _upsertUser()\n(fallback);
  :Tampilkan Snackbar\n"Registrasi Berhasil!";

  |#E8F5E9|Masyarakat|
  :Kembali ke Halaman Login;
  stop
else (Tidak)
  :Tampilkan pesan\nerror validasi;

  |#E8F5E9|Masyarakat|
  :Perbaiki input;
  stop
endif

newpage Activity Diagram - Login\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Tampilkan Form Login;
:Masukkan Email & Password;

|#FFF9C4|Sistem|
:Validasi Input;
:Supabase signInWithPassword\n(email, password);

if (Autentikasi berhasil?) then (Ya)
  :_ensureUserRow()\n(buat row jika belum ada);

  if (Email == admin@demo.com?) then (Ya - Admin)
    |#FFCDD2|Admin|
    :Navigasi ke\nAdminMainNavigationView;
    :Tampilkan Admin Dashboard;
    note right
      Bottom Navigation:
      Tab 0: Dashboard
      Tab 1: Pengaduan
      Tab 2: Profil
    end note
    stop
  else (Tidak - User Biasa)
    |#FFF9C4|Sistem|
    :fetchCurrentUserProfile();

    |#E8F5E9|Masyarakat|
    :Navigasi ke\nUserMainNavigationView;
    :Tampilkan Beranda (Home);
    note right
      Bottom Navigation:
      Tab 0: Beranda
      Tab 1: Pengaduan
      Tab 2: Profil
    end note
    stop
  endif
else (Tidak)
  :Tampilkan Snackbar Error\n(kredensial salah);

  |#E8F5E9|Masyarakat|
  :Kembali ke Form Login;
  stop
endif

newpage Activity Diagram - Buat Pengaduan\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Pilih Menu\nPengaduan Masyarakat;
:Tampilkan PengaduanView;
:Pilih Buat Pengaduan Baru;
:Tampilkan Form Input Pengaduan;
:Isi Nama Lengkap, NIK (16 digit),\nTanggal Kejadian, Alamat,\nUraian Pengaduan (min 20 char);

if (Ingin lampirkan foto?) then (Ya)
  :Pilih/Ambil Foto\n(Image Picker);
  :Preview Foto Terlampir;
else (Tidak)
  :Lanjut tanpa lampiran;
endif

:Tekan Tombol Kirim Pengaduan;

|#FFF9C4|Sistem|
:Validasi Seluruh Input Form;
note right
  - Nama: wajib
  - NIK: wajib, 16 digit numerik
  - Tanggal: wajib
  - Alamat: wajib
  - Uraian: wajib, min 20 karakter
end note

if (Validasi berhasil?) then (Ya)

  if (Ada lampiran foto?) then (Ya)
    :Upload ke Cloudinary API;
    :Terima secure_url;
  else (Tidak)
    :attachment_url = null;
  endif

  :INSERT INTO pengaduan\n(user_id, name, nik, date,\naddress, description,\nattachment_url,\nstatus = menunggu);
  :Tampilkan Snackbar\n"Pengaduan Berhasil Dikirim!";

  |#E8F5E9|Masyarakat|
  :Kembali ke PengaduanView;
  stop
else (Tidak)
  :Tampilkan Pesan\nError Validasi;

  |#E8F5E9|Masyarakat|
  :Perbaiki Input Form;
  stop
endif

newpage Activity Diagram - Lihat Pengaduan Saya\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Pilih Pengaduan Saya;

|#FFF9C4|Sistem|
:fetchMyPengaduan()\nSELECT WHERE user_id = auth.uid()\nORDER BY created_at DESC;

if (Data pengaduan ada?) then (Ya)
  :Tampilkan Daftar Pengaduan\n(Card: nama, tanggal, status);
else (Tidak)
  :Tampilkan Pesan\n"Belum ada pengaduan";
endif

|#E8F5E9|Masyarakat|

fork
  :Cari berdasarkan\nnama/deskripsi/alamat;
fork again
  :Filter berdasarkan Status\n(Semua, Menunggu, Diproses,\nSelesai, Ditolak);
fork again
  :Pull-to-Refresh;
end fork

:Pilih Salah Satu Pengaduan;

|#FFF9C4|Sistem|
:Tampilkan Detail Pengaduan;
note right
  - Nama, NIK, Tanggal
  - Alamat, Uraian
  - Foto Lampiran (jika ada)
  - Status (dengan warna & icon)
  - Catatan Admin (jika ada)
end note

|#E8F5E9|Masyarakat|
:Baca Detail & Status;

stop

newpage Activity Diagram - Kelola Pengaduan (Admin)\nSistem Informasi Kantor Lurah Maharatu

|#FFCDD2|Admin|
start
:Buka Tab Pengaduan\n(AdminPengaduanView);

|#FFF9C4|Sistem|
:fetchAllPengaduan()\nSELECT ALL pengaduan\nORDER BY created_at DESC;
:Tampilkan Daftar Semua\nPengaduan Masyarakat;

|#FFCDD2|Admin|

fork
  :Cari pengaduan\n(keyword);
fork again
  :Filter Status\n(Semua, Menunggu, Diproses,\nSelesai, Ditolak);
end fork

:Pilih Pengaduan untuk Ditinjau;

|#FFF9C4|Sistem|
:Tampilkan AdminPengaduanDetailView;
note right
  Detail lengkap pengaduan:
  Nama, NIK, Tanggal, Alamat,
  Uraian, Foto Lampiran,
  Status saat ini
end note

|#FFCDD2|Admin|
:Pilih Status Baru\n(Dropdown: menunggu / diproses\n/ selesai / ditolak);

if (Ingin tambah catatan?) then (Ya)
  :Tulis Catatan Admin\n(admin_note);
else (Tidak)
  :Lanjut tanpa catatan;
endif

:Tekan Tombol Simpan;

|#FFF9C4|Sistem|
:updateStatus(id, status, adminNote);
:UPDATE pengaduan\nSET status, admin_note\nWHERE id = ?;
:Tampilkan Snackbar\n"Status Berhasil Diperbarui!";

|#FFCDD2|Admin|
:Kembali ke Daftar Pengaduan\n(data ter-refresh);

stop

newpage Activity Diagram - Dashboard Admin\nSistem Informasi Kantor Lurah Maharatu

|#FFCDD2|Admin|
start
:Buka Tab Dashboard\n(AdminDashboardView);

|#FFF9C4|Sistem|
:fetchAllPengaduan();
:Hitung jumlah pengaduan\nper hari (Senin-Minggu)\nminggu berjalan;
:Tampilkan Grafik Bar\nStatistik Mingguan;
:Tampilkan 5 Pengaduan\nTerbaru sebagai Card;

|#FFCDD2|Admin|

fork
  :Analisis Grafik Statistik;
fork again
  :Tinjau 5 Pengaduan Terbaru;
fork again
  :Tekan Refresh untuk\nMemperbarui Data;
end fork

stop

newpage Activity Diagram - Informasi Persyaratan\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Pilih Menu\nInformasi Persyaratan;
:Tampilkan PersyaratanView\n(11 sub-menu icon);
:Pilih salah satu kategori\npersyaratan layanan;
note right
  11 Kategori:
  [0] Ahli Waris
  [1] Nikah
  [2] SKTM
  [3] Keterangan
  [4] SKPW (Pindah Wilayah)
  [5] Penghasilan
  [6] Kematian
  [7] SKBMR (Belum Punya Rumah)
  [8] Rekomendasi Usaha
  [9] Domisili
  [10] Domisili Usaha
end note

|#FFF9C4|Sistem|
:Ambil Data Statis\nlistData[index];
:Tampilkan Judul Kategori;
:Tampilkan Daftar Persyaratan\n(numbered list);
:Tampilkan Referensi:\n"Peraturan Daerah Kota\nPekanbaru No. 273 Tahun 2017";

|#E8F5E9|Masyarakat|
:Baca Informasi Persyaratan;

if (Kategori == Nikah?) then (Ya)
  :Download Form\nSurat Pengantar Nikah\n(Google Docs);
else (Tidak)
  :Selesai membaca;
endif

:Kembali ke PersyaratanView;

stop

newpage Activity Diagram - Edit Profil & Logout\nSistem Informasi Kantor Lurah Maharatu

|#E8F5E9|Masyarakat|
start
:Buka Tab Profil\n(NavProfileTabView);

|#FFF9C4|Sistem|
:Tampilkan Avatar (inisial),\nNama, Email User;
:Tampilkan Menu:\nEdit Profil, Syarat & Ketentuan,\nKebijakan Privasi, Keluar;

|#E8F5E9|Masyarakat|

if (Pilih Edit Profil?) then (Ya)
  :Buka EditProfileView;

  |#FFF9C4|Sistem|
  :fetchCurrentUserProfile();
  :Tampilkan form dengan\ndata profil saat ini;

  |#E8F5E9|Masyarakat|
  :Edit Nama Lengkap;
  :Pilih Tanggal Lahir Baru\n(Date Picker);
  :Tekan Tombol Simpan;

  |#FFF9C4|Sistem|
  :Validasi Input;

  if (Valid?) then (Ya)
    :UPDATE public.users\nSET name, birth_date\nWHERE id = auth.uid();
    :Tampilkan Snackbar\n"Profil Berhasil Diperbarui!";

    |#E8F5E9|Masyarakat|
    :Kembali ke Tab Profil\n(data ter-refresh);
    stop
  else (Tidak)
    :Tampilkan Error Validasi;

    |#E8F5E9|Masyarakat|
    :Perbaiki Input;
    stop
  endif

elseif (Pilih Keluar?) then (Ya)

  |#E8F5E9|Masyarakat|
  :Konfirmasi Dialog\n"Yakin ingin keluar?";

  if (Konfirmasi Ya?) then (Ya)
    |#FFF9C4|Sistem|
    :SupabaseService.logout();
    :Supabase signOut();
    :Navigasi ke FirstView\n(offAll);
    stop
  else (Tidak)
    |#E8F5E9|Masyarakat|
    :Kembali ke Tab Profil;
    stop
  endif

else (Lainnya)
  :Fitur belum tersedia\n(Syarat & Ketentuan,\nKebijakan Privasi);
  stop
endif

@enduml
"""

# Write files
files = {
    'usecase_diagram.puml': usecase,
    'dfd_diagram.puml': dfd,
    'activity_diagram.puml': activity,
}

for name, content in files.items():
    path = os.path.join(BASE, name)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(content.lstrip('\n'))
    print(f"Written: {name} ({len(content.strip().splitlines())} lines)")

print("\nAll diagrams fixed!")

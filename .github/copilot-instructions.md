# Copilot Instructions - Kantor Lurah Maharatu

## Project Overview
Aplikasi Flutter "Sistem Informasi Kantor Lurah Maharatu" (kantor_lurah). Backend Supabase (Auth + PostgreSQL) dan Cloudinary untuk upload gambar.

## PlantUML Diagram Rules

Saat membuat atau mengedit file `.puml`, **WAJIB** patuhi aturan berikut agar tidak error di PlantUML extension VS Code:

### Umum
- **JANGAN** pakai `!theme <name>` — theme mungkin tidak tersedia di local PlantUML renderer.
- **JANGAN** pakai Markdown formatting (`**bold**`, `_italic_`) di dalam diagram. Gunakan PlantUML native formatting (`<b>text</b>`, `<i>text</i>`) jika diperlukan.
- **JANGAN** pakai `List<String>` atau generics dengan `< >` karena akan dikira stereotype. Gunakan `List~String~` sebagai pengganti.
- Setiap `@startuml` harus punya pasangan `@enduml`.

### Activity Diagram
- **JANGAN** pakai `newpage` digabung dengan swimlane — hasilnya error. Jika butuh multiple diagram, pisah jadi beberapa blok `@startuml/@enduml` terpisah dalam satu file.
- **JANGAN** pakai `elseif` yang disertai pergantian swimlane (mis. `|Sistem|` di dalam branch `elseif`). PlantUML parser akan crash.
- **JANGAN** pakai `fork`/`end fork` yang melintasi swimlane berbeda.
- **JANGAN** ganti swimlane di dalam branch `if/else` lalu converge — ini tidak reliable. Lebih aman: selesaikan `if/endif` dulu, baru pindah swimlane.
- Swimlane syntax harus lengkap dengan closing pipe: `|#color|Name|`
- Jika swimlane hanya perlu sekali, JANGAN pakai `switch/case` yang berpindah swimlane.

### Component / Deployment Diagram (DFD)
- **JANGAN** pakai `newpage` — hanya didukung di Sequence dan Activity diagram.
- Untuk DFD multi-level, pisah jadi beberapa blok `@startuml/@enduml` dalam satu file.

### Use Case Diagram
- Arrow relationships: gunakan `-->` (bukan `->`) untuk layout yang lebih baik antar packages.
- `<<include>>` dan `<<extend>>` diletakkan sebagai label pada arrow, bukan pada use case.

### Entity (ERD) Diagram
- **JANGAN** pakai bold/formatting di dalam entity fields.
- Gunakan `~` sebagai escape untuk generics: `List~String~` bukan `List<String>`.
- **JANGAN** pakai `!pragma graphviz_dot neato` — tidak selalu tersedia di local renderer.
- **JANGAN** pakai `@startchen/@endchen` — belum didukung oleh semua versi PlantUML extension.
- **JANGAN** pakai `linetype ortho` — menyebabkan garis menekuk (bent/siku).

### ERD Chen-notation (Simple ERD) dengan `allowmixing`
- Gunakan `allowmixing` di awal untuk mix `rectangle`, `usecase`, `diamond`.
- Entity = `rectangle`, Atribut = `usecase`, Relationship = `diamond`.
- **Layout top-down** (JANGAN pakai `left to right direction`).
- Semua koneksi atribut ke entity pakai `-down-` atau `-up-` agar garis lurus vertikal.
- Gunakan `-[hidden]right-` antar atribut se-baris untuk menjaga posisi horizontal sejajar (grid).
- Gunakan `-[hidden]down-` antar atribut baris atas dan bawah untuk menjaga kolom sejajar.
- Jika atribut banyak (>5), bagi jadi 2 baris dengan hidden link vertikal antar baris.
- **JANGAN** pakai `--` tanpa direction — Graphviz akan routing otomatis dan garis bisa menekuk/bersilangan.

### Graphviz Dependency
- ERD, Use Case, Component, Class diagram butuh Graphviz (`dot`).
- VS Code setting yang sudah dikonfigurasi: `"plantuml.commandArgs": ["-DGRAPHVIZ_DOT=/opt/homebrew/bin/dot"]`
- Jika muncul error "Cannot run program dot", pastikan Graphviz terinstall (`brew install graphviz`).

### Best Practice Multi-Diagram dalam Satu File
- Gunakan beberapa blok `@startuml DiagramName` / `@enduml` dalam satu file `.puml`.
- PlantUML extension akan menampilkan diagram pertama by default, user bisa navigate antar diagram dengan panah di preview.
- Beri nama unik pada setiap `@startuml` untuk identifikasi.
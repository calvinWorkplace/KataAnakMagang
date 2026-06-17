# KataAnakMagang

Platform komunitas berbasis web untuk mahasiswa dan anak magang — tempat berbagi pengalaman, informasi gaji, dan ulasan perusahaan secara terbuka.

[![Demo](https://img.shields.io/badge/Demo-Google%20Drive-4285F4?style=flat-square&logo=google-drive&logoColor=white)](https://drive.google.com/file/d/1iOXOLJaNvBhbJ8pz83BuDEUfTTYDjVku/view?usp=sharing)
[![Deploy](https://img.shields.io/badge/Deploy-Railway-0B0D0E?style=flat-square&logo=railway&logoColor=white)](https://kataanakmagang-production.up.railway.app/)

## Fitur

- **Komunitas** — Forum diskusi untuk berbagi cerita dan pengalaman magang
- **Gaji** — Database gaji magang yang dikontribusi oleh pengguna (anonim atau publik)
- **Perusahaan** — Direktori perusahaan lengkap dengan rating dan ulasan dari anak magang
- **Profil** — Halaman profil pengguna dengan informasi universitas dan data diri
- **Autentikasi** — Registrasi, login, dan logout dengan proteksi middleware

## Tech Stack

| Layer | Teknologi |
|-------|-----------|
| Framework | Laravel 12 (PHP 8.2) |
| Frontend | Blade Templates + Vite |
| Database | MySQL (via PDO) |
| Container | Docker + Nginx + PHP-FPM |

## Struktur Database

- `users` — Data pengguna (nama, email, universitas, profil)
- `community_posts` — Postingan komunitas/forum
- `companies` — Data perusahaan (nama, industri, lokasi, rating)
- `company_reviews` — Ulasan perusahaan dari pengguna
- `salaries` — Data gaji magang (job title, perusahaan, lokasi, nominal)

## Instalasi

### Prasyarat

- PHP >= 8.2
- Composer
- Node.js & npm
- MySQL

### Langkah Instalasi

```bash
# Clone repository
git clone https://github.com/calvinsuharjono/KataAnakMagang.git
cd KataAnakMagang

# Salin file environment
cp .env.example .env

# Install dependensi PHP
composer install

# Generate application key
php artisan key:generate

# Konfigurasi database di .env, lalu jalankan migrasi dan seeder
php artisan migrate --seed

# Install dependensi Node.js dan build aset
npm install && npm run build

# Jalankan server
php artisan serve
```

Atau gunakan script setup otomatis:

```bash
composer run setup
```

Akses aplikasi di `http://localhost:8000`

## Menjalankan dengan Docker

```bash
docker build -t kata-anak-magang .
docker run -p 8080:8080 kata-anak-magang
```

Akses aplikasi di `http://localhost:8080`

## Pengembangan

```bash
# Menjalankan semua service sekaligus (server, queue, log, vite)
composer run dev
```

## Routes

| Method | URL | Keterangan |
|--------|-----|------------|
| GET | `/` | Halaman utama |
| GET | `/communities` | Daftar postingan komunitas |
| POST | `/communities` | Buat postingan baru *(auth)* |
| DELETE | `/communities/{post}` | Hapus postingan *(auth)* |
| GET | `/salaries` | Daftar data gaji |
| POST | `/salaries` | Submit data gaji *(auth)* |
| GET | `/companies` | Daftar perusahaan |
| GET | `/companies/{company}` | Detail perusahaan *(auth)* |
| POST | `/companies/{company}/reviews` | Tulis ulasan *(auth)* |
| DELETE | `/reviews/{review}` | Hapus ulasan *(auth)* |
| GET | `/profile` | Profil pengguna *(auth)* |
| PUT | `/profile` | Update profil *(auth)* |
| GET/POST | `/login` | Login |
| GET/POST | `/register` | Registrasi |
| POST | `/logout` | Logout *(auth)* |

## Testing

```bash
composer run test
# atau
php artisan test
```
## 👥 Anggota Kelompok

| No | Nama | NIM |
|----|------|-----|
| 1 | Albert Tandy Harison | 2702225612 |
| 2 | Nikolaus Marvin Liayasa | 2702233702 |
| 3 | Calvin Suharjono | 2702225846 |
| 4 | Fransiscus Bronzedior Driandonny Noryon | 2702218992 |
| 5 | Giovincent Ricel's Tanoto | 2702226786 |

## Lisensi

MIT

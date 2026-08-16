POS WARGA — Full Stack Project Resume

Last Updated: 12 Agustus 2026
Status: Production Stable — AI CS Integrated, GA4 Analytics, Backup Strategy Ready
Google Indexing: Active — 3 Sitemap Success (37+ halaman terindeks)
Latest Deployment: d579bb3 — 12 Aug 2026 04:07 UTC ✅ Success

---

1. ARSITEKTUR HYBRID (3 PROJECT)

```
┌──────────────────────────────────────────────────────────────────┐
│                       POS WARGA ECOSYSTEM                       │
│              Platform Portal Artikel Komunitas                  │
│                   Multi-Role Author System                      │
└──────────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
┌───────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  poswarga.com │  │postingan.        │  │  ai.poswarga.com │
│  (Vanilla JS) │  │poswarga.com      │  │  (SvelteKit CSR) │
│               │  │(SvelteKit SSR)   │  │                  │
│ HTML + CSS    │  │ SEO Optimized    │  │ AI Chat Widget   │
│ Tailwind CDN  │  │ Dynamic Sitemap  │  │ GAS Backend      │
│ Font Awesome  │  │ Structured Data  │  │ OpenRouter AI    │
│ SweetAlert CDN│  │ Related Articles │  │ Google Sheets    │
│ PWA + SW      │  │ Breadcrumb LD+JSON│  │ RAG Knowledge    │
│ GA4 Analytics │  │ Views Counter    │  │ Overlay iframe   │
│ Flowbite Car. │  │ GA4 Events       │  │                  │
└───────────────┘  └──────────────────┘  └──────────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              ▼
┌──────────────────────────────────────────────────────────────────┐
│                        DATA LAYER                                │
│                                                                  │
│  ┌─────────────────┐    ┌──────────────────┐                    │
│  │   Supabase      │    │    ImageKit      │                    │
│  │   PostgreSQL    │    │    CDN Media     │                    │
│  │   + Realtime    │    │                  │                    │
│  └─────────────────┘    └──────────────────┘                    │
└──────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌──────────────────────────────────────────────────────────────────┐
│                      INFRASTRUCTURE                              │
│                                                                  │
│  ┌─────────────────┐  ┌──────────────────┐  ┌──────────────┐   │
│  │ Cloudflare Pages│  │ Cloudflare DNS   │  │Google Apps   │   │
│  │ Auto Deploy     │  │ + Worker (Edge)  │  │Script (AI CS)│   │
│  └─────────────────┘  └──────────────────┘  └──────────────┘   │
└──────────────────────────────────────────────────────────────────┘
```

---

2. STRUKTUR REPOSITORY

2.1 poswarga/000 (main) — Vanilla JS + Tailwind CDN

Domain: https://poswarga.com
Deploy: Cloudflare Pages (static)
Repo: poswarga/000
Analytics: GA4 (Measurement ID: G-XXXXXXXXXX)

Path Fungsi Auth
/ (index.html) Landing + Stats (4 kolom) + Trending + RSS Ticker + Info Board Realtime + Kategori (12) + Artikel Grid (3 kolom) + Featured Carousel (Flowbite-style) + Promo Popup + PWA + AI CS Widget + GA4 ❌
/auth/login.html Login email/password ❌
/auth/register.html Register akun baru ❌
/auth/callback.html OAuth callback handler ❌
/auth/verify.html Verifikasi email ❌
/auth/reset-password.html Reset password ❌
/user/dashboard.html Dashboard user ✅ User
/user/create-article.html Quill editor + ImageKit upload ✅ User
/user/my-articles.html Daftar artikel user ✅ User
/user/preview.html Preview sebelum submit ✅ User
/user/profile.html Edit profil ✅ User
/editor/dashboard.html Dashboard editor ✅ Editor
/editor/review.html Review queue ✅ Editor
/editor/edit-article.html Edit + publish/reject artikel ✅ Editor
/editor/preview.html Preview editor (lengkap) ✅ Editor
/member/dashboard.html Dashboard member ✅ Member
/member/articles.html Artikel member ✅ Member
/member/preview.html Preview member ✅ Member
/member/create-article.html Buat artikel (member) ✅ Member
/admin/dashboard.html Admin dashboard + Papan Pengumuman + Statistik ✅ Admin
/admin/articles/index.html Kelola Artikel + Export CSV (15 kolom: ID, Judul, Slug, Kategori, Excerpt, Isi Artikel, Penulis, Role, Editor, Status, Featured, Views, Tanggal) ✅ Admin
/admin/users.html Manajemen user ✅ Admin
/admin/settings.html Pengaturan sistem ✅ Admin
/admin/cms-ik.html ImageKit CMS (admin only) ✅ Admin
/admin/statistik-artikel.html Analisis performa artikel ✅ Admin
/tutorial.html Tutorial & Informasi (login required) ✅ All
/about.html Tentang POS WARGA ❌
/contact.html Kontak (WA: 085817543733) ❌
/privacy.html Kebijakan Privasi ❌
/terms.html Syarat Penggunaan ❌
/sw.js Service Worker (PWA) ❌
/manifest.json PWA Manifest ❌
/robots.txt Crawl directives ❌
/_headers Cloudflare HTTP headers (6 rules: noindex role paths + API) ❌
/_redirects Redirect rules (2 rules) ❌
/sitemap-static.xml Sitemap halaman statis (6 URL, lastmod auto) ❌

---

2.2 poswarga/postingan — SvelteKit SSR

Domain: https://postingan.poswarga.com
Deploy: Cloudflare Pages (SSR via adapter-cloudflare)
Analytics: GA4 (Measurement ID: G-XXXXXXXXXX)
Custom Dimensions: Article Title, Article Slug, Article Category, Author Name

Route Fungsi GA4 Events
/ List artikel published + pagination + search + filter kategori article_list_view, article_search, sort_change, category_select, category_dropdown_open, category_reset, article_click, nav_click, cta_click, reset_click, empty_state_cta_click
/posts/[slug] Detail artikel SEO (SSR) + views counter + related articles (SSR) + share + structured data GA4 page view
/sitemap.xml Dynamic sitemap generator (SSR) -
/_headers Cache rules -

---

2.3 poswarga/ai.poswarga — SvelteKit CSR

Domain: https://ai.poswarga.com
Deploy: Cloudflare Pages (static CSR)

Route Mode Fungsi
/ CSR Halaman standalone AI Chat (POSWARGA branding)
/widget CSR Widget compact untuk iframe (overlay di poswarga.com)

Komponen:

· ChatDemo.svelte — Container chat utama + scroll logic (isNearBottom)
· ChatBubble.svelte — Bubble user/AI + typing indicator (avatar "P")
· ChatInput.svelte — Textarea + auto-resize + Enter to send

Design System:

· Primary: Red #dc2626
· Avatar: Gradient red-600 → red-700 → rose-700
· User Bubble: red-500 → red-600
· AI Bubble: white/60 glassmorphism
· Font: Inter (Google Fonts)

---

3. CLOUDFLARE WORKER (poswarga-api)

Route: api.poswarga.com/* + poswarga.com/*
File: worker.js

Route Fungsi
/api/config Supabase credentials + config (CORS protected, X-Robots-Tag: noindex)
/go/[id] URL pendek → redirect 301 ke postingan.poswarga.com/posts/[slug]
/posts/[slug] Redirect 301 ke postingan.poswarga.com/posts/[slug]
/postingan Redirect 301 ke postingan.poswarga.com/
/postingan-detail Redirect 301 ke postingan.poswarga.com/posts/[slug]
/share/[slug] Redirect 301 ke subdomain
/sitemap.xml Sitemap index (dinamis)
/sitemap-static.xml Sitemap halaman statis (dinamis, lastmod auto)
/sitemap-posts.xml Legacy redirect
/webhook-supabase Webhook receiver (anti-timeout 522)

---

4. DATABASE (Supabase PostgreSQL)

4.1 Core Tables

Table Deskripsi Key Columns
profiles User profiles (auto-create via trigger) id, role, full_name, avatar_url, badge, jabatan, barcode_url, is_admin, is_active, address, alias
article_index Main article repository id, title, slug, content, excerpt, featured_image, image_caption, source_url, status, author_id, editor_id, category, views, is_featured, created_at, published_at, meta_title, meta_description, file_path
article_views Daily views tracker id, article_id, viewed_at
info_board Info/pengumuman realtime id, message, sender_name, sender_role, sender_avatar, is_active, created_at
tutorials Tutorial per role id, title, content, excerpt, role, status, order_index

4.2 Article Status Flow

```
draft ──────► pending_editor ──────► published
  │                                     │
  └───────────── rejected ◄─────────────┘
  │
  └───────────── archived
```

4.3 Row Level Security (RLS)

Table Policy
profiles Public read; user update own
article_index Public read published; author CRUD own; editor read all + update status; admin full
article_views Public insert + select
info_board Public read; admin/editor insert
tutorials Public read published

4.4 Indexes

Table Index
article_index slug, status, author_id, category, created_at
article_views viewed_at
profiles id, role

4.5 Backup Strategy

Metode: Manual JSON export via Supabase SQL Editor (akun gratis)

Backup per tabel:

```sql
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (SELECT * FROM [table_name] ORDER BY created_at DESC) t;
```

Restore per tabel:

```sql
BEGIN;
DELETE FROM [table_name];
INSERT INTO [table_name] ([columns])
SELECT [cast_expressions]
FROM jsonb_array_elements('[JSON_BACKUP_DATA]'::jsonb) AS rec;
COMMIT;
```

---

5. AI CS BACKEND (Google Apps Script)

Deploy URL: {VITE_GAS_API_URL}?q=...
File: GAS.gs v1.5

5.1 Konfigurasi

Parameter Value
Model google/gemini-2.0-flash-lite
Temperature 0.3 (patuh Sheet)
Cache 60 detik (ScriptCache)
Rate Limit 60 req/menit/IP
Max Results 5
WhatsApp 6285817543733

5.2 Google Sheet "Konteks"

Kolom Fungsi
keyword Kata kunci untuk scoring
konteks Data mentah — referensi AI
jawaban Panduan jawaban — HARUS diikuti AI
status Filter aktif/nonaktif
urutan Sort order

Total Data: 36 row FAQ POS WARGA

5.3 AI Pipeline Flow

```
User ketik → fetch GAS → keyword scoring → top 5 match →
build system prompt (KONTEKS + PANDUAN JAWABAN) →
OpenRouter API → return JSON { success, jawaban, ... } →
tampilkan di ChatBubble
```

---

6. ANALYTICS (Google Analytics 4)

6.1 Landing Page Events (poswarga.com)

Event Trigger Parameters
page_view Otomatis page_path
carousel_slide_view Auto-slide atau klik navigasi slide_index, total_slides

6.2 Artikel List Events (postingan.poswarga.com)

Event Trigger Parameters
article_list_view Halaman daftar artikel dimuat article_count, has_search, search_query, sort_type, category
article_search User mencari artikel search_term, sort, category
sort_change User mengubah urutan sort_type, current_category, search_query
category_select User memilih kategori category, action
category_dropdown_open Dropdown kategori dibuka -
category_reset Reset filter kategori previous_category
article_click User klik artikel article_title, article_slug, article_category, author_name, position_in_list
nav_click User klik navigasi destination
cta_click User klik CTA cta_type, location
reset_click User klik reset page
empty_state_cta_click Klik CTA di halaman kosong -

6.3 Custom Dimensions

Dimension Parameter
Article Title article_title
Article Slug article_slug
Article Category article_category
Author Name author_name

---

7. SEO & INDEXING

7.1 Status Terkini (12 Agustus 2026)

Sitemap Halaman Status
sitemap.xml 3 index ✅ Success
postingan.poswarga.com/sitemap.xml 37+ artikel ✅ Success
sitemap-static.xml 6 halaman statis ✅ Success

7.2 SEO Features

· ✅ SvelteKit SSR — konten terbaca Googlebot tanpa JS
· ✅ Related articles server-side rendered (ikut SSR untuk SEO)
· ✅ Dynamic sitemap (SSR + Worker)
· ✅ Structured Data: NewsArticle + BreadcrumbList
· ✅ Meta tags: OG, Twitter Card, canonical
· ✅ <noscript> fallback di semua halaman artikel
· ✅ Redirect 301 dari URL lama ke subdomain baru
· ✅ Cache-Control headers

7.3 Crawl Protection

File Aturan
robots.txt (web utama) Disallow: /admin/, /editor/, /member/, /user/, /auth/, /api/
robots.txt (subdomain) Disallow: /api/, /_app/
_headers (6 rules) X-Robots-Tag: noindex, nofollow untuk folder role & API
_redirects (2 rules) Redirect rules

7.4 Known Issues & Fixes

Issue Status Fix Applied
www.poswarga.com 403 ✅ Fixed WWW redirect 301 via Cloudflare
api.poswarga.com/api/config 403 ✅ Fixed Worker header X-Robots-Tag: noindex + robots.txt Disallow: /api/
sitemap-static.xml broken URLs ✅ Fixed URL diubah dari /about → /about.html
SvelteKit /_app/ blocked ⚠️ Normal Tidak memengaruhi indexing (SSR + noscript)

---

8. MEDIA (ImageKit CDN)

Folder Konten
/poswarga/articles/{id}/ Featured image + content images
/poswarga/avatars/{id}/ User avatars
/poswarga/assets/ Logo, icon, writer illustration

Upload: Client-side via ImageKit SDK di Quill editor + ImageKit CMS (admin only)

---

9. REALTIME FEATURES

Widget Channel Lokasi
Info Board (Papan Pengumuman) Supabase Realtime info_board index.html floating widget
Views Counter Increment server-side +page.server.js Detail artikel
Status Notifikasi Supabase Auth state change Semua dashboard

---

10. ROLE SYSTEM

Role Icon Dashboard Write Review Admin Panel
user 👤 ✅ ✅ ❌ ❌
member ⭐ ✅ ✅ ❌ ❌
editor ✍️ ✅ ✅ ✅ ❌
admin 👑 ✅ ✅ ✅ ✅

Badge Penulis (Auto-calculated)

Badge Kriteria
🥇 Emas ≥6 artikel dalam 7 hari
🥈 Perak ≥3 artikel dalam 7 hari
🥉 Perunggu ≥4 artikel dalam 30 hari

---

11. CDN DEPENDENCIES (Tidak Boleh Diubah)

```html
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap">
```

---

12. PWA CONFIGURATION

```json
{
  "name": "POS WARGA",
  "short_name": "POSWARGA",
  "start_url": "/",
  "display": "standalone",
  "theme_color": "#dc2626",
  "background_color": "#ffffff"
}
```

Service Worker: sw.js — caching aset statis + offline fallback
Install Prompt: Floating button PWA (biru, bottom: 150px)

---

13. KEY FEATURES LANDING PAGE (index.html)

Widget Posisi Sumber Data
DateTime realtime Top bar JS Date()
RSS Ticker Top bar (scrolling) RSS Worker
Hero Section Atas article_index aggregate
Statistik (4 kolom) Hero Artikel, Penulis, Total Views, Views Hari Ini
Featured Carousel (Flowbite-style) Kiri article_index.is_featured = true
Trending Sticky Kanan ORDER BY views DESC LIMIT 5
Kategori (12 item) Tengah Filter article_index.category
Article Grid (3 kolom) Bawah published, !is_featured, LIMIT 9
Info Board (Papan) Floating info_board realtime
POSWARGA AI Widget Overlay (trigger: floating button) ai.poswarga.com/widget via iframe
Promo Popup Overlay 10 detik interval
Floating WA Floating 085817543733
Back to Top Floating Scroll detection
Dark Mode Toggle Navbar localStorage
PWA Install Floating beforeinstallprompt
Footer CMS Bawah Dynamic from CMS API

---

14. EXPORT CSV (Admin Dashboard)

Fitur: Download semua artikel dalam format CSV dari admin/articles/index.html

Kolom Format
ID Integer
Judul String (escaped)
Slug String (escaped)
Kategori String
Excerpt String (escaped)
Isi Artikel Plain text (HTML stripped)
Penulis String
Role Penulis String
Editor String
Status String
Featured Ya/Tidak
Views Integer
Tanggal Dibuat dd/mm/yyyy, hh.mm.ss
Tanggal Update dd/mm/yyyy, hh.mm.ss
Tanggal Publish dd/mm/yyyy, hh.mm.ss

Spesifikasi:

· Separator: ; (kompatibel Google Sheets Indonesia)
· BOM UTF-8 di awal file
· Batch fetch 1000 data per request
· Menghormati filter status, role, search yang sedang aktif
· Nama file: poswarga_articles_[YYYY-MM-DD].csv

---

15. COLOR SCHEME PER ROLE

Role Primary Secondary Background
Public/SSR Red #dc2626 Green #16a34a White
User Yellow #eab308 Amber Yellow-50
Member Blue #3b82f6 Indigo Blue-50
Editor Green #10b981 Emerald Green-50
Admin Purple #8b5cf6 Violet Purple-50
AI CS Red #dc2626 Rose White/glass

---

16. API ENDPOINTS

Endpoint Method Fungsi
https://api.poswarga.com/api/config GET Supabase credentials + config (CORS, X-Robots-Tag: noindex)
Supabase REST /rest/v1/* GET/POST/PUT Database operations
Supabase Auth - Login/register/session
ImageKit Upload API POST Media upload
RSS Worker GET External news aggregation
/webhook-supabase POST Supabase webhook receiver
{VITE_GAS_API_URL}?q=... GET AI CS query (GAS → OpenRouter)

---

17. DEPLOYMENT PIPELINE

```
GitHub poswarga/000 ─────────► Cloudflare Pages (main → production)
GitHub poswarga/postingan ───► Cloudflare Pages (main → production, SSR)
GitHub poswarga/ai.poswarga ─► Cloudflare Pages (main → production, CSR)
Cloudflare Worker ────────────► api.poswarga.com + poswarga.com routes
Google Apps Script ───────────► AI CS Backend (VITE_GAS_API_URL)
```

· Branch: main auto-deploy
· Build main: None (static HTML)
· Build postingan: npm run build → @sveltejs/adapter-cloudflare
· Build ai.poswarga: npm run build → @sveltejs/adapter-cloudflare
· DNS: Cloudflare

---

18. URL PENTING

Resource URL
Landing Page https://poswarga.com
Artikel (SSR) https://postingan.poswarga.com
AI CS Standalone https://ai.poswarga.com
AI CS Widget https://ai.poswarga.com/widget
GAS Backend {VITE_GAS_API_URL}
OpenRouter API https://openrouter.ai/api/v1/chat/completions
API Config https://api.poswarga.com/api/config
WhatsApp https://wa.me/6285817543733

---

19. KNOWN CONSTRAINTS (BY DESIGN)

1. ❌ Jangan ubah SSR artikel ke SPA — SEO prioritas utama
2. ❌ Jangan ganti CDN dependencies (Tailwind, Font Awesome, SweetAlert)
3. ❌ Jangan optimasi agresif demi Lighthouse score
4. ✅ Pagespeed kuning (60–80) normal
5. ✅ Fokus: stabilitas, UX, indexing Google
6. ✅ Konten bebas — tidak ada minimal kata
7. ✅ Tidak ada batasan gambar dalam konten
8. ✅ AI CS response tidak streaming (utuh)
9. ✅ AI CS belum ada conversation memory
10. ✅ AI CS rate limit GAS ~20.000/hari (akun gratis)
11. ✅ Backup manual via JSON export (Supabase akun gratis)
12. ✅ Related articles server-side rendered (ikut SSR)

---

20. RECENT CHANGELOG

Tanggal Perubahan
12 Agu 2026 Export CSV artikel dari admin dashboard (15 kolom, termasuk isi artikel)
12 Agu 2026 Related articles server-side rendered (ikut SSR untuk SEO)
2 Agu 2026 GA4 Custom Dimensions + Event Tracking (11 events di halaman artikel)
2 Agu 2026 GA4 page view + carousel event di landing page
31 Jul 2026 Fix robots.txt, sitemap-static.xml, _headers untuk 403 errors
1 Jul 2026 AI CS POSWARGA terintegrasi sebagai overlay widget
30 Jun 2026 Sitemap bersih — GSC 3 sitemap success (37 halaman)
27 Jun 2026 Worker update: redirect ke postingan.poswarga.com
24 Jun 2026 Stat "Pembaca Hari Ini"
22 Jun 2026 robots.txt + _headers noindex
Jun 2026 Production stable, indexing aktif

---

21. QUICK STATS

```
╔═══════════════════════════════════════╗
║     POS WARGA — ECOSYSTEM STATS      ║
╠═══════════════════════════════════════╣
║  Projects            : 3             ║
║  Domains             : 3             ║
║  Repos               : 1 (000)       ║
║  Database            : Supabase PG   ║
║  Media CDN           : ImageKit      ║
║  AI Model            : Gemini Flash  ║
║  AI Temperature      : 0.3           ║
║  AI Cache            : 60 detik      ║
║  AI Rate Limit       : 60/min/IP     ║
║  AI FAQ Rows         : 36            ║
║  SEO Sitemaps        : 3 (37+ pages) ║
║  Roles               : 4             ║
║  Article Status      : 5             ║
║  Pagespeed Target    : 60-80 (kuning)║
║  CDN Dependencies    : 5             ║
║  GA4 Events          : 13            ║
║  GA4 Custom Dims     : 4             ║
║  CSV Export Columns  : 15            ║
║  Header Rules        : 6             ║
║  Redirect Rules      : 2             ║
║  Production Status   : ✅ STABLE     ║
║  AI CS Integrated    : ✅ (overlay)  ║
║  GA4 Integrated      : ✅ (dual)     ║
║  Backup Strategy     : ✅ (JSON)     ║
║  CSV Export          : ✅ (full)     ║
║  Google Indexing     : ✅ Active     ║
╚═══════════════════════════════════════╝
```

---

End of Resume. Production stable, 3 project terintegrasi, AI CS widget aktif, GA4 analytics dual tracking, backup strategy ready, CSV export dari admin dashboard, Google indexing berjalan, semua fitur berfungsi normal.

```
╔═══════════════════════════════════════╗
║   🚀 POS WARGA — FULL ECOSYSTEM     ║
║  ✅ poswarga.com                    ║
║  ✅ postingan.poswarga.com          ║
║  ✅ ai.poswarga.com                 ║
║  ✅ AI CS Widget Integrated         ║
║  ✅ GA4 Dual Tracking               ║
║  ✅ CSV Export (15 columns)         ║
║  ✅ 3 Sitemap Success               ║
║  ✅ Backup Strategy Ready           ║
║  ✅ Production Grade                ║
║                                     ║
║  WARGA BERKARYA, WARGA BERDAYA     ║
║     🔥🚀🇮🇩 PRODUCTION STABLE        ║
╚═══════════════════════════════════════╝
```

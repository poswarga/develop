-- ============================================================
-- RESTORE: profiles
-- Hapus data lama, lalu insert data backup
-- ============================================================

BEGIN;

-- Hapus data lama (hati-hati!)
DELETE FROM profiles;

-- Insert data backup (ganti [...] dengan data JSON dari hasil backup)
INSERT INTO profiles (
  id, full_name, email, phone, role, avatar_url, bio, 
  badge, jabatan, barcode_url, is_admin, is_active,
  address, alias, created_at, updated_at, upgraded_at
)
SELECT 
  rec->>'id',
  rec->>'full_name',
  rec->>'email',
  rec->>'phone',
  rec->>'role',
  rec->>'avatar_url',
  rec->>'bio',
  rec->>'badge',
  rec->>'jabatan',
  rec->>'barcode_url',
  (rec->>'is_admin')::boolean,
  (rec->>'is_active')::boolean,
  rec->>'address',
  rec->>'alias',
  (rec->>'created_at')::timestamptz,
  (rec->>'updated_at')::timestamptz,
  (rec->>'upgraded_at')::timestamptz
FROM jsonb_array_elements('[COPY_JSON_BACKUP_DISINI]'::jsonb) AS rec;

COMMIT;
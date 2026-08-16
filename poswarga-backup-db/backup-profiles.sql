-- ============================================================
-- BACKUP: profiles
-- ============================================================

-- 1A. Lihat struktur tabel
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'profiles'
ORDER BY ordinal_position;

-- 1B. Export semua data sebagai JSON (copy hasilnya)
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM profiles ORDER BY created_at DESC
) t;

-- 1C. Atau export sebagai CSV readable (copy hasilnya)
SELECT 
  id,
  full_name,
  email,
  phone,
  role,
  avatar_url,
  bio,
  badge,
  jabatan,
  barcode_url,
  is_admin,
  is_active,
  address,
  alias,
  created_at,
  updated_at,
  upgraded_at
FROM profiles
ORDER BY created_at DESC;
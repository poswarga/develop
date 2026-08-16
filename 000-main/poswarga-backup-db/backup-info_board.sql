-- ============================================================
-- BACKUP: info_board
-- ============================================================

-- 4A. Struktur tabel
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'info_board'
ORDER BY ordinal_position;

-- 4B. Export sebagai JSON
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM info_board ORDER BY created_at DESC
) t;

-- 4C. Export sebagai CSV
SELECT 
  id,
  message,
  sender_name,
  sender_role,
  sender_avatar,
  is_active,
  created_at
FROM info_board
ORDER BY created_at DESC;
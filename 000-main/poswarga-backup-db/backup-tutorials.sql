-- ============================================================
-- BACKUP: tutorials
-- ============================================================

-- 5A. Struktur tabel
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'tutorials'
ORDER BY ordinal_position;

-- 5B. Export sebagai JSON
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM tutorials ORDER BY order_index ASC
) t;

-- 5C. Export sebagai CSV
SELECT 
  id,
  title,
  content,
  excerpt,
  role,
  status,
  order_index,
  created_at
FROM tutorials
ORDER BY order_index ASC;
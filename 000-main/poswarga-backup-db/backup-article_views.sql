-- ============================================================
-- BACKUP: article_views
-- ============================================================

-- 3A. Struktur tabel
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'article_views'
ORDER BY ordinal_position;

-- 3B. Export sebagai JSON
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM article_views ORDER BY viewed_at DESC
) t;

-- 3C. Export sebagai CSV
SELECT 
  id,
  article_id,
  viewed_at
FROM article_views
ORDER BY viewed_at DESC;
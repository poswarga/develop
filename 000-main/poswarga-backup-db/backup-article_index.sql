-- ============================================================
-- BACKUP: article_index
-- ============================================================

-- 2A. Lihat struktur tabel
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'article_index'
ORDER BY ordinal_position;

-- 2B. Export sebagai JSON
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM article_index ORDER BY created_at DESC
) t;

-- 2C. Export sebagai CSV readable (copy hasilnya)
SELECT 
  id,
  author_id,
  author_name,
  title,
  slug,
  content,
  excerpt,
  featured_image,
  image_caption,
  source_url,
  status,
  views,
  category,
  is_featured,
  editor_id,
  editor_note,
  rejection_note,
  meta_title,
  meta_description,
  created_at,
  updated_at,
  published_at,
  reviewed_at,
  archived_at,
  reviewed_by,
  review_notes,
  editor_name,
  file_path
FROM article_index
ORDER BY created_at DESC;
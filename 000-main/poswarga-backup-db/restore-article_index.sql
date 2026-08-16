-- ============================================================
-- RESTORE: article_index
-- ============================================================

BEGIN;

DELETE FROM article_index;

INSERT INTO article_index (
  id, author_id, author_name, title, slug, content,
  excerpt, featured_image, image_caption, source_url,
  status, views, category, is_featured, editor_id,
  editor_note, rejection_note, meta_title, meta_description,
  created_at, updated_at, published_at, reviewed_at,
  archived_at, reviewed_by, review_notes, editor_name, file_path
)
SELECT 
  (rec->>'id')::int,
  rec->>'author_id',
  rec->>'author_name',
  rec->>'title',
  rec->>'slug',
  rec->>'content',
  rec->>'excerpt',
  rec->>'featured_image',
  rec->>'image_caption',
  rec->>'source_url',
  rec->>'status',
  (rec->>'views')::int,
  rec->>'category',
  (rec->>'is_featured')::boolean,
  rec->>'editor_id',
  rec->>'editor_note',
  rec->>'rejection_note',
  rec->>'meta_title',
  rec->>'meta_description',
  (rec->>'created_at')::timestamptz,
  (rec->>'updated_at')::timestamptz,
  (rec->>'published_at')::timestamptz,
  (rec->>'reviewed_at')::timestamptz,
  (rec->>'archived_at')::timestamptz,
  rec->>'reviewed_by',
  rec->>'review_notes',
  rec->>'editor_name',
  rec->>'file_path'
FROM jsonb_array_elements('[COPY_JSON_BACKUP_DISINI]'::jsonb) AS rec;

COMMIT;
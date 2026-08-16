-- ============================================================
-- RESTORE: article_views
-- ============================================================

BEGIN;

DELETE FROM article_views;

INSERT INTO article_views (id, article_id, viewed_at)
SELECT 
  (rec->>'id')::int,
  (rec->>'article_id')::int,
  (rec->>'viewed_at')::timestamptz
FROM jsonb_array_elements('[COPY_JSON_BACKUP_DISINI]'::jsonb) AS rec;

COMMIT;
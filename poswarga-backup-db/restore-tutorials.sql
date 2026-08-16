-- ============================================================
-- RESTORE: tutorials
-- ============================================================

BEGIN;

DELETE FROM tutorials;

INSERT INTO tutorials (
  id, title, content, excerpt, role,
  status, order_index, created_at
)
SELECT 
  (rec->>'id')::int,
  rec->>'title',
  rec->>'content',
  rec->>'excerpt',
  rec->>'role',
  rec->>'status',
  (rec->>'order_index')::int,
  (rec->>'created_at')::timestamptz
FROM jsonb_array_elements('[COPY_JSON_BACKUP_DISINI]'::jsonb) AS rec;

COMMIT;
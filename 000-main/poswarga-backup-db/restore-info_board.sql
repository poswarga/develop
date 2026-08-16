-- ============================================================
-- RESTORE: info_board
-- ============================================================

BEGIN;

DELETE FROM info_board;

INSERT INTO info_board (
  id, message, sender_name, sender_role,
  sender_avatar, is_active, created_at
)
SELECT 
  (rec->>'id')::int,
  rec->>'message',
  rec->>'sender_name',
  rec->>'sender_role',
  rec->>'sender_avatar',
  (rec->>'is_active')::boolean,
  (rec->>'created_at')::timestamptz
FROM jsonb_array_elements('[COPY_JSON_BACKUP_DISINI]'::jsonb) AS rec;

COMMIT;
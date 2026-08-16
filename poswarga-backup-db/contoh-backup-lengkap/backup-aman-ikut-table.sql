-- ============================================================
-- BACKUP: profiles (Otomatis - Paling Aman)
-- ============================================================

-- Export semua data sebagai JSON
SELECT jsonb_agg(row_to_json(t)) AS backup_data
FROM (
  SELECT * FROM profiles ORDER BY created_at DESC
) t;
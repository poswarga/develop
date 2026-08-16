-- Lihat constraint primary key
SELECT 
  con.conname AS constraint_name,
  con.contype AS constraint_type,
  col.column_name
FROM pg_constraint con
JOIN pg_class rel ON rel.oid = con.conrelid
JOIN pg_namespace nsp ON nsp.oid = rel.relnamespace
JOIN pg_attribute att ON att.attnum = ANY(con.conkey)
JOIN pg_class attrel ON attrel.oid = att.attrelid
JOIN information_schema.columns col ON col.column_name = att.attname AND col.table_name = rel.relname
WHERE nsp.nspname = 'public'
  AND rel.relname = 'profiles'
  AND con.contype = 'p';
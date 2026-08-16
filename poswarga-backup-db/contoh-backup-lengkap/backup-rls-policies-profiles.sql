-- Lihat semua policy
SELECT 
  polname,
  polcmd,
  polqual,
  polwithcheck
FROM pg_policies
WHERE schemaname = 'public' 
  AND tablename = 'profiles';
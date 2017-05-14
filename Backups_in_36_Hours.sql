-- This is a demo file.
-- Number of databases not backed up within the past 36 hours
-- Edited this file again.
/*
  You should really add some more comments in here.
*/

SELECT COUNT(*) 
FROM master.dbo.sysdatabases sbd
WHERE name NOT IN ('master','model','msdb','tempdb','distribution')
and not exists (
select * from msdb.dbo.backupset bs
where sbd.name = bs.database_name
and bs.type = 'D'
and bs.backup_finish_date >= DATEADD(HH,-36,getdate()))
--and bs.backup_finish_date >= DATEADD(hh,-24,getdate()))

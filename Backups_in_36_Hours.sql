-- This is a demo file.
-- Number of databases not backed up within the past 36 hours
-- Edited this file again.
/*
  You should really add some more comments in here.
*/

select COUNT(*) 
from master.dbo.sysdatabases sbd
where name not in ('master','model','msdb','tempdb','distribution')
and not exists (
select * from msdb.dbo.backupset bs
where sbd.name = bs.database_name
and bs.type = 'D'
and bs.backup_finish_date >= DATEADD(hh,-36,getdate()))
--and bs.backup_finish_date >= DATEADD(hh,-24,getdate()))

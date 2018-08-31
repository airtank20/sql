
USE msdb
-- update new database for Ola's scripts
SELECT 'exec msdb.dbo.sp_update_jobstep @job_id = ''' + cast(sjs.job_id as varchar(40)) + ''', @step_id = ' + cast(sjs.step_id as varchar(2)) + ', @command = ''' + REPLACE(REPLACE(command, '-d master', '-d DBAUtility'''), CHAR(39), '''''') + '''',*
FROM msdb.dbo.sysjobsteps sjs
	INNER JOIN msdb.dbo.sysjobs sj ON sjs.job_id = sj.job_id
WHERE sj.description LIKE '%ola.hallengren.com%'
	AND sjs.command LIKE '%-d % -Q%'
	AND sjs.step_name NOT LIKE 'sp_%'

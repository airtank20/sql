


select 'EXEC msdb.dbo.sp_update_job @job_id=N''' + cast(job_id as varchar(36)) + ''',
		@notify_level_email=2, 
		@notify_email_operator_name = ''[OperatorNameGoesHere]'''
		,* from msdb.dbo.sysjobs
where notify_level_email <> 2 -- on failure
	and description LIKE '%ola.hallengren.com%'
	order by name asc


-- status of queries for the same login
SELECT er.session_id
, percent_complete
, CONVERT(VARCHAR(12), DATEADD(ss, estimated_completion_time / 1000,CONVERT(DATETIME, '1/1/1999')), 114) AS [Time Remaining]
, er.start_time
, er.command
, er.sql_handle
, er.plan_handle 
FROM sys.dm_exec_requests er
	INNER JOIN sys.dm_exec_sessions es on er.session_id = es.session_id
WHERE es.login_name = suser_sname()
	and es.session_id <> @@spid




DECLARE @operator VARCHAR(50) = 'SQLAdmins'
DECLARE @notificationmethod TINYINT = 1 -- 1 email, 2 pager, 4 net send
DECLARE @delay INT = 600 -- seconds
DECLARE @alerts TABLE (alertName varchar(100), severity CHAR(5), messageid CHAR(5), processed bit DEFAULT(0))
DECLARE @sql VARCHAR(1000)

-- check first to see if operator exists
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysoperators WHERE name = @operator)
	BEGIN
		PRINT 'Operator does not exist'
	END

INSERT @alerts (alertName, severity, messageID)
	select 	'017- Insufficient Resources', 17, 0 UNION
	select 	'018- Nonfatal Internal Error', 18, 0 UNION
	select 	'019- Fatal Error in Resource', 19, 0 UNION
	select 	'020- Fatal Error in Current Process', 20, 0 UNION
	select 	'021- Fatal Error in Database Processes', 21, 0 UNION
	select 	'022- Fatal Error: Table Integrity Suspect', 22, 0 UNION
	select 	'023- Fatal Error: Database Integrity Suspect', 23, 0 UNION
	select 	'024- Fatal Error: Hardware', 24, 0 UNION
	select 	'025- Fatal Error', 25, 0 UNION
	select 	'2570- Data Purity Error', 2570, 0 UNION
	select 	'823- Read/Write Failure', 0, 823 UNION
	select 	'824- Data Retriveal SAN Slowdown Page Error', 0, 824 UNION
	select 	'825- I/O subsystem is going wrong Read-Retry Required', 0, 825 UNION
	select 	'833- In Memory Check Sum Failure', 0, 833

SELECT 'IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name=''' + alertName + ''')
	BEGIN
		EXEC msdb.dbo.sp_add_alert @name=N''' + alertName + ''',
		 @message_id=' + messageID + ',
		 @severity=' + severity + ',
		 @enabled=1,
		 @delay_between_responses=' + CAST(@delay AS VARCHAR) + ',
		 @include_event_description_in=2,
		 @job_id=N''00000000-0000-0000-0000-000000000000''
	END
GO	
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = ''' + @operator + ''' AND
						sa.name = ''' + alertName + ''')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N''' + alertName + ''', @operator_name=N''' + @operator + ''', @notification_method = 1;
	END
GO'
FROM @alerts

IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name='017- Insufficient Resources')
   BEGIN    
	EXEC msdb.dbo.sp_add_alert @name=N'017- Insufficient Resources',     
		@message_id=0    ,     
		@severity=17   ,     
		@enabled=1,     
		@delay_between_responses=600,     
		@include_event_description_in=2,     
		@job_id=N'00000000-0000-0000-0000-000000000000'   
	END
GO   
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
	INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id        
	INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id       
WHERE so.name = 'SQLAdmins' AND sa.name = '017- Insufficient Resources')
	BEGIN    
		EXEC msdb.dbo.sp_add_notification 
			@alert_name=N'017- Insufficient Resources', 
			@operator_name=N'SQLAdmins', 
			@notification_method = 1;   
	END  
GO
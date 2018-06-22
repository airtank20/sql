USE [msdb];
GO

DECLARE @delay INT = 600
DECLARE @operator VARCHAR(50) = 'SQLAdmins'

/****** Object:  Alert [017- Insufficient Resources]    Script Date: 12/22/2016 9:01:14 AM ******/
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name='017- Insufficient Resources')
BEGIN
	EXEC msdb.dbo.sp_add_alert @name = N'017- Insufficient Resources',
                           @message_id = 0,
                           @severity = 17,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
END
						   
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '017- Insufficient Resources')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'017- Insufficient Resources', @operator_name=@operator, @notification_method = 1;
	END


/****** Object:  Alert [018- Nonfatal Internal Error]    Script Date: 12/22/2016 9:01:18 AM ******/
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name='018- Nonfatal Internal Error')
BEGIN
	EXEC msdb.dbo.sp_add_alert @name = N'018- Nonfatal Internal Error',
                           @message_id = 0,
                           @severity = 18,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
END

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '018- Nonfatal Internal Error')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'018- Nonfatal Internal Error', @operator_name=@operator, @notification_method = 1;
	END


/****** Object:  Alert [019- Fatal Error in Resource]    Script Date: 12/22/2016 9:01:25 AM ******/
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name='019- Fatal Error in Resource')
BEGIN
	EXEC msdb.dbo.sp_add_alert @name = N'019- Fatal Error in Resource',
                           @message_id = 0,
                           @severity = 19,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
 END

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '019- Fatal Error in Resource')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'019- Fatal Error in Resource', @operator_name=@operator, @notification_method = 1;
	END

/****** Object:  Alert [020- Fatal Error in Current Process]    Script Date: 12/22/2016 9:01:30 AM ******/
IF NOT EXISTS (SELECT 1 FROM msdb.dbo.sysalerts WHERE name='020- Fatal Error in Current Process')
BEGIN
	EXEC msdb.dbo.sp_add_alert @name = N'020- Fatal Error in Current Process',
                           @message_id = 0,
                           @severity = 20,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
END
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '020- Fatal Error in Current Process')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'020- Fatal Error in Current Process', @operator_name=@operator, @notification_method = 1;
	END
 
/****** Object:  Alert [021- Fatal Error in Database Processes]    Script Date: 12/22/2016 9:01:35 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'021- Fatal Error in Database Processes',
                           @message_id = 0,
                           @severity = 21,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';

 
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '021- Fatal Error in Database Processes')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'021- Fatal Error in Database Processes', @operator_name= @operator, @notification_method = 1;
	END

/****** Object:  Alert [022- Fatal Error: Table Integrity Suspect]    Script Date: 12/22/2016 9:01:40 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'022- Fatal Error: Table Integrity Suspect',
                           @message_id = 0,
                           @severity = 22,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '022- Fatal Error: Table Integrity Suspect')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'022- Fatal Error: Table Integrity Suspect', @operator_name= @operator, @notification_method = 1;
	END

/****** Object:  Alert [023- Fatal Error: Database Integrity Suspect]    Script Date: 12/22/2016 9:01:45 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'023- Fatal Error: Database Integrity Suspect',
                           @message_id = 0,
                           @severity = 23,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '023- Fatal Error: Database Integrity Suspect')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'023- Fatal Error: Database Integrity Suspect', @operator_name= @operator, @notification_method = 1;
	END

/****** Object:  Alert [024- Fatal Error: Hardware]    Script Date: 12/22/2016 9:01:50 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'024- Fatal Error: Hardware',
                           @message_id = 0,
                           @severity = 24,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '024- Fatal Error: Hardware')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'024- Fatal Error: Hardware', @operator_name= @operator, @notification_method = 1;
	END
 
/****** Object:  Alert [025- Fatal Error]    Script Date: 12/22/2016 9:01:56 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'025- Fatal Error',
                           @message_id = 0,
                           @severity = 25,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
 
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '025- Fatal Error')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'025- Fatal Error', @operator_name=@operator, @notification_method = 1;
	END
 
/****** Object:  Alert [2570 - Data Purity Error]    Script Date: 12/22/2016 9:02:01 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'2570 - Data Purity Error',
                           @message_id = 2570,
                           @severity = 0,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @category_name = N'[Uncategorized]';
 
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '2570 - Data Purity Error')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'2570 - Data Purity Error', @operator_name=@operator, @notification_method = 1;
	END
 
/****** Object:  Alert [823- Read/Write Failure]    Script Date: 12/22/2016 9:02:06 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'823- Read/Write Failure',
                           @message_id = 823,
                           @severity = 0,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 0,
                           @category_name = N'[Uncategorized]';
IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '823- Read/Write Failure')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'823- Read/Write Failure', @operator_name=@operator, @notification_method = 1;
	END

/****** Object:  Alert [824- Data Retriveal SAN Slowdown Page Error]    Script Date: 12/22/2016 9:02:10 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'824- Data Retriveal SAN Slowdown Page Error',
                           @message_id = 824,
                           @severity = 0,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 1,
                           @notification_message = N'SQL Server has actually tried that I/O a total of 4 times before it finally declares a lost cause',
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '824- Data Retriveal SAN Slowdown Page Error')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'824- Data Retriveal SAN Slowdown Page Error', @operator_name=@operator, @notification_method = 1;
	END

/****** Object:  Alert [825-  I/O subsystem is going wrong Read-Retry Required]    Script Date: 12/22/2016 9:02:15 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'825- I/O subsystem is going wrong Read-Retry Required',
                           @message_id = 825,
                           @severity = 0,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 0,
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '825- I/O subsystem is going wrong Read-Retry Required')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'825- I/O subsystem is going wrong Read-Retry Required', @operator_name=@operator, @notification_method = 1;
	END
 
/****** Object:  Alert [833- In Memory Check Sum Failure]    Script Date: 12/22/2016 9:02:20 AM ******/
EXEC msdb.dbo.sp_add_alert @name = N'833- In Memory Check Sum Failure',
                           @message_id = 833,
                           @severity = 0,
                           @enabled = 1,
                           @delay_between_responses = @delay,
                           @include_event_description_in = 0,
                           @category_name = N'[Uncategorized]';

IF NOT EXISTS( SELECT 1 FROM msdb.dbo.sysnotifications sy
						INNER JOIN msdb.dbo.sysalerts sa ON sy.alert_id = sa.id
						INNER JOIN msdb.dbo.sysoperators so ON sy.operator_id = so.id
					WHERE so.name = 'SQLAdmins' AND
						sa.name = '833- In Memory Check Sum Failure')
	BEGIN
		EXEC msdb.dbo.sp_add_notification @alert_name=N'833- In Memory Check Sum Failure', @operator_name=@operator, @notification_method = 1;
	END
GO


USE [msdb]
GO
EXEC msdb.dbo.sp_update_job @job_id=N'48e55fd3-7a05-4166-8596-c4baf9468fd9', 
		@notify_level_email=2, 
		@notify_level_page=2, 
		@notify_email_operator_name=N'SQLAdmins'
GO

-- NOTE: You will need to turn OFF SQLCMD mode if it is enable for this to work

;WITH myCTE AS (
    SELECT 'IndexOptimize - USER_DATABASES' AS 'Name', 'UserDBs' AS 'FilePart' UNION
    SELECT 'DatabaseBackup - USER_DATABASES - LOG', 'UserDBs_LOG' UNION
    SELECT 'DatabaseBackup - USER_DATABASES - FULL', 'UserDBs_FULL' UNION
    SELECT 'DatabaseBackup - USER_DATABASES - DIFF', 'UserDBs_DIFF' UNION
    SELECT 'DatabaseIntegrityCheck - SYSTEM_DATABASES', 'SystemDBs' UNION
    SELECT 'DatabaseBackup - SYSTEM_DATABASES - FULL', 'SystemDBs_FULL' UNION
    SELECT 'DatabaseIntegrityCheck - USER_DATABASES', 'UserDBs' 
)
SELECT output_file_name, REPLACE(output_file_name,'$(ESCAPE_SQUOTE(JOBID))', m.FilePart) AS 'Updated_Output_File_Name'
, 'EXEC sp_update_jobstep @job_id =''' + CAST(sjs.job_id AS VARCHAR(36)) + ''', @step_id= ' + CAST(sjs.step_id AS VARCHAR(10)) + ', @output_file_name = ''' + REPLACE(output_file_name,'$(ESCAPE_SQUOTE(JOBID))', m.FilePart) + ''''
  ,* FROM dbo.sysjobsteps sjs
	INNER JOIN myCTE m ON sjs.step_name = m.name 
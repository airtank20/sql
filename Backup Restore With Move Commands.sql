
DECLARE @date CHAR(8)
SET @date = (SELECT CONVERT(char(8), GETDATE(), 112))

DECLARE @path VARCHAR(125)
SET @path = '\\UNCPath\Folder\'

;WITH MoveCmdCTE ( DatabaseName, MoveCmd )
          AS ( SELECT DISTINCT
                        DB_NAME(database_id) ,
                        STUFF((SELECT   ' ' + CHAR(13)+', MOVE ''' + name + ''''
                                        + CASE Type
                                            WHEN 0 THEN ' TO ''D:\SQLData\'
                                            ELSE ' TO ''E:\SQLTLogs\'
                                          END
                                        + REVERSE(LEFT(REVERSE(physical_name),
                                                       CHARINDEX('\',
                                                              REVERSE(physical_name),
                                                              1) - 1)) + ''''
                               FROM     sys.master_files sm1
                               WHERE    sm1.database_id = sm2.database_ID
                        FOR   XML PATH('') ,
                                  TYPE).value('.', 'varchar(max)'), 1, 1, '') AS MoveCmd
               FROM     sys.master_files sm2
  )
SELECT
	'BACKUP DATABASE ' + name + ' TO DISK = ''' + @path + '' + name + '_COPY_ONLY_' + @date + '.bak'' WITH COMPRESSION, COPY_ONLY, STATS=5',
	'RESTORE DATABASE '+ name + ' FROM DISK = ''' + @path + '' + name + '_COPY_ONLY_' + @date + '.bak'' WITH RECOVERY, REPLACE, STATS=5 ' + movecmdCTE.MoveCmd
FROM sys.databases d
	INNER JOIN MoveCMDCTE ON d.name = movecmdcte.databasename
WHERE d.name LIKE '%DatabaseName%'
GO
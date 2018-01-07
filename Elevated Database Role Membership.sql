
DECLARE @dbs AS TABLE ( name sysname, processed BIT)
DECLARE @x INT = 1
DECLARE @sql VARCHAR (2000)
DECLARE @dbName VARCHAR (50)

IF object_id ('tempdb..#results') IS NOT NULL
        BEGIN
               DROP TABLE #results
        END

CREATE TABLE #results ( dbName sysname
                        , principalName VARCHAR (100)
                        , principalType VARCHAR (100)
                        , RoleMembership varchar(100)
                        , defaultSchema VARCHAR (100)
                        , principalSID varbinary(85)
                       )

INSERT INTO @dbs ( name, processed )
        SELECT name, 0 FROM sys.databases
               WHERE database_id &gt; 6
                      AND [state] = 0 --online

WHILE @x &lt;= (SELECT COUNT( 1) FROM @dbs WHERE processed = 0 )
        BEGIN
               SELECT TOP 1 @dbName = name FROM @dbs WHERE processed = 0
               SET @sql =
              'INSERT #results (dbName,principalName, principalType, RoleMembership, defaultSchema, principalSID)
                     SELECT '''+ @dbname +''',dp.name, dp.type_desc, dpr.name,dp.default_schema_name,dp.sid
                     FROM [' + @dbName + '].sys.database_role_members drm
                           INNER JOIN [' + @dbName + '].sys.database_principals dp on drm.member_principal_id = dp.principal_id
                           INNER JOIN [' + @dbName + '].sys.database_principals dpr on drm.role_principal_id = dpr.principal_id
                     WHERE dpr.name in (''db_owner'', ''db_securityadmin'')
                           AND dp.name &lt;&gt; ''dbo'''
        BEGIN TRY
             EXEC (@sql )
        END TRY
        BEGIN CATCH
               SELECT ERROR_LINE () AS 'Error Line'
                      , ERROR_MESSAGE () AS 'Error Message'
                      , ERROR_NUMBER () AS 'Error Number'
                      , @dbName AS 'Database'
        END CATCH

        UPDATE @dbs
        SET processed = 1
        WHERE name = @dbName
END
GO
SELECT * FROM #results
GO
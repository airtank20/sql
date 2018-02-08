
-- Let's get the columns of the Primary key into a CTE
;WITH mycte AS (SELECT SCHEMA_NAME(o.schema_id) AS 'Schema'
					, OBJECT_NAME(i2.object_id) AS 'TableName'
					, STUFF(
						(SELECT ',' + COL_NAME(ic.object_id,ic.column_id) 
						FROM sys.indexes i1
							INNER JOIN sys.index_columns ic ON i1.object_id = ic.object_id AND i1.index_id = ic.index_id
						WHERE i1.is_primary_key = 1
							AND i1.object_id = i2.object_id	AND i1.index_id = i2.index_id
						FOR XML PATH('')),1,1,'') AS PK
FROM sys.indexes i2
	INNER JOIN sys.objects o ON i2.object_id = o.object_id
WHERE i2.is_primary_key = 1
	AND o.type_desc = 'USER_TABLE'
)
-- Use this select to get the count, join to the CTE and get the column list
SELECT SCHEMA_NAME(o.schema_id) AS 'Schema'
	, OBJECT_NAME(i.object_id) AS 'TableName'
	, COUNT(COL_NAME(ic.object_id,ic.column_id)) AS 'Primary_Key_Column_Count'
	, mycte.PK AS 'Primary_Key_Columns'
FROM sys.indexes i 
	INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
	INNER JOIN sys.objects o ON i.object_id = o.object_id
	INNER JOIN mycte ON mycte.TableName = OBJECT_NAME(i.object_id)
WHERE i.is_primary_key = 1
		AND o.type_desc = 'USER_TABLE'
GROUP BY SCHEMA_NAME(o.schema_id)
		, OBJECT_NAME(i.object_id)
		, mycte.PK
HAVING COUNT('Primay_Key_Column_Count') > 1
ORDER BY 'TableName' ASC
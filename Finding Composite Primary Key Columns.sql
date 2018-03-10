
-- Let's get the columns of the Primary key 
SELECT SCHEMA_NAME(o.schema_id) AS 'Schema'
					, OBJECT_NAME(i2.object_id) AS 'TableName'
					, (SELECT COUNT((COL_NAME(ic.object_id,ic.column_id))) 
						FROM sys.indexes i1
							INNER JOIN sys.index_columns ic ON i1.object_id = ic.object_id AND i1.index_id = ic.index_id
						WHERE i1.is_primary_key = 1
							AND i1.object_id = i2.object_id AND i1.index_id = i2.index_id
						GROUP BY OBJECT_NAME(i1.object_id)) AS 'Column_Count'
					, STUFF(
						(SELECT ', ' + COL_NAME(ic.object_id,ic.column_id) 
						FROM sys.indexes i1
							INNER JOIN sys.index_columns ic ON i1.object_id = ic.object_id AND i1.index_id = ic.index_id
						WHERE i1.is_primary_key = 1
							AND i1.object_id = i2.object_id	AND i1.index_id = i2.index_id
						FOR XML PATH('')),1,1,'') AS PK
FROM sys.indexes i2
	INNER JOIN sys.objects o ON i2.object_id = o.object_id
WHERE i2.is_primary_key = 1
	AND o.type_desc = 'USER_TABLE'



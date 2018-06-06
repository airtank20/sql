SELECT sp.name,
       type,
       type_desc
FROM sys.server_role_members srm
    INNER JOIN sys.server_principals sp
        ON srm.member_principal_id = sp.principal_id
WHERE role_principal_id = 3
      AND name <> 'sa'
      AND name NOT LIKE 'NT SERVICE%'
      AND name NOT LIKE '%$';
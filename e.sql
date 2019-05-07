Select DISTINCT current_database() as base,SCHEMA_NAME as schema, i.table_name as nom,
    p.privilege_type as type_de_privilege, p.grantor as attributeur, p.grantee as beneficiaire
From INFORMATION_SCHEMA.SCHEMATA NATURAL Join INFORMATION_SCHEMA.TABLES as i NATURAL JOIN information_schema.table_privileges as p
where schema_name!='pg_catalog' AND schema_name!='information_schema' AND schema_name!='pg_toast' AND schema_name!='pg_toast_temp_1'AND schema_name!='pg_temp_1' 
order by base, schema, nom, type_de_privilege ;


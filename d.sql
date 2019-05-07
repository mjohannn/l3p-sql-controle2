Select DISTINCT current_database() as base,SCHEMA_NAME as schema, i.table_name as nom,(CASE
            when c.constraint_type = 'CHECK' then 'Contrainte de valeur'
            when c.constraint_type = 'FOREIGN KEY' then 'Contrainte de clé étrangère'
            when c.constraint_type = 'PRIMARY KEY' then 'Contrainte de clé primaire'
            when c.constraint_type = 'UNIQUE' then 'Contrainte d''unicité'
        end
    )  as type_de_contrainte,
    CONCAT(current_database(),'.',SCHEMA_NAME,'.',(Select table_name from information_schema.table_constraints where constraint_name = c.constraint_name)) as rattache_a_la_table

From INFORMATION_SCHEMA.SCHEMATA NATURAL Join INFORMATION_SCHEMA.TABLES as i NATURAL JOIN information_schema.table_constraints as c
where schema_name!='pg_catalog' AND schema_name!='information_schema' AND schema_name!='pg_toast' AND schema_name!='pg_toast_temp_1'AND schema_name!='pg_temp_1' 
order by base, schema, nom ;

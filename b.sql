SELECT current_database() as base ,SCHEMA_NAME as schema, i.table_name as nom, 
(CASE
    WHEN i.table_type = 'BASE TABLE' THEN 'Table de la base'
    WHEN i.table_type = 'VIEW' THEN 'Vue'
    
END) as type,
(CASE
            when i.is_insertable_into = 'YES' then 'OUI'
            when i.is_insertable_into = 'NO' then 'NON'
        end
    ) as peut_t_on_y_inserer_des_donnees,
    (Select COUNT(c.column_name) from INFORMATION_SCHEMA.COLUMNS as c where TABLE_NAME = i.table_name) as nb_colonnes,
    (Select Count(constraint_type) from information_schema.table_constraints where TABLE_NAME = i.table_name AND constraint_type = 'CHECK') as nb_contrainte_de_valeur,
    (Select Count(constraint_type) from information_schema.table_constraints where TABLE_NAME = i.table_name AND constraint_type = 'FOREIGN KEY') as nb_contrainte_de_cle_etrangere,
(Select Count(constraint_type) from information_schema.table_constraints where TABLE_NAME = i.table_name AND constraint_type = 'PRIMARY KEY') as nb_contrainte_de_cle_primaire,
(Select Count(constraint_type) from information_schema.table_constraints where TABLE_NAME = i.table_name AND constraint_type = 'UNIQUE') as nb_contrainte_unicite

FROM INFORMATION_SCHEMA.SCHEMATA NATURAL Join INFORMATION_SCHEMA.TABLES as i
where schema_name!='pg_catalog' AND schema_name!='information_schema' AND schema_name!='pg_toast' AND schema_name!='pg_toast_temp_1'AND schema_name!='pg_temp_1' 
order by base, schema, nom;
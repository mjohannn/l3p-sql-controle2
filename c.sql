Select current_database() as base,SCHEMA_NAME as schema, i.table_name as nom, t.ordinal_position as position_colonne,
t.COLUMN_NAME as nom_colonne,t.data_type as type_colonne,t.is_nullable as peut_etre_null,t.is_updatable as peut_etre_modifie,
t.character_maximum_length as chaine_longueur_max

From INFORMATION_SCHEMA.SCHEMATA NATURAL Join INFORMATION_SCHEMA.TABLES as i NATURAL JOIN information_schema.columns t
where schema_name!='pg_catalog' AND schema_name!='information_schema' AND schema_name!='pg_toast' AND schema_name!='pg_toast_temp_1'AND schema_name!='pg_temp_1' 
order by base, schema, nom, position_colonne ;


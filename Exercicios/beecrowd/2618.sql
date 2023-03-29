/*Produtos Importados*/
SELECT p.name, pv.name, c.name
    FROM categories as c INNER JOIN products as p ON
        p.id_categories = c.id INNER JOIN providers  as pv ON
        p.id_providers = pv.id
    WHERE c.name = 'Imported' AND pv.name = 'Sansul SA'
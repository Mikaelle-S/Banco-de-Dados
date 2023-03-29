/*Categorias*/
select p.id, p.name
from products p INNER JOIN categories c ON p.id_categories = c.id
WHERE LOWER(c.name) LIKE 'super%
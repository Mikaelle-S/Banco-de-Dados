/*Endereço dos Clientes*/
SELECT name, street
FROM customers
WHERE LOWER(city) = 'porto alegre'
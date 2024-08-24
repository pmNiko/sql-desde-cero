
-- Create a ñew table 
CREATE TABLE users
(
    name VARCHAR(10) UNIQUE
);



-- Insert ROWS
INSERT INTO users
    (name)
VALUES
    ('Alfred'),
    ('Cesar'),
    ('Nikolas'),
    ('Bernando'),
    ('Icaro'),
    ('Andres'),
    ('Carlos');


UPDATE users SET name = 'Alberto'
WHERE name = 'Fernado';



--- Consulta de busqueda
SELECT * FROM users LIMIT 40;

SELECT *
FROM users
WHERE name LIKE '%%';


--- Delete rows
DELETE from users WHERE name LIKE '_esa%';

--- Delete table
DROP table users;

--- Purge table
TRUNCATE table users;


/*
	Tarea 
*/

-- 1. Ver todos los registros
SELECT *
FROM users
ORDER BY id desc;

-- 2. Ver el registro cuyo id sea igual a 10
SELECT *
FROM users
WHERE id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)
SELECT *
FROM users
WHERE name LIKE 'Jim %'
LIMIT 1;

-- 4. Todos los registros cuyo segundo nombre es Alexander
SELECT *
FROM users
WHERE name LIKE '% Alexander%';

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'
UPDATE users SET name = 'Fernando Herrera' WHERE id = 1;

-- 6. Borrar el último registro de la tabla
DELETE FROM users WHERE id = (SELECT MAX(id)
FROM users);


/** Trabajo con Strings */

-- Algunas funciones para la tabla
SELECT
	id,
	UPPER(name) AS upper_name,
	LOWER(name) AS lower_name,
	LENGTH(name) AS Character,
	(20 * 2) AS constante,
	concat('*',id,' - ',name, '*') as concat_name,
	'*' || id ||' - '|| name || '*' as ba rcode,
	name
FROM
	users;


-- Separación de nombre y segundo nombre
SELECT
	name,
	SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
	SUBSTRING(name, POSITION(' ' IN name) + 1) AS last_name
FROM
	users;

-- Populación de las nuevas columnas first_name y last_name desde la columna name
UPDATE
	users
SET
	first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
	last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);


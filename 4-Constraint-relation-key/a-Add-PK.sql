-- Encontremos el code repetido 
SELECT
    *
FROM
    country
WHERE
    code = 'NLD';

-- Debemos eliminar el code repetido 
DELETE FROM country
WHERE
    code2 = 'NA';

-- Por ultimo añadimos el PK
ALTER TABLE country
ADD PRIMARY KEY (code);
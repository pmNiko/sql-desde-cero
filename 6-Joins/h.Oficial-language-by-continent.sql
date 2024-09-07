/* Quiero saber los idiomas oficiales sin repetir que se hablan por continente */
--- countrylanguage(isofficial) -> country -> continent
--- Ver los lenguajes asociados al pais
SELECT
    countrycode,
    language,
    languagecode
FROM
    countrylanguage
WHERE
    isofficial is TRUE;

--- Ver los continentes asociados al pais
SELECT
    code,
    continent
FROM
    country
ORDER BY
    code ASC;

--- Ver los continentes por nombre
SELECT
    *
from
    continent;

/* Finalmente conectamos las tablas para recuperar los datos de la consulta */
SELECT DISTINCT
    c.name as continent_name,
    a.language
FROM
    countrylanguage a
    INNER JOIN country b on a.countrycode = b.code
    INNER JOIN continent c on b.continent = c.code
WHERE
    a.isofficial is TRUE
ORDER BY
    continent_name ASC,
    a.language ASC;

/* Quiero saber cuantos idiomas oficiales sin repetir que se hablan por continente */
SELECT
    c.name AS continent_name,
    COUNT(DISTINCT a.language) AS languages
FROM
    countrylanguage a
    INNER JOIN country b ON a.countrycode = b.code
    INNER JOIN continent c ON b.continent = c.code
WHERE
    a.isofficial = TRUE
GROUP BY
    continent_name
ORDER BY
    languages ASC;

/* Relacionar con la tabla de lenguajes */
SELECT DISTINCT
    c.name,
    d."name"
FROM
    countrylanguage a
    INNER JOIN country b on a.countrycode = b.code
    INNER JOIN continent c on b.continent = c.code
    INNER JOIN language d ON a.languagecode = d.code
WHERE
    a.isofficial is TRUE
ORDER BY
    c.name ASC,
    d."name" ASC;
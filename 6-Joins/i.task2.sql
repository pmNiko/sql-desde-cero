-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?
select
    *
from
    countrylanguage
where
    isofficial = true;

select
    *
from
    country;

select
    *
from
    continent;

Select
    *
from
    "language";

/* Resolucion  */
SELECT
    COUNT(*) AS "Europa",
    a."language",
    a.languagecode
FROM
    countrylanguage a
    INNER JOIN country b ON a.countrycode = b.code
    INNER JOIN continent c ON b.continent = c.code
WHERE
    a.isofficial = TRUE
    AND c.name = 'Europe'
GROUP BY
    a."language",
    a.languagecode
ORDER BY
    "Europa" DESC LIMIT 1;

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
SELECT
    a."name",
    b.languagecode
from
    country a
    INNER JOIN countrylanguage b on b.countrycode = a.code
WHERE
    b.languagecode = 135
    and b.isofficial is true
ORDER BY
    a."name" ASC;
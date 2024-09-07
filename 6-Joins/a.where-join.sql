DROP TABLE language,
countrylanguage,
country,
continent,
city;

/* Iniciado con los joins
 *  - Hagamoslo con una condición where
 */
SELECT
    a.name as country_name,
    b.name continent_name
from
    country a,
    continent b
WHERE
    a.continent = b.code
ORDER BY
    continent_name ASC;

--- Ahora hagamos lo mismo con un INNER JOIN
SELECT
    a.name as country_name,
    b.name continent_name
FROM
    country a
    INNER JOIN continent b ON a.continent = b.code
ORDER BY
    continent_name ASC;
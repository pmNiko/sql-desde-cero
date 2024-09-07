/* Tarea listar todos los continentes que no tienen paises asociados */
SELECT
    b.name as continentName,
    a.name as country,
    a.continent as continentCode
FROM
    country a
    RIGHT OUTER JOIN continent b on a.continent = b.code
WHERE
    a.continent IS NULL;
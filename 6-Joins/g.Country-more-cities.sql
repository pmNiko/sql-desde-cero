/* tarea pais con mas ciudades */
SELECT
    COUNT(*) as totalCity,
    a.name as CountryName
from
    country a
    INNER JOIN city b on a.code = b.countrycode
GROUP BY
    a.name
ORDER BY
    totalCity DESC LIMIT 10;
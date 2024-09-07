ALTER SEQUENCE continent_code_seq RESTART
WITH
    9;

INSERT INTO
    continent (name)
VALUES
    ('North Asia'),
    ('Central Asia'),
    ('South Asia');

/* Tarea utilizar Full Outher Join 
 *   - Entre la tabla de country y la de continent
 */
SELECT
    a.name as country,
    a.continent as continentCode,
    b.name as continentName
FROM
    country a
    FULL OUTER JOIN continent b on a.continent = b.code
ORDER BY
    country DESC;
SELECT
    count(*) as count,
    a."name"
FROM
    country b
    INNER JOIN continent a ON a.code = b.continent
GROUP BY
    a."name"
ORDER BY
    count(*) ASC;

SELECT
    0 as count,
    a."name"
FROM
    country b
    RIGHT JOIN continent a ON a.code = b.continent
WHERE
    b.continent IS NULL
GROUP BY
    a."name"
ORDER BY
    count(*) ASC;

/* Union de las dos tablas y ordenamiento por conteo */
(
    SELECT
        count(*) as count,
        a."name"
    FROM
        country b
        INNER JOIN continent a ON a.code = b.continent
    GROUP BY
        a."name"
)
UNION
(
    SELECT
        0 as count,
        a."name"
    FROM
        country b
        RIGHT JOIN continent a ON a.code = b.continent
    WHERE
        b.continent IS NULL
    GROUP BY
        a."name"
)
ORDER BY
    count ASC;
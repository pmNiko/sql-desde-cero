(
    SELECT
        COUNT(*) AS total,
        a."name" AS continent
    FROM
        country b
        INNER JOIN continent a ON a.code = b.continent
    WHERE
        a."name" NOT LIKE '%America%'
    GROUP BY
        a."name"
)
UNION
(
    SELECT
        COUNT(*) AS total,
        'America' AS continent
    FROM
        country b
        INNER JOIN continent a ON a.code = b.continent
    WHERE
        a."name" LIKE '%America%'
)
ORDER BY
    total ASC;
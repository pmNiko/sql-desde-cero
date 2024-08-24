SELECT
    *
FROM
    (
        SELECT
            count(*),
            SUBSTRING (email, POSITION ('@' IN email) + 1) AS DOMAIN,
            'Fernando' AS name,
            35 AS age
        FROM
            users
        GROUP BY
            SUBSTRING (email, POSITION ('@' IN email) + 1)
        HAVING
            COUNT(*) > 1
    ) AS email_domains
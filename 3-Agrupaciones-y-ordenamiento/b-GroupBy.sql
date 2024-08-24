-- Primeras pruebas
SELECT
    COUNT(*) AS "Cantidad de usuarios",
    MIN(followers) AS "Minimo de seguidores",
    MAX(followers) AS "Maximo de seguidores",
    AVG(followers) AS "Promedio de seguidores",
    SUM(followers) / COUNT(*) AS "Promedio manual",
    ROUND(AVG(followers)) AS "Promedio redondeado"
FROM
    users;

-- Aquelos que tengan 4 o 4999
SELECT
    first_name,
    last_name,
    followers
FROM
    users
WHERE
    followers = 4
    OR followers = 4999
ORDER BY
    followers DESC;

-- Agrupados por cantidad de seguidores
SELECT
    count(*) AS "Usuarios",
    followers AS "Seguidores"
FROM
    users
WHERE
    followers = 4
    OR followers = 4999
GROUP BY
    followers;

-- Agrupados con un rango
SELECT
    count(*) AS "Usuarios",
    followers AS "Seguidores"
FROM
    users
WHERE
    followers BETWEEN 4500 AND 4700
GROUP BY
    followers
ORDER BY
    "Usuarios" DESC;
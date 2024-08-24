/**
 * Se debe respetar el oreden de consulta
 *   - Primeramente si se cuantifican los registros 
 *     se debe especificar la columna que será asociada al group by 
 *   - El orden de llamada importa 
 *      - Group BY 
 *      - Having  Condición sobre el resultado de cuantificación
 *      - Order by
 */
SELECT
    count(*) cantidad_de_usuarios,
    country
FROM
    users
GROUP BY
    country
HAVING
    count(*) BETWEEN 1 AND 5
ORDER BY
    cantidad_de_usuarios DESC;

-- recuperación de los domain
SELECT
    count(*),
    SUBSTRING (email, POSITION ('@' IN email) + 1) AS DOMAIN
FROM
    users
GROUP BY
    SUBSTRING (email, POSITION ('@' IN email) + 1)
HAVING
    COUNT(*) > 1;
/* 
 *   Creación de un indice compuesto en la tabla city 
 */
create UNIQUE INDEX "unique_nane_countrycode_district" on city (name, countrycode, district);

/* Tenemos un error nos acusa que esa combinación está repetida 

Debemos decidir 
1. Eliminar la repetida 
2. No hacer unico el index
3. Modificar el registro repetido
 */
SELECT
    *
FROM
    city
WHERE
    name = 'Jinzhou'
    AND countrycode = 'CHN'
    AND district = 'Liaoning';

/* Modificamos el registro con menos poblacion */
UPDATE city
SET
    name = CONCAT(name, ' old')
WHERE
    id = (
        SELECT
            id
        FROM
            city
        WHERE
            name = 'Jinzhou'
            AND countrycode = 'CHN'
            AND district = 'Liaoning'
        ORDER BY
            population ASC LIMIT 1
    );

-- Se puede ver reflejado el cambio de la siguiente manera
SELECT
    *
FROM
    city
WHERE
    name LIKE '%Jinzhou%';

/* creacion de un index general en el distrito */
create INDEX "district_index" on city (district);
/*
 * Volcado masivo de datos
 */
SELECT
    *
from
    country;

/* Obtengamos una vista donde se vea
 * 	1. name de la tabla country
 * 	2. continent de la tabla country  | relación
 * 	3. name de la tabla continent.    
 * 	3. "code" de la tabla continent.  | relación
 */
SELECT
    a.name,
    a.continent,
    (
        SELECT
            "code"
        FROM
            continent b
        WHERE
            b.name = a.continent
    )
FROM
    country a;

/*
 * Ahora hagamos el update de la tabla country
 * para que haga match con la nueva tabla
 */
UPDATE country a
SET
    continent = (
        SELECT
            "code"
        FROM
            continent b
        WHERE
            b.name = a.continent
    );

/*
* Ya tenemos casi todo listo para generar nuestra relación 
* Realicemos el cambio de tipo y llave foranea de la columna 
* continent en la tabla country para que pueda realizar la "fk" con countinent (code)
*/
SELECT * FROM country;

--- Intentemos alterar el tipo de la columna continent de text a int4
ALTER TABLE country
    ALTER COLUMN continent TYPE int4;

---	Error ->  column "continent" cannot be cast automatically to type integer.
---	HINT  ->  You might need to specify "USING continent::integer".
--- Probemos con ese cambio
ALTER TABLE country 
    ALTER COLUMN continent TYPE int4
    USING continent::INTEGER;

/* Finalmente podemos realizar la relación entre tablas */
ALTER TABLE country
ADD CONSTRAINT fk_continent_code 
    FOREIGN KEY (continent) 
    REFERENCES continent (code); 

--- ** Debemos limpiar las tablas en desuso  **
DROP TABLE country_bk;


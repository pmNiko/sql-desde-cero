/* Establezcamos una llave foranea */
ALTER TABLE city
ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code);

--- Obtenemos el error
/* 
 *  Query 1 ERROR at Line 1: : ERROR:  insert or update on table "city" 
 *  violates foreign key constraint "fk_country_code"
 *  DETAIL:  Key (countrycode)=(AFG) is not present in table "country".
 *  AFG  no existe en la tabla country - veamoslo con un query
 */
SELECT
    count(*)
FROM
    country
WHERE
    code = 'AFG';

/* Debemos decidir si 
 * 	1. Eliminar todas las ciudades cuyo countrycode sea 'AFG'
 * 	2. Agregar la ciudad de Afganistan
 */
INSERT INTO
    country
values
    (
        'AFG',
        'Afghanistan',
        'Asia',
        'Southern Asia',
        652860,
        1919,
        40000000,
        62,
        69000000,
        NULL,
        'Afghanistan',
        'Totalitarian',
        NULL,
        NULL,
        'AF'
    );

SELECT
    *
FROM
    city
WHERE
    countrycode = 'NAM';

--- Intenetemos nuevamente
ALTER TABLE city
ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country (code);

-- Definimos enla table city on delete cascade
SELECT
    *
FROM
    country
WHERE
    code = 'AFG';

SELECT
    *
FROM
    city
WHERE
    countrycode = 'AFG';

DELETE FROM city
WHERE
    countrycode = 'AFG';
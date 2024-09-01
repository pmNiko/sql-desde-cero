/*
 * bien la propuesta es migrar la data de continent de la tabla city
 * a una nueva tabla que se llame continent a la cual se haga referencia
 */
DROP TABLE continent;
CREATE TABLE continent (
    "code" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

/* Listemos los continentes de la tabla de county */
SELECT DISTINCT  continent, code FROM country ORDER BY continent ASC;

/* Adosemos el check */
ALTER TABLE country
ADD CONSTRAINT continent_check CHECK (
    continent IN (
        'Asia',
        'South America',
        'North America',
        'Central America',
        'Oceania',
        'Antarctica',
        'Africa',
        'Europe'
    )
);


/* Ahora hagamos el insert a la tabla continent basada en el query anterior */
INSERT INTO continent (name)
SELECT DISTINCT
	continent
FROM
	country
ORDER BY
	continent ASC;

/* Script de creación de la tabla */
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."country_bk" (
    "code" bpchar NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL CHECK (continent = ANY (ARRAY['Asia'::text, 'South America'::text, 'North America'::text, 'Central America'::text, 'Oceania'::text, 'Antarctica'::text, 'Africa'::text, 'Europe'::text])),
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL,
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric,
    "gnpold" numeric,
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar NOT NULL
);
--- Generemos la tabla de backup 
--- Y ahora volcamos los datos de la tabla original
INSERT INTO country_bk
SELECT * FROM country; 

/* Corroboremos los datos en la tabla de respaldo */
SELECT * FROM country_bk; 
SELECT COUNT(*) FROM country_bk; 
SELECT COUNT(*) FROM country;

/*
* Ahora ya podemos trabajar en la tabla de country
*  1. Vamos a coenzar eliminando el check
*/
ALTER TABLE country DROP CONSTRAINT continent_check;


-- Ahora probamos actualizar un continenete de la tabla de country
UPDATE country SET continent = 'Europa'
WHERE surfacearea = 41526;

SELECT * from country
WHERE surfacearea = 41526;

--- rollback
UPDATE country SET continent = 'Europe'
WHERE surfacearea = 41526;

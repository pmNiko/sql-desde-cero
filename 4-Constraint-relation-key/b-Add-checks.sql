/* Añadimos un check al surfacearea */
ALTER TABLE country
ADD CHECK (surfacearea >= 0);

/* Añadimos un check al surfacearea */
ALTER TABLE country
ADD CHECK (surfacearea >= 0);

/* Encontremos los continentes existentes */
SELECT DISTINCT
    continent
from
    country;

/* Elimino el constraint existente */
ALTER TABLE country DROP CONSTRAINT continent_check;

/* Añadimos el constraint a la tabla */
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

select
    *
from
    country
WHERE
    code = 'CRI';

/* Actualizamos el registro */
UPDATE country
SET
    continent = 'Central America'
WHERE
    code = 'CRI';
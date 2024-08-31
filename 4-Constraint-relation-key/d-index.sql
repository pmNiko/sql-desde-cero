/**
Los index lógicamente lo que hacen es indexar la BD
esto genera una mayor velocidad a la hora de realizar las consultas 
pero se debe tener en cuenta que también genera mayor volumen en la misma.
 */
/* Definimos el indice haciendo referencia a "name" que sabemos que es unico*/
CREATE UNIQUE INDEX "unique_country_name" ON country (name);

/* Ahora recuperemos los paises por continente */
SELECT
    *
FROM
    country
WHERE
    name = 'Africa';

CREATE INDEX "country_continente" ON country (continent);
/**
    Para recuperar los constraines de la tabla
    podemos usar su utilidad de "Copy Script as"  -> creation 
    luego pegamos en el sql lo que se ha copiado al clipboard
*/

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
DROP TABLE "public"."country";
CREATE TABLE "public"."country" (
    "code" bpchar NOT NULL,
    "name" text NOT NULL,
    "continent" text NOT NULL CHECK (continent = ANY (ARRAY['Asia'::text, 'South America'::text, 'North America'::text, 'Central America'::text, 'Oceania'::text, 'Antarctica'::text, 'Africa'::text, 'Europe'::text])),
    "region" text NOT NULL,
    "surfacearea" float4 NOT NULL CHECK (surfacearea > (0)::double precision),
    "indepyear" int2,
    "population" int4 NOT NULL,
    "lifeexpectancy" float4,
    "gnp" numeric,
    "gnpold" numeric,
    "localname" text NOT NULL,
    "governmentform" text NOT NULL,
    "headofstate" text,
    "capital" int4,
    "code2" bpchar NOT NULL,
    PRIMARY KEY ("code")
);
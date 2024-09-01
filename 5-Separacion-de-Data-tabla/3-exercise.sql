-- Tarea con countryLanguage

-- Crear la tabla de language

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;

-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar
SELECT COUNT(*) FROM countrylanguage;
SELECT DISTINCT count(language) FROM countrylanguage;

-- Actualizar todos los registros
INSERT INTO language(name)
SELECT DISTINCT language FROM countrylanguage; 

-- Cambiar tipo de dato en countrylanguage - languagecode por int4
ALTER TABLE countrylanguage
    ALTER COLUMN languagecode TYPE int4
    USING languagecode::INTEGER;

-- Crear el forening key y constraints de no nulo el language_code
ALTER TABLE countrylanguage
ADD CONSTRAINT fk_language_code 
    FOREIGN KEY (languagecode) 
    REFERENCES language (code); 
   
/* Realizamos el match de 
	- language de la tabla countrylanguage
	- name de la tabla language
	y veremos como quedaria el volcado de datos referenciales
*/    
SELECT
    a."language",
    a.languagecode,
    (
        SELECT
            code
        FROM
            language b
        WHERE
            b.name = a."language"
    ),
    (
        SELECT
            name
        FROM
            language b
        WHERE
            b.name = a."language"
    )
FROM
    countrylanguage a;

/* volcado de datos referenciales */
UPDATE countrylanguage a
SET
    languagecode = (
        SELECT
            "code"
        FROM
            language b
        WHERE
            b.name = a.language
    );

-- Revisar lo creado
SELECT
	a. "language",
	a.languagecode,
	(
		SELECT
			code
		FROM
			LANGUAGE b
		WHERE
			b.name = a. "language"), (
			SELECT
				name
			FROM
				LANGUAGE b
			WHERE
				b.name = a. "language")
		FROM
			countrylanguage a
		ORDER BY
			languagecode ASC;



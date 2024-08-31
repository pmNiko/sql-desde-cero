-- 1. Crear una llave primaria en city (id)
ALTER TABLE city
ADD PRIMARY KEY (id);

-- 2. Crear un check en population, para que no soporte negativos
ALTER TABLE city
ADD CHECK (population >= 0);

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
ALTER TABLE countrylanguage
ADD PRIMARY KEY (countrycode, "language");

-- 4. Crear check en percentage,
-- Para que no permita negativos ni números superiores a 100
ALTER TABLE countrylanguage
ADD CHECK (percentage BETWEEN 0 AND 100);
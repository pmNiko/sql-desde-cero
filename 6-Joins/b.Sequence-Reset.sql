/*
 * Pequeño tip para alterar la sequencia de 
 * creación de ID 
 */
ALTER SEQUENCE continent_code_seq RESTART
WITH
    9;

INSERT INTO
    continent (name)
VALUES
    ('North Asia'),
    ('Central Asia'),
    ('South Asia');
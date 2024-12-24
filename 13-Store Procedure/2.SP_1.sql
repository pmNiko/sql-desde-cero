
-- Creacion de un SP
CREATE OR REPLACE PROCEDURE insert_region_proc( int, varchar )
as $$
BEGIN
	INSERT INTO regions(region_id, region_name)
	VALUES( $1, $2 );

	raise notice 'Variable 1: %, Variable 2: %', $1, $2;

	-- ROLLBACK;
	COMMIT;
END;
$$ LANGUAGE plpgsql;

 CALL insert_region_proc(5, 'Central American');

SELECT * from regions;

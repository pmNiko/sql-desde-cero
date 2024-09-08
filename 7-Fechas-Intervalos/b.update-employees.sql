/* Sumar la diferencia de años hasta la actualidad en hire_date */
SELECT 
	hire_date,
	hire_date + INTERVAL '23 years'
FROM
	employees
ORDER BY hire_date DESC;


--- update
UPDATE employees
SET hire_date = hire_date + INTERVAL '23 years';


--- corroboramos los datos
SELECT 
	hire_date as date_begin,
	MAKE_INTERVAL( YEARS := 2024 - EXTRACT( YEARS FROM hire_date )::INTEGER ) as years_ago_manual,
	MAKE_INTERVAL( YEARS := date_part( 'years', CURRENT_DATE )::INTEGER - EXTRACT( YEARS FROM hire_date )::INTEGER ) as years_ago_computed
FROM
	employees
ORDER BY hire_date DESC;
	

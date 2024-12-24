
CREATE OR REPLACE FUNCTION max_raise( empl_id int )
returns NUMERIC(8,2) as $$

DECLARE
	possible_raise NUMERIC(8,2);

BEGIN
	
	select 
		max_salary - salary into possible_raise
	from employees
	INNER JOIN jobs on jobs.job_id = employees.job_id
	WHERE employee_id = empl_id;

	if ( possible_raise < 0 ) THEN
		possible_raise = 0;
	end if;

	return possible_raise;

END;
$$ LANGUAGE plpgsql;


SELECT
	employee_id,
	first_name,
	salary,
	max_salary,
	max_salary - salary AS posible_raise,
	max_raise(employee_id),
	max_raise_2(employee_id)
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id;


SELECT
	employee_id, first_name, salary, max_raise_2(employee_id)
FROM
	employees
WHERE
employee_id = 206;

CREATE
OR REPLACE FUNCTION max_raise_2 (emple_id int) RETURNS NUMERIC(8, 2) AS $$
DECLARE
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;
	posible_raise NUMERIC(8,2);

BEGIN	
	-- Tomar el puesto de trabajo y el salario
	SELECT * FROM employees INTO selected_employee
	WHERE employee_id = emple_id;

	-- Tomar el max salary, acorde a su job
	SELECT * from jobs INTO selected_job
	WHERE job_id = selected_employee.job_id;
	
	-- Calculos
	posible_raise = selected_job.max_salary - selected_employee.salary;

	IF (posible_raise < 0 ) THEN
		/*posible_raise = 0;*/
	    RAISE EXCEPTION 'Persona con salario mayor al maximo posible: id:%, %', selected_employee.employee_id, selected_employee.first_name;
	END IF;
	
	return posible_raise;
END;
$$ LANGUAGE plpgsql;

SELECT
	max_raise_2 (206);













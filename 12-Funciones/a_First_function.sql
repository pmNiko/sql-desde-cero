create or REPLACE FUNCTION greet_employee(employee_name VARCHAR)
RETURNS VARCHAR
AS $$
-- Declare
BEGIN
	RETURN 'Hola ' || employee_name;
END;
$$ 
LANGUAGE plpgsql;

-- Uso basico
select greet_employee('Nikolas');

-- Uso real
SELECT first_name, greet_employee(first_name) from employees



-- QUERY de posible aumento 
SELECT
	employee_id,
	first_name,
	salary,
	max_salary,
	max_salary - salary AS posible_raise,
	CASE
		WHEN jobs.max_salary > 0 THEN round(((jobs.max_salary - employees.salary) / jobs.max_salary) * 100, 2)
		ELSE 0
	END AS percent_raise
FROM
	employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id;

-- Creacion de la function
CREATE
OR REPLACE FUNCTION max_raise (emple_id int) RETURNS NUMERIC(8, 2) AS $$
DECLARE
	posible_raise NUMERIC(8,2);

BEGIN	
	SELECT max_salary - salary INTO posible_raise
	FROM employees
	INNER JOIN jobs ON jobs.job_id = employees.job_id
	WHERE employee_id = emple_id;
	
	RETURN posible_raise;
END;
$$ LANGUAGE plpgsql;


SELECT employee_id, first_name, max_raise(employee_id) from employees;



-- ------ ------ Alternativa ------- ---------  --
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


CREATE
OR REPLACE FUNCTION max_raise_2 (emple_id int) RETURNS NUMERIC(8, 2) AS $$
DECLARE
	employee_job_id int;
	current_salary NUMERIC(8,2);
	job_max_salary NUMERIC(8,2);
	posible_raise NUMERIC(8,2);

BEGIN	
	-- Tomar el puesto de trabajo y el salario
	SELECT job_id, salary
	INTO employee_job_id, current_salary
	FROM employees WHERE employee_id = emple_id;

	-- Tomar el max salary, acorde a su job
	SELECT max_salary INTO job_max_salary from jobs WHERE job_id = employee_job_id;
	
	-- Calculos
	posible_raise = job_max_salary - current_salary;
	
	return posible_raise;
END;
$$ LANGUAGE plpgsql;

SELECT
	max_raise_2 (122);



-- Condicionales ---
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
	employees;
/*WHERE
	employee_id = 206;*/


CREATE
OR REPLACE FUNCTION max_raise_2 (emple_id int) RETURNS NUMERIC(8, 2) AS $$
DECLARE
	employee_job_id int;
	current_salary NUMERIC(8,2);
	job_max_salary NUMERIC(8,2);
	posible_raise NUMERIC(8,2);

BEGIN	
	-- Tomar el puesto de trabajo y el salario
	SELECT job_id, salary
	INTO employee_job_id, current_salary
	FROM employees WHERE employee_id = emple_id;

	-- Tomar el max salary, acorde a su job
	SELECT max_salary INTO job_max_salary from jobs WHERE job_id = employee_job_id;
	
	-- Calculos
	posible_raise = job_max_salary - current_salary;

	IF (posible_raise < 0 ) THEN
		posible_raise = 0;
	END IF;
	
	return posible_raise;
END;
$$ LANGUAGE plpgsql;

SELECT
	max_raise_2 (206);



-- Raise exception ---
CREATE
OR REPLACE FUNCTION max_raise_2 (emple_id int) RETURNS NUMERIC(8, 2) AS $$
DECLARE
	employee_job_id int;
	current_salary NUMERIC(8,2);
	job_max_salary NUMERIC(8,2);
	posible_raise NUMERIC(8,2);

BEGIN	
	-- Tomar el puesto de trabajo y el salario
	SELECT job_id, salary
	INTO employee_job_id, current_salary
	FROM employees WHERE employee_id = emple_id;

	-- Tomar el max salary, acorde a su job
	SELECT max_salary INTO job_max_salary from jobs WHERE job_id = employee_job_id;
	
	-- Calculos
	posible_raise = job_max_salary - current_salary;

	IF (posible_raise < 0 ) THEN
		/*posible_raise = 0;*/
	    RAISE EXCEPTION 'Persona con salario mayor al maximo posible: %', emple_id;
	END IF;
	
	return posible_raise;
END;
$$ LANGUAGE plpgsql;


















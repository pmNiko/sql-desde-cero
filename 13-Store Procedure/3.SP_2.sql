
CREATE
OR REPLACE PROCEDURE controlled_raise (percentage NUMERIC) AS $$
DECLARE
	real_percentage NUMERIC(8,2);
	total_employees int;

BEGIN
	real_percentage = percentage / 100;
	
	--- Mantener el hitorico
	insert into raise_history(date, employee_id, base_salary, amount, percentage)
	SELECT
		CURRENT_DATE AS "date",
		employee_id,
		salary,
		max_raise(employee_id) * real_percentage as amount,
		percentage
	FROM
		employees;

	--Impacatar la tabla de empleados
	UPDATE employees
		set salary = salary + (max_raise(employee_id) * real_percentage);
	COMMIT;
	
	SELECT count(*) into total_employees from employees;

	raise notice 'Afected percentage % employees', total_employees;
END;
$$ LANGUAGE plpgsql;


CALL controlled_raise(1); 

SELECT * from employees;
SELECT * from raise_history;


SELECT
	CURRENT_DATE AS "date",
	employee_id,
	salary,
	max_raise(employee_id) * 0.01 as amount,
	1 as percent
FROM
	employees;


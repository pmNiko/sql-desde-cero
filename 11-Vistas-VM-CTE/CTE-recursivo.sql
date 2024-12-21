/* Nombre de la tabla en memeria */
--- campos que vamos a tener
WITH RECURSIVE
	countdown (val) AS (
		-- inicializacion => el primer nivel o valores iniciales
		-- values(5)
		SELECT
			5 AS val
		UNION
		-- Query recursivo 
		SELECT
			val -1
		FROM
			countdown
		WHERE
			val > 1
	)
	
	SELECT * from countdown;

WITH RECURSIVE
	countup (val) AS (
		SELECT
			1 AS val
		UNION
		SELECT
			val + 1
		FROM
			countup
		WHERE
			val < 10
	)
	
	SELECT * from countup;



/* Tabla del 5 */
WITH RECURSIVE
	mult_five_table (base, target, tot) AS (
		VALUES(5, 1, 5)
		UNION
		SELECT
			base, target +1, base * (target + 1) as tot
		FROM
			mult_five_table
		WHERE
			target < 10
	)
	
	SELECT * from mult_five_table;



-- Estructura Organizacional
WITH RECURSIVE bosses as (
	-- init 
		SELECT id, name, reports_to from employees where id = 1
	UNION 
	--- recursive
	SELECT a.id, a.name, a.reports_to from employees as a
		INNER JOIN bosses as b on b.id = a.reports_to
	
) 
select * FROM bosses;


-- Recursivo con limite
WITH RECURSIVE bosses as (
	-- init 
		SELECT id, name, reports_to, 1 as depth from employees where id = 1
	UNION 
	--- recursive
	SELECT a.id, a.name, a.reports_to, depth +1 from employees as a
		INNER JOIN bosses as b on b.id = a.reports_to
	WHERE DEPTH < 2
) 
select * FROM bosses;


-- Mostrar nombres de jefe
WITH RECURSIVE bosses as (
	-- init 
		SELECT id, name, reports_to, 1 as depth from employees where id = 1
	UNION 
	--- recursive
	SELECT a.id, a.name, a.reports_to, depth +1 from employees as a
		INNER JOIN bosses as b on b.id = a.reports_to
	WHERE DEPTH < 10
) 
select bosses.*, employees.name as reports_to_name  FROM bosses
LEFT JOIN employees on employees.id = bosses.reports_to
ORDER BY depth;


/* Mostrar los nombres de los followers */
SELECT followers.*, leader."name", follower."name" as following FROM followers
INNER JOIN "user" leader ON leader.id = followers.leader_id
INNER JOIN "user" follower ON follower.id = followers.follower_id;


/* Sugerencia de seguimiento con un subquery*/
SELECT follower_id FROM followers WHERE leader_id = 1;

SELECT * from followers 
WHERE leader_id in (SELECT follower_id FROM followers WHERE leader_id = 1);
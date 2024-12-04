
/* En este caso estamos agrupando los posts por semana*/
SELECT
	date_trunc('week', created_at) AS weeks,
	count(*)
FROM
	posts
GROUP BY
	weeks
ORDER BY
	weeks DESC;

SELECT * from posts where post_id = 1;


/* creación de una vista tradicional */
CREATE OR REPLACE VIEW comments_per_week AS
SELECT
	date_trunc('week', posts.created_at) AS weeks,
	count(DISTINCT posts.post_id) AS number_of_posts,
	SUM(claps.counter) AS number_of_claps
FROM
	posts
	INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY
	weeks
ORDER BY
	weeks DESC;


SELECT * from comments_per_week;

/*Eliminación de la vista*/
drop VIEW comments_per_week;


/*Creación de una vista materializa*/
CREATE MATERIALIZED VIEW comments_per_week_mat AS
SELECT
	date_trunc('week', posts.created_at) AS weeks,
	count(DISTINCT posts.post_id) AS number_of_posts,
	SUM(claps.counter) AS number_of_claps
FROM
	posts
	INNER JOIN claps ON claps.post_id = posts.post_id
GROUP BY
	weeks
ORDER BY
	weeks DESC;


select * from comments_per_week;

select * from comments_per_week_mat;

REFRESH MATERIALIZED VIEW comments_per_week_mat;

















/*Alterar el nombrew de una vista tradicional*/
select * from comments_per_week;
alter VIEW comments_per_week rename to posts_per_week;

select * from posts_per_week;



/*Alterar el nombrew de una vista MATERIALIZED*/
select * from comments_per_week_mat;
ALTER MATERIALIZED VIEW comments_per_week_mat RENAME TO posts_per_week_mat;

SELECT
	*
FROM
	posts_per_week_mat;
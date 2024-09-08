SELECT 
	MAX(hire_date) + 1 as Simple_sum,
/*	MAX(hire_date) +  INTERVAL '1 day' as INTERVAL_sum_day,
	MAX(hire_date) +  INTERVAL '1 month' as INTERVAL_sum_month,
	MAX(hire_date) +  INTERVAL '1 year' as INTERVAL_sum_year,
	MAX(hire_date) +  INTERVAL '1.1 year' as INTERVAL_sum_year_month*/
	date_part( 'year', now() ) as CURRENT_DATE, 
	MAKE_INTERVAL( YEARs := 2023 ) as MAKE_INTERVAL ,
	MAKE_INTERVAL(YEARs := date_part( 'year', now())::integer ) as COMPUTED_INTERVAL,
	MAX(hire_date) + MAKE_INTERVAL( YEARS := 23 ) AS sum_interval
	
 from employees;



-- Computed years ago
 SELECT 
	hire_date as date_begin,
	MAKE_INTERVAL( YEARS := 2024 - EXTRACT( YEARS FROM hire_date )::INTEGER ) as years_ago_manual,
	MAKE_INTERVAL( YEARS := date_part( 'years', CURRENT_DATE )::INTEGER - EXTRACT( YEARS FROM hire_date )::INTEGER ) as years_ago_computed
FROM
	employees
ORDER BY years_ago_computed DESC;
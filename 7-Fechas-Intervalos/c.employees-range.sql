SELECT
    first_name,
    last_name,
    hire_date,
    EXTRACT(
        YEAR
        FROM
            AGE (CURRENT_DATE, hire_date)
    ) AS years_of_service,
    CASE
        WHEN hire_date > now () - INTERVAL '2 year' then '1 año o menos'
        WHEN hire_date > now () - INTERVAL '3 year' then '1-3 años'
        WHEN hire_date > now () - INTERVAL '6 year' then '3-6 años'
        ELSE '+ de 6 años'
    END as tenure_range
FROM
    employees
ORDER BY
    hire_date ASC;
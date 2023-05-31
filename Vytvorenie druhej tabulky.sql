CREATE OR REPLACE TABLE t_mario_soldan_project_SQL_secondary_final (
SELECT 
	e.country,
	e.year,
	e2.year as year_prev, 
    round( ( e.GDP - e2.GDP ) / e2.GDP * 100, 2 ) as GDP_growth
FROM economies e 
JOIN economies e2 
    ON e.country = e2.country
    AND e.year = e2.year + 1
    AND e.year < 2020
JOIN countries c
	ON e.country = c.country);
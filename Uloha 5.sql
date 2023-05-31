SELECT *
FROM t_mario_soldan_project_sql_secondary_final
WHERE country LIKE "Czech Republic"
	AND year_prev>2005
	AND YEAR<2019
ORDER BY year_prev;
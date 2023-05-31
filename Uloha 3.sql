-- 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

-- Vzhladom na extremne mnoztvo dat v povodnej tabulke a dlhotrvajuce execution query som si vytvoril pomocnu tabulku, z ktorej som nasledne vykonal potrebny SELECT 

CREATE OR REPLACE TABLE t_mario_soldan_pomocna_tabulka_1 (
SELECT
	DISTINCT food_category_code,
	food_category,
	food_price,
	MAX(price_measured_from) AS p_measured_date
FROM t_mario_soldan_project_SQL_primary_final
WHERE food_price_measured_quarter = 4
GROUP BY YEAR(price_measured_from), food_category_code);


SELECT
	tmspt.food_category_code,
	tmspt.food_category,
	tmspt.food_price AS food_price_year,
	YEAR(tmspt.p_measured_date) AS year,
	tmspt2.food_price AS food_price_prev_year,
	YEAR(tmspt2.p_measured_date) AS prev_year,
	round((tmspt.food_price-tmspt2.food_price)/tmspt2.food_price*100,2) as price_growth
FROM t_mario_soldan_pomocna_tabulka_1 tmspt
JOIN t_mario_soldan_pomocna_tabulka_1 tmspt2
	ON tmspt.food_category_code = tmspt2.food_category_code
	AND YEAR(tmspt.p_measured_date) = YEAR(tmspt2.p_measured_date) + 1
	AND YEAR(tmspt.p_measured_date) < 2019
GROUP BY tmspt.food_category_code, tmspt.p_measured_date;
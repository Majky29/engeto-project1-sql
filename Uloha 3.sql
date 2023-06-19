-- 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

-- Vzhladom na extremne mnoztvo dat v povodnej tabulke a dlhotrvajuce execution query som si vytvoril pomocnu tabulku, z ktorej som nasledne vykonal potrebny SELECT 

CREATE OR REPLACE TABLE t_mario_soldan_food_price_growth (
SELECT
	DISTINCT food_category_code,
	food_category,
	food_price,
	MAX(price_measured_from) AS p_measured_date
FROM t_mario_soldan_project_SQL_primary_final
GROUP BY YEAR(price_measured_from), food_category_code);


SELECT
	tmsfpg.food_category_code,
	tmsfpg.food_category,
	tmsfpg.food_price AS food_price_year,
	YEAR(tmsfpg.p_measured_date) AS year,
	tmsfpg2.food_price AS food_price_prev_year,
	YEAR(tmsfpg2.p_measured_date) AS prev_year,
	round((tmsfpg.food_price-tmsfpg2.food_price)/tmsfpg2.food_price*100,2) as price_growth
FROM t_mario_soldan_food_price_growth tmsfpg
JOIN t_mario_soldan_food_price_growth tmsfpg2
	ON tmsfpg.food_category_code = tmsfpg2.food_category_code
	AND YEAR(tmsfpg.p_measured_date) = YEAR(tmsfpg2.p_measured_date) + 1
	AND YEAR(tmsfpg.p_measured_date) < 2019
GROUP BY tmsfpg.food_category_code, tmsfpg.p_measured_date;
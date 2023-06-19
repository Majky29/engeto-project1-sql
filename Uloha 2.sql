-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

-- Chlieb v prvom porovnatelnom obdobi
SELECT 
	industry_branch,
	industry_branch_code,
	average_wages,
	food_category,
	food_price,
	DATE_FORMAT(MIN(price_measured_from), '%e. %M %Y') AS p_measured_from,
	DATE_FORMAT(MIN(price_measured_to), '%e. %M %Y') AS p_measured_to,
	ROUND(average_wages/food_price,1) AS affordable_amount_of_food
FROM t_mario_soldan_project_SQL_primary_final
WHERE food_category_code = '111301' 
GROUP BY industry_branch_code
ORDER BY industry_branch_code ASC;

-- Mlieko v prvom porovnatelnom obdobi
SELECT 
	industry_branch,
	industry_branch_code,
	average_wages,
	food_category,
	food_price,
	DATE_FORMAT(MIN(price_measured_from), '%e. %M %Y') AS p_measured_from,
	DATE_FORMAT(MIN(price_measured_to), '%e. %M %Y') AS p_measured_to,
	ROUND(average_wages/food_price,1) AS affordable_amount_of_food
FROM t_mario_soldan_project_SQL_primary_final
WHERE food_category_code = '114201'
GROUP BY industry_branch_code
ORDER BY industry_branch_code ASC;

-- Chlieb v poslednom porovnatelnom obdobi
SELECT 
	industry_branch,
	industry_branch_code,
	average_wages,
	food_category,
	food_price,
	DATE_FORMAT(MAX(price_measured_from), '%e. %M %Y') AS p_measured_from,
	DATE_FORMAT(MAX(price_measured_to), '%e. %M %Y') AS p_measured_to,
	ROUND(average_wages/food_price,1) AS affordable_amount_of_food
FROM t_mario_soldan_project_SQL_primary_final
WHERE food_category_code = '111301'
GROUP BY industry_branch_code
ORDER BY industry_branch_code ASC;

-- Mlieko v poslednom porovnatelnom obdobi
SELECT 
	industry_branch,
	industry_branch_code,
	average_wages,
	food_category,
	food_price,
	DATE_FORMAT(MAX(price_measured_from), '%e. %M %Y') AS p_measured_from,
	DATE_FORMAT(MAX(price_measured_to), '%e. %M %Y') AS p_measured_to,
	ROUND(average_wages/food_price,1) AS affordable_amount_of_food
FROM t_mario_soldan_project_SQL_primary_final
WHERE food_category_code = '114201'
GROUP BY industry_branch_code
ORDER BY industry_branch_code ASC;
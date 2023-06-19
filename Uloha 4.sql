-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

-- Rovnaky pripad, ako minula uloha

CREATE OR REPLACE TABLE t_mario_soldan_wages_growth (
SELECT 
	DISTINCT average_wages,
	payroll_year,
	tmsp.industry_branch_code,
	tmsp.industry_branch
	FROM t_mario_soldan_project_SQL_primary_final tmsp
GROUP BY tmsp.industry_branch_code, tmsp.payroll_year);

SELECT * FROM t_mario_soldan_wages_growth;

SELECT 
	DISTINCT tmswg.average_wages AS average_wages_year,
	tmswg.payroll_year AS year,
	tmswg2.average_wages AS average_wages_prev_year,
	tmswg2.payroll_year AS prev_year,
	tmswg.industry_branch_code,
	tmswg.industry_branch,
	round((tmswg.average_wages-tmswg2.average_wages)/tmswg2.average_wages*100, 2) as average_wages_growth
FROM t_mario_soldan_wages_growth tmswg
JOIN t_mario_soldan_wages_growth tmswg2
	ON tmswg.industry_branch_code = tmswg2.industry_branch_code 
	AND tmswg.payroll_year = tmswg2.payroll_year + 1
	AND tmswg.payroll_year < 2019
GROUP BY tmswg.industry_branch_code, tmswg.payroll_year;
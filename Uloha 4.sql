-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

-- Rovnaky pripad, ako minula uloha

CREATE OR REPLACE TABLE t_mario_soldan_pomocna_tabulka_2 (
SELECT 
	DISTINCT average_wages,
	payroll_year,
	tmsp.industry_branch_code,
	tmsp.industry_branch
	FROM t_mario_soldan_project_SQL_primary_final tmsp
WHERE  tmsp.payroll_quarter = 4
GROUP BY tmsp.industry_branch_code, tmsp.payroll_year);

SELECT 
	DISTINCT tmspt.average_wages AS average_wages_year,
	tmspt.payroll_year AS year,
	tmspt2.average_wages AS average_wages_prev_year,
	tmspt2.payroll_year AS prev_year,
	tmspt.industry_branch_code,
	tmspt.industry_branch,
	round((tmspt.average_wages-tmspt2.average_wages)/tmspt2.average_wages*100, 2) as average_wages_growth
FROM t_mario_soldan_pomocna_tabulka_2 tmspt
JOIN t_mario_soldan_pomocna_tabulka_2 tmspt2
	ON tmspt.industry_branch_code = tmspt2.industry_branch_code 
	AND tmspt.payroll_year = tmspt2.payroll_year + 1
	AND tmspt.payroll_year < 2019
GROUP BY tmspt.industry_branch_code, tmspt.payroll_year;
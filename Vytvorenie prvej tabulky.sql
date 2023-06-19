CREATE OR REPLACE TABLE t_mario_soldan_project_SQL_primary_final (
SELECT 
	cp.value AS average_wages,
	cpib.code AS industry_branch_code,
	cpib.name AS industry_branch,
	cp.payroll_year,
	cp.payroll_quarter,
	cpc.code AS food_category_code,
	cpc.name AS food_category,
	cprice.value AS food_price,
	cprice.date_from AS price_measured_from,
	cprice.date_to AS price_measured_to
FROM czechia_payroll cp
JOIN czechia_price cprice
	ON YEAR(cprice.date_from) = cp.payroll_year AND cp.value_type_code = '5958' AND cprice.region_code IS NULL AND cp.calculation_code = 200 AND payroll_quarter = 4 -- zredukoval som objem dat na potrebnu mnozinu potrebnu na zodpovedanie otazok
JOIN czechia_payroll_industry_branch cpib
	ON cp.industry_branch_code = cpib.code 
JOIN czechia_payroll_unit cpu
	ON cp.unit_code = cpu.code 
JOIN czechia_payroll_value_type cpvt
	ON cp.value_type_code = cpvt.code
JOIN czechia_price_category cpc 
	ON cprice.category_code = cpc.code);
	

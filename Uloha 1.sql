-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

SELECT 
DISTINCT average_wages,
industry_branch_code,
industry_branch,
payroll_year
FROM t_mario_soldan_project_SQL_primary_final
WHERE payroll_quarter = 4
GROUP BY industry_branch_code, payroll_year;
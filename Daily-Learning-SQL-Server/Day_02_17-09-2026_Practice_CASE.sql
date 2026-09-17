SELECT NAME FROM SYS.DATABASES;
USE bank_db;

SELECT * FROM SYS.TABLES;
EXEC SP_HELP EMPLOYEES;

----------------------------------------------
-- CASE
----------------------------------------------
-- CASE 1 --
SELECT fname, lname, salary,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium Earner'
	ELSE 'Low Earner'
	END AS Salary_band
FROM
	Employees;

-- CASE 2 --
/* Q.1 Calculate a bonus amount. Human Resource and Finance get a 10% bonus,
	Tech gets a 12% bonus, and everyone else gets a standard 5% bouns.
*/
SELECT fname, lname, department, salary,
CASE 
	WHEN department IN('Human Resource','Finance') THEN salary*0.10
	WHEN department = 'Tech' THEN salary * 0.12
	ELSE salary * 0.05
	END AS salary_bonus
FROM
	Employees;

-- CASE 3 The Tenure Classification --
SELECT fname, lname, hire_date,
CASE
	WHEN hire_date < '2020-01-01' THEN 'Senior'
	WHEN hire_date >= '2020-01-01' and hire_date < '2021-01-01' THEN 'Mid-level'
	ELSE 'Junior'
	END AS Seniority_level
FROM
	Employees;


-- CASE 4 The City Allowance --
SELECT fname, lname, city, salary,
CASE
	WHEN city IN ('Mumbai','Bengluru') THEN salary + 5000
	WHEN city = 'Pune' THEN salary + 3000
	ELSE salary + 1000
	END AS salary_allowance
FROM
	Employees;


-- CASE 5 The Department and Role Matrix --
 
SELECT fname, lname,department, job_title, 
CASE
	WHEN department = 'Tech' AND job_title LIKE '%Engineer%' THEN 'Critical Tech'
	ELSE 'Standard'
	END AS Role_Matrix
FROM
	Employees;


-- CASE 6 The Region Classifier --
SELECT fname, lname, city,
CASE
	WHEN city IN('Mumbai','Pune') THEN 'West India Region'
	WHEN city IN('Bengluru','Hyderabad') THEN 'South India Region'
	END AS Region_Classifier
FROM
	Employees;


-- CASE 7 The Tax Calculator --
SELECT fname, lname, salary,
CASE
	WHEN salary > 55000 THEN salary * 0.15
	WHEN salary BETWEEN 45000 AND 55000 THEN salary * 0.10
	ELSE salary * 0.05
	END Tax_Deduction
FROM
	Employees;


-- CASE 8 The Promotion Checker --
	SELECT fname, lname, hire_date, salary,
	CASE
		WHEN hire_date < '2020-01-01' AND salary < 55000 THEN 'Eligible'
		ELSE 'Not Eligible'
		END AS Promotion_Status
	FROM
		Employees;


-- CASE 9 Role Grouping (Using LIKE) --
SELECT fname, lname, job_title,
CASE
	WHEN job_title LIKE '%Lead%' OR job_title LIKE '%Executive%' THEN 'Leadership'
	WHEN job_title LIKE '%Engineer%' OR job_title LIKE '%Scientist%' THEN 'Technical'
	ELSE 'General Staff'
	END AS role_group
FROM
	Employees;



-- CASE 10 The Department-City Matrix --
SELECT fname, lname, department, city,
CASE
	WHEN department = 'Tech' AND city = 'Pune' THEN 'Hybrid'
	WHEN department = 'Finance' AND city = 'Mumbai' THEN 'On-site'
	ELSE 'Remote'
	END AS office_requirements
FROM
	Employees;
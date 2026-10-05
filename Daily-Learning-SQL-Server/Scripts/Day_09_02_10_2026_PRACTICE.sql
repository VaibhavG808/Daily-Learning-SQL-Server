SELECT name FROM SYS.DATABASES;
USE bank_db;
SELECT NAME FROM SYS.TABLES;
EXEC SP_HELP EMPLOYEES;
SELECT * FROM Employees;

-- PERFORM CRUD OPERATION --

-- CASE
SELECT fname,department,salary,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'medium earner'
	ELSE 'LOW SALARY'
	END AS SALARY_BAND
FROM
	Employees
ORDER BY salary;


SELECT FNAME, DEPARTMENT, SALARY,
CASE
	WHEN DEPARTMENT IN ('HUMAN RESOURCE','FINANCE') THEN SALARY*0.10
	WHEN DEPARTMENT = 'TECH' THEN SALARY*0.12
	ELSE SALARY*0.05
	END AS BONUS
FROM
	Employees
ORDER BY department;


SELECT *,
CASE
	WHEN city = 'Pune' THEN 'Pune Employees'
	WHEN city = 'Mumbai' THEN 'Mumbai Employees'
	ELSE 'Other city Employees'
	end as city_type
from
	Employees;


SELECT *,
CASE
	WHEN SALARY < 40000 THEN 'ENTRY LEVEL'
	WHEN SALARY BETWEEN 40000 AND 60000 THEN 'MID LEVEL'
	ELSE 'SENIOR'
	END AS SALARY_LEVEL
FROM
	Employees
ORDER BY SALARY_LEVEL;


-- SUB-QUERIES
SELECT * FROM Employees WHERE salary >
(SELECT AVG(SALARY) FROM Employees);

SELECT * FROM Employees WHERE salary >
(SELECT MIN(SALARY) FROM Employees);

SELECT * FROM Employees WHERE salary =
(SELECT MAX(SALARY) FROM Employees WHERE department='TECH')

SELECT * FROM Employees WHERE department =
(SELECT DEPARTMENT FROM Employees WHERE fname = 'Rahul');


SELECT * FROM Employees WHERE city =
(SELECT city FROM Employees WHERE fname = 'Amit');

SELECT * FROM Employees e1 WHERE salary =
(SELECT MAX(SALARY) FROM Employees e2
WHERE e2.department = e1.department);

SELECT * FROM EMPLOYEES WHERE department in
(SELECT department total_emp FROM Employees 
group by department
 having COUNT(*) > 1)

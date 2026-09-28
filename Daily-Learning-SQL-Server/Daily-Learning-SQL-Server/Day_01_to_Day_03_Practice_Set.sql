SELECT name FROM SYS.DATABASES;
USE bank_db;
SELECT * FROM SYS.TABLES;
SELECT * FROM Employees;
SELECT * FROM Employees ORDER BY salary;

-- DISTINCT 
SELECT DISTINCT department FROM Employees;
SELECT DISTINCT city FROM Employees;
SELECT DISTINCT * FROM Employees;
SELECT DISTINCT Job_title FROM Employees;

-- select 
SELECT * FROM Employees;
SELECT fname, lname, job_title, salary FROM Employees;
SELECT FNAME, SALARY FROM EMPLOYEES;
SELECT SALARY, DEPARTMENT FROM EMPLOYEES;

-- ORDER BY
SELECT * FROM EMPLOYEES ORDER BY SALARY;
SELECT FNAME, SALARY, department FROM EMPLOYEES ORDER BY department;
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT * FROM EMPLOYEES ORDER BY FNAME DESC
SELECT * FROM EMPLOYEES ORDER BY department DESC;

-- LIKE
SELECT * FROM EMPLOYEES WHERE FNAME LIKE '%MAN%';
SELECT * FROM EMPLOYEES WHERE department LIKE '%MAN%';
SELECT * FROM EMPLOYEES WHERE job_title LIKE '%sale%';
SELECT * FROM EMPLOYEES WHERE city LIKE '%mum%';
SELECT * FROM EMPLOYEES WHERE FNAME LIKE '[ABCD]%';
SELECT * FROM EMPLOYEES WHERE hire_date LIKE '%2019%';

-- TOP
SELECT TOP 5 * FROM EMPLOYEES;

-- LOGICAL OPERATORS AND OR
SELECT * FROM EMPLOYEES WHERE department = 'TECH' AND CITY = 'PUNE';
SELECT * FROM EMPLOYEES WHERE department = 'FINANCE' OR city = 'PUNE';
SELECT * FROM EMPLOYEES WHERE salary > 50000 AND city = 'PUNE';
SELECT * FROM EMPLOYEES WHERE salary < 40000 OR city = 'PUNE';

-- IN NOT IN BETWEEN
SELECT * FROM EMPLOYEES WHERE CITY IN ('PUNE', 'MUMBAI');
SELECT * FROM EMPLOYEES WHERE CITY NOT IN ('PUNE', 'MUMBAI');
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 60000 AND 70000;

-- CASE
-- SALARY BAND
SELECT FNAME, LNAME, SALARY,
CASE 
	WHEN SALARY > 60000 THEN 'HIGH EARNER'
	WHEN SALARY BETWEEN 50000 AND 60000 THEN 'MEDIUM EARNER'
	ELSE 'LOW EARNER'
	END AS SALARY_BAND
FROM 
	EMPLOYEES;



/* Q.1 Calculate a bonus amount. Human Resource and Finance get a 10% bonus,
	Tech gets a 12% bonus, and everyone else gets a standard 5% bouns.
*/

SELECT FNAME, LNAME, SALARY, DEPARTMENT,
CASE
	WHEN DEPARTMENT IN ('HUMAN RESOURCE', 'FINANCE') THEN SALARY * 0.10
	WHEN DEPARTMENT = 'TECH' THEN SALARY * 0.12
	ELSE SALARY * 0.05
	END AS BONUS
FROM
	EMPLOYEES
ORDER BY department;


--- NOT NULL
SELECT * FROM EMPLOYEES WHERE FNAME IS NOT NULL;

-- NOT LIKE
SELECT * FROM EMPLOYEES WHERE FNAME NOT LIKE 'A%'

-- Aggrigate functions
SELECT SUM(SALARY) AS total_salary FROM Employees;
SELECT MAX(SALARY) AS max_salary FROM Employees;
SELECT MIN(SALARY) AS min_salary FROM Employees;
SELECT AVG(SALARY) AS avg_salary FROM Employees;
SELECT COUNT(*) AS total_rows FROM Employees;

-- GROUP BY
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT;
SELECT DEPARTMENT, AVG(SALARY) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT;
SELECT emp_id, COUNT(emp_id) AS TOTAL_SALARY FROM EMPLOYEES GROUP BY emp_id;

-- MULTICOLUMN GROUPING
SELECT department, city,
COUNT(emp_id) as total_emp 
FROM Employees GROUP BY department, city
ORDER BY department;

SELECT job_title, department,
COUNT(emp_id) AS total_emp
FROM Employees GROUP BY job_title, department
ORDER BY department;

-- HAVING CLAUSE --
/*
1. Find departments with more than 2 employees
2. Find job titles with an average salary above 40000
3. Find department with average salary above 50000
4. Find department with total salary above 90000
*/

-- employees greater than 1
SELECT department, count(emp_id) as totalemp
FROM Employees group by department
having count(emp_id) > 1;


SELECT job_title,  count(emp_id) as totalemp
from Employees group by job_title
having count(emp_id)>1;

-- avg salary by department
select job_title, avg(salary) as avgsalary
from employees group by job_title
having avg(salary) > 40000
ORDER BY avgsalary;

-- total salary by department
select department, sum(salary) as totalsalary
from employees group by department
having sum(salary) > 60000;


-- GROUP BY ROLLUP
select department, count(emp_id) as totalemp
from employees group by rollup (department);

select department, sum(salary) as totalsalary
from employees group by rollup(department);

select job_title, sum(salary) as totalsalary
from employees group by rollup(job_title);


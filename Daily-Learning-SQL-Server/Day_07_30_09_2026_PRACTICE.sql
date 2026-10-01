SELECT NAME FROM SYS.DATABASES;
USE bank_db;
SELECT name FROM SYS.TABLES;
EXEC SP_HELP Employees;
SELECT * FROM Employees;

-- CASE --
/*
- Calculate employee bonuses based on department:
  - HR & Finance → 10%
  - IT → 12%
  - Others → 5%
 */

 SELECT *,
CASE
	WHEN department IN ('Human Resource','Finance') THEN salary*0.10
	WHEN department = 'Tech' THEN salary*0.12
	ELSE salary *0.05
	END AS bonus
FROM
	Employees;



SELECT *,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium Earner'
	ELSE 'Low Earner'
	END AS salary_band
FROM
	Employees
order by salary;


-- Section 5.3 SUB-QUERIES
-- USECASES

-- Section 5.3 SUB-QUERIES
-- USECASES
/*
1. Find Employees earning more than the company average.
2. Find the employees who work in the same city as the 
	specific person (ex. Raj Sharma).
3. Find the highest paid employee name.
4. Find the highest paid employee in each department.
*/

/* Sub-Query:- also called inner query or nested query, 
is a query inside another query.
1. A sub-query runs first and gives result.
2. The main query the outer query then uses that result.
*/
SELECT * FROM Employees WHERE salary >
(SELECT AVG(salary) FROM Employees);

SELECT * FROM Employees WHERE department IN
(SELECT department FROM Employees WHERE city = 'Pune');

SELECT * FROM Employees WHERE salary =
(SELECT MAX(salary) FROM Employees);

SELECT * FROM Employees e1 WHERE salary = 
(SELECT MAX(salary) FROM Employees e2
WHERE e2.department = e1.department);

--- Co-related sub Query
-- Highest Salary of each department.
SELECT * FROM Employees e1 WHERE salary =
(SELECT MAX(salary) FROM Employees e2
WHERE e2.department = e1.department);

-- 2. Find the employee(s) who earn the lowest salary in the company.
SELECT * FROM Employees WHERE salary = 
(SELECT MIN(salary) FROM Employees);

-- 3. Find employees who were hired in the earliest year present in the table.
SELECT * FROM Employees WHERE hire_date =
(SELECT MIN(hire_date) FROM Employees);


-- Sub Query Inline View --
-- 1. find departments whos average salary is above 50000

-- INLINE VIWE --
SELECT department, avgsal FROM 
(SELECT department, AVG(salary) avgsal FROM Employees
GROUP BY department) dept_sal
WHERE avgsal > 50000;

-- max salary above 50000
SELECT department, maxsal FROM(
SELECT department, max(salary) AS maxsal FROM Employees
GROUP BY department) AS dept_maxsal
WHERE maxsal > 50000;

-- min salary below 50000
SELECT department, minsal FROM(
SELECT department, min(salary) AS minsal FROM Employees
GROUP BY department) AS dep_minsal
WHERE minsal < 50000;


-- total salary above 90000
SELECT department, total_sal from(
SELECT department, SUM(salary) as total_sal FROM Employees
GROUP BY department) as dept_totsal
WHERE total_sal > 90000;


-- 2. find job_title whos average salary is above 50000 
SELECT job_title, avgsal FROM 
(SELECT job_title, AVG(salary) AS avgsal FROM Employees
GROUP BY job_title) AS jobt_sal
WHERE avgsal > 50000;

-- String Functions --
/*- CONCAT
- CONCAT\_WS
- SUBSTRING
- LEFT
- RIGHT
- LEN
- UPPER
- LOWER
- TRIM
- LTRIM
- RTRIM
- REPLACE
- REVERSE
- CHARINDEX
*/
SELECT CONCAT('hi',' ','hello');
SELECT CONCAT_WS(':','hi','Hello');
SELECT SUBSTRING('HELLO',2,4);
SELECT LEFT('ABCD',2);
SELECT RIGHT('ABCD',2);
SELECT LEN('HELLO');
SELECT UPPER('hello');
SELECT LOWER('HELLO');
SELECT TRIM('   HELLO   ');
SELECT LEN('   HELLO   ');
SELECT LEN(LTRIM('   HELLO   '));
SELECT LEN(RTRIM('   HELLO   '));
SELECT REPLACE('HELLO','H','F');
SELECT REVERSE('HELLO');
SELECT CHARINDEX('O','HELLO');


/* ### Exercises

 - Create employee full names.
- Extract a portion of an employee's name.
- Extract the first character of a department.
- Extract the last characters of a name.
- Find the length of employee names.
- Convert names to uppercase and lowercase.
- Remove unwanted spaces.
- Replace specific text within a column.
- Reverse employee names.
- Find the position of a specific character.
- Create a formatted employee summary.
*/
SELECT * FROM Employees;
SELECT CONCAT(fname,' ', lname)as fullname FROM Employees;
SELECT LEFT(fname,3) FROM Employees;
SELECT LEFT(department,1) FROM Employees;
SELECT RIGHT(fname,1) FROM Employees;
SELECT LEN(CONCAT(fname,lname)) FROM Employees;
SELECT UPPER(fname),LOWER(lname) FROM Employees
SELECT TRIM(fname) FROM Employees;
SELECT REPLACE(fname,'Raj','Raju') FROM Employees;
SELECT REVERSE(fname) FROM Employees;
SELECT CHARINDEX('a',fname) FROM Employees;
SELECT CONCAT_WS(',',emp_id,CONCAT(fname,' ',lname), department,salary) FROM Employees;

-- DATE Function --
SELECT (GETDATE());

SELECT DATEADD(YEAR, 2, GETDATE());
SELECT DATEADD(MONTH, 2, GETDATE());
SELECT DATEADD(DAY, 2, GETDATE());

SELECT DATEDIFF(YEAR,'2025-01-01',GETDATE());
SELECT DATEDIFF(MONTH,'2025-01-01',GETDATE());
SELECT DATEDIFF(DAY,'2025-01-01',GETDATE());

SELECT DATEPART(YEAR,GETDATE());
SELECT DATEPART(MONTH,GETDATE());
SELECT DATEPART(DAY,GETDATE());

SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());

SELECT FORMAT(GETDATE(), 'MM.dd.yyyy');

/*
 ### Exercises

 - Retrieve the current date.
- Retrieve the current date and time.
- Extract the year from a hire date.
- Extract the month from a hire date.
- Extract the day from a hire date.
- Calculate employee tenure.
- Find employees hired after a specific year.
- Calculate future dates using DATEADD.

---
*/

SELECT DAY(GETDATE());
SELECT (GETDATE());
SELECT YEAR(hire_date) FROM Employees;
SELECT MONTH(hire_date) FROM Employees;
SELECT DAY(hire_date) FROM Employees;
SELECT DATEDIFF(YEAR,hire_date,GETDATE()) FROM Employees;
SELECT * FROM Employees WHERE hire_date >= '2020-01-01';
SELECT DATEADD(DAY,30,GETDATE());


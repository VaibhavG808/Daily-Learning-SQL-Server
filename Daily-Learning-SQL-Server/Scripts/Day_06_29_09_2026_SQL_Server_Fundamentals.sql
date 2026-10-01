SELECT NAME FROM SYS.DATABASES;
USE bank_db;
SELECT * FROM SYS.TABLES;
EXEC SP_HELP Employees;
SELECT * FROM Employees;

-- Sub Query Inline View --
-- 1. find departments whos average salary is above 50000

-- INLINE VIWE --
SELECT department, avg FROM (
SELECT department, AVG(SALARY) AS avg 
FROM Employees GROUP BY department) AS dept_avg
WHERE AVG > 50000;


-- MAX salary is above 55000
SELECT department, MAXS FROM (
SELECT department, MAX(salary) MAXS FROM Employees
GROUP BY department) AS MAX_SALARY
WHERE MAXS > 55000;

-- TOTAL SALARY IS ABOVE 80000
SELECT department, toal FROM (
SELECT department, SUM(salary) toal FROM Employees
GROUP BY department) AS total_salary
WHERE toal > 80000;


-- MINIMUM SALARY IS LESS THAN 50000
SELECT department, mins FROM (
SELECT department, MIN(salary) AS mins
FROM Employees
GROUP BY department) AS MINIMUM_SALARY
WHERE mins < 50000;


-- SECTION 6 --
-- STRING FUNCTION --
/* 1. CONCAT / CONCAT_WS
2. SUBSTRING
3. LEFT / RIGHT
4. LEN
5. UPPER / LOWER
6. TRIM / LTRIM / RTRIM
7. REPLACE
8. CHARINDEX
*/

SELECT CONCAT(fname, ' ',lname) AS Full_Name FROM Employees;

SELECT CONCAT_WS(',',emp_id,fname,lname,department) AS fullname FROM Employees;

-- substring --
SELECT SUBSTRING(fname, 2,4) as SUBS FROM Employees;

-- REPLACE --
SELECT REPLACE (department, 'Human Resource', 'HR') FROM Employees;

-- REVERSE
SELECT REVERSE('HELLO');

-- LENGTH
SELECT LEN(email) FROM Employees;

-- UPPER & LOWER
SELECT UPPER(fname) FROM Employees;
SELECT UPPER(lname) FROM Employees;

-- LEFT & RIGHT
SELECT RIGHT('ABCDQRS', 3);
SELECT LEFT('ABCDQRS', 3);

-- TRIM
SELECT TRIM('  ALRIGHT  ');
SELECT LEN('  ALRIGHT  ');

SELECT LEN(TRIM('  ALRIGHT  '));

-- CHARINDEX --
SELECT CHARINDEX('OM','THOMAS');

-- EXERCISE

SELECT CONCAT_WS(':',emp_id,CONCAT(fname, ' ',lname),department,salary) FROM Employees;

SELECT CONCAT_WS(':',emp_id,fname,UPPER(department)) FROM Employees;

SELECT CONCAT(LEFT(department,1),emp_id), fname  FROM Employees;

-- DATE FUNCTION --
SELECT GETDATE() 

SELECT DATEADD(YEAR,2,GETDATE())
SELECT DATEADD(MONTH,3,GETDATE())

SELECT DATEDIFF(DAY,'2026-01-01',GETDATE())

SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())

SELECT FORMAT(GETDATE(),'MM/dd/yyyy');

-- Exercise String Functions --

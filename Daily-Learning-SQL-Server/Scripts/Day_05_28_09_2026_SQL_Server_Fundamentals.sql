SELECT NAME FROM SYS.DATABASES;
USE bank_db;
SELECT * FROM SYS.TABLES;
EXEC SP_HELP Employees;
SELECT * FROM Employees;

/*
1. Find Employees earning more than the company average.
2. Find the employees who work in the same city as the 
	specific person (ex. Raj Sharma).
3. Find the highest paid employee name.
4. Find the highest paid employee in each department.
*/

SELECT * FROM Employees WHERE salary >
(SELECT AVG(salary) FROM Employees);

SELECT * FROM Employees WHERE department IN
(SELECT department FROM Employees WHERE city = 'Mumbai');

SELECT * FROM Employees WHERE salary = 
(SELECT MAX(salary) FROM Employees);

SELECT * FROM Employees e1
WHERE salary =
(SELECT MAX(salary) sal FROM Employees e2 
WHERE e2.department = e1.department);


-- 2. Find the employee(s) who earn the lowest salary in the company.
SELECT * FROM Employees WHERE salary =
(SELECT MIN(salary) FROM Employees);


-- 3. Find employees who were hired in the earliest year present in the table.
SELECT * FROM Employees WHERE hire_date =
(SELECT MIN(hire_date) FROM Employees);


-- 4. Find employees who work in the same department as 'Priya Singh'.
SELECT * FROM Employees WHERE department = 
(SELECT department FROM Employees WHERE fname = 'Priya');

-- 5. Find employees working in cities where the 'Tech' department has a presence.
SELECT * FROM Employees WHERE city IN
(SELECT city FROM Employees WHERE department = 'Tech');

-- 6. Find employees whose job title matches any job title in the 'Finance' department.
SELECT * FROM Employees WHERE job_title IN
(SELECT job_title FROM Employees WHERE department = 'Finance');

-- 7. Find employees who earn more than the average salary of their own specific department.
SELECT * FROM Employees e1
WHERE salary > ( SELECT AVG(salary) FROM Employees e2
WHERE e2.department = e1.department);

-- 8. Find the employee(s) who earn the maximum salary in each department.
SELECT * FROM Employees e1 WHERE salary =
(SELECT MAX(salary) FROM Employees e2
WHERE e2.department = e1.department);

-- 9. Find employees who were hired before the overall company average hire date.
/* ERROR ON DATE CAST
SELECT fname, lname, hire_date
FROM Employees
WHERE hire_date < (
    -- Subquery: Calculates the overall company average hire date
    SELECT CAST(AVG(CAST(hire_date AS FLOAT)) AS DATE)
    FROM Employees
);
*/

SELECT fname, lname, hire_date
FROM Employees
WHERE hire_date < (
    -- Subquery: Safely calculates the average hire date in SQL Server
    SELECT DATEADD(day, AVG(DATEDIFF(day, '1900-01-01', hire_date)), '1900-01-01')
    FROM Employees
);


-- 10. Find employees who work in a department that has more than 1 employee.
SELECT * FROM Employees WHERE department IN(
SELECT department FROM Employees GROUP BY department
HAVING COUNT(*) > 1);
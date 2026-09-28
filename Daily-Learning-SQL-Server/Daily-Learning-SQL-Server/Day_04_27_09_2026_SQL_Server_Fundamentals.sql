select name from sys.databases;
use bank_db;
select * from sys.tables;
select * from Employees;
exec sp_help Employees;
exec sp_databases;

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

SELECT * FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees)


SELECT * FROM Employees 
WHERE department IN (SELECT department FROM Employees WHERE city = 'Mumbai');

--- Co-related sub Query
-- Highest Salary of each department.
SELECT * FROM Employees e1
WHERE salary = (
SELECT MAX(salary) FROM Employees e2
WHERE e2.department = e1.department);

SELECT * FROM Employees WHERE salary IN(
SELECT MAX(salary) FROM Employees GROUP BY department);

-- INLINE VIEW --
SELECT department, avg FROM 
(SELECT department, AVG(salary) as avg FROM Employees
GROUP BY department) as dept_avg
WHERE avg > 50000;
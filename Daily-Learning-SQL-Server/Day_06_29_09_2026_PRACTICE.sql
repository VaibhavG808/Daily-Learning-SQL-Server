SELECT NAME FROM SYS.DATABASES;
USE bank_db;
EXEC SP_TABLES;
SELECT * FROM SYS.TABLES;
SELECT * FROM Employees;

-- CRUD OPERATIONS --
/*
1. CREATE TABLE WITH ALL CONSTRAINS
2. INSERT DATA
3. READ DATA USING SELECT 
4. UPDATE DATA
5. DELETE DATA
*/

CREATE TABLE EMP (empid INT PRIMARY KEY IDENTITY (101,1) NOT NULL,
fname VARCHAR(50) NOT NULL, lname VARCHAR(50) NOT NULL,
email NVARCHAR(20) UNIQUE NOT NULL, job_title VARCHAR(20) NOT NULL,
department VARCHAR(20) NOT NULL, salary DECIMAL(10,2), 
hire_date DATE NOT NULL DEFAULT CONVERT(DATE, GETDATE()),
city VARCHAR(20));


-- Inserting employee data
INSERT INTO employees (fname, lname, email, job_title, department, salary, hire_date, city) 
VALUES
('Raj', 'Sharma', 'raj.sharma@example.com','Lead Engineer', 'Tech', 50000.00, '2020-01-15','Mumbai'),
('Priya', 'Singh', 'priya.singh@example.com', 'Recruiter', 'Human Resource', 45000.00, '2019-03-22','Bengluru'),
('Arjun', 'Verma', 'arjun.verma@example.com','Software Engineer', 'Tech', 55000.00, '2021-06-01','Bengluru'),
('Suman', 'Patel', 'suman.patel@example.com','Sales Executive', 'Finance', 60000.00, '2018-07-30','Mumbai'),
('Kavita', 'Rao', 'kavita.rao@example.com', 'Recruiter','Human Resource', 47000.00, '2020-11-10','Hyderabad'),
('Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing Analyst', 'Marketing', 52000.00, '2020-09-25','Pune'),
('Neha', 'Desai', 'neha.desai@example.com','Data Scientist', 'Tech', 48000.00, '2019-05-18','Pune'),
('Rahul', 'Kumar', 'rahul.kumar@example.com', 'Jr. Data Analyst', 'Tech', 53000.00, '2021-02-14','Mumbai'),
('Anjali', 'Mehta', 'anjali.mehta@example.com','Sales Executive', 'Finance', 61000.00, '2018-12-03','Hyderabad'),
('Vijay', 'Nair', 'vijay.nair@example.com','DevOps Engineer', 'Tech', 50000.00, '2020-04-19','Pune');



-- READ DATA USING SELECT --
SELECT * FROM Employees;

/*
1. WHERE | DISTINCT | ORDER BY | LIKE | TOP
2. Logical Operators
3. IN | NOT IN | BETWEEN
*/

SELECT * FROM Employees WHERE department = 'TECH';

SELECT DISTINCT DEPARTMENT FROM Employees;

SELECT * FROM Employees ORDER BY SALARY DESC;

SELECT * FROM Employees WHERE job_title LIKE '%Engineer%';

SELECT TOP 3 * FROM Employees ORDER BY salary DESC;

-- LOGICAL OPERATORS -- > < >= <= != <>
SELECT * FROM EMPLOYEES WHERE SALARY > 50000;

SELECT * FROM Employees WHERE salary < 50000

SELECT * FROM Employees WHERE salary >=50000;

SELECT * FROM Employees WHERE salary <= 50000;

SELECT * FROM Employees WHERE salary != 50000;

SELECT * FROM Employees WHERE salary <> 48000;

-- IN NOT IN BETWEEN --
SELECT * FROM Employees WHERE CITY IN ('PUNE','MUMBAI');

SELECT * FROM Employees WHERE department NOT IN ('TECH','FINANCE');

SELECT * FROM Employees WHERE salary BETWEEN 50000 AND 60000 ORDER BY salary DESC;

-- AND OR --
SELECT * FROM Employees WHERE salary = 50000 AND city = 'PUNE';

SELECT * FROM Employees WHERE salary = 60000 OR city = 'PUNE';

-- CASE --
-- 1.salary_band
SELECT fname, lname,salary,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium Earner'
	ELSE 'Low Earner' 
	END AS salary_band
FROM
	Employees
ORDER BY salary DESC;



/* Q.1 Calculate a bonus amount. Human Resource and Finance get a 10% bonus,
	Tech gets a 12% bonus, and everyone else gets a standard 5% bouns.
*/
SELECT fname, lname, department, salary,
CASE
	WHEN department IN ('Human Resource','Finance') THEN salary * 0.10
	WHEN department = 'Tech' THEN salary * 0.12
	ELSE salary * 0.05
	END AS bonus
FROM Employees;


-- not null --
SELECT * FROM Employees WHERE city IS NOT NULL;

-- NOT LIKE --
SELECT * FROM Employees WHERE fname NOT LIKE 'A%';

/*
Q.1 How to find total no. of employees?
Q.2 Employee with Max or Min salary
Q.3 Average Salary of employees
Q.4 Sum/total salary paid
*/

-- Aggrigate Functions --
SELECT DISTINCT COUNT(*) FROM Employees;

SELECT MAX(Salary) FROM Employees;

SELECT MIN(SALARY) FROM Employees;

SELECT AVG(SALARY) FROM Employees;

SELECT SUM(SALARY) FROM Employees;

-- SECTION 5.2 --

-- GROUP BY --

-- Q.1 No. of employees by department --
SELECT department, COUNT(EMP_ID) FROM Employees GROUP BY department;

/*
Q.1 Find number of employees in each department
Q.2 Find number of employees in each city
Q.3 Find average salary in each department
*/
SELECT department, COUNT(emp_id) FROM Employees GROUP BY department;

SELECT city, COUNT(emp_id) FROM Employees GROUP BY city;

SELECT department, AVG(salary) FROM Employees GROUP BY department;

-- MULTI COLUMN GROUPING --
SELECT department, city, COUNT(emp_id) FROM Employees
GROUP BY department, city
ORDER BY department;


-- HAVING CLAUSE --
/*
1. Find departments with more than 2 employees
2. Find job titles with an average salary above 40000
3. Find department with average salary above 50000
4. Find department with total salary above 90000
*/

SELECT department, COUNT(emp_id) FROM Employees
GROUP BY department
HAVING COUNT(emp_id)>1;


SELECT job_title, AVG(salary) FROM Employees
GROUP BY job_title
HAVING AVG(salary) > 40000;

SELECT department, AVG(salary) FROM Employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT department, SUM(salary) FROM Employees
GROUP BY department
HAVING SUM(salary) > 90000;


-- GROUP BY ROLLUP --
SELECT department, COUNT(emp_id) FROM Employees
GROUP BY ROLLUP(department);

SELECT department, SUM(salary) FROM Employees
GROUP BY ROLLUP (department);

/*
1. Employee headcount by city and department.
* You want a report showing the number of employees
for each city within each department, subtotal for
each department and grand total for entire company.
*/

-- COALESCE --
SELECT COALESCE( department,'Total'), COALESCE( city, 'Total'), COUNT(emp_id) FROM Employees
GROUP BY ROLLUP(department, city);


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

-- 4. Find employees who work in the same department as 'Priya Singh'.
SELECT * FROM Employees WHERE department =
(SELECT department FROM Employees WHERE fname = 'Priya' AND lname = 'Singh');

-- 5. Find employees working in cities where the 'Tech' department has a presence.
SELECT * FROM Employees WHERE city IN
(SELECT city FROM Employees WHERE department = 'Tech');

-- 6. Find employees whose job title matches any job title in the 'Finance' department.
SELECT * FROM Employees WHERE job_title IN
(SELECT JOB_TITLE FROM Employees WHERE department = 'FINANCE');


-- 7. Find employees who earn more than the average salary of their own specific department.
SELECT * FROM Employees e1 WHERE salary >
(SELECT AVG(SALARY) FROM Employees e2
 WHERE e2.department = e1.department);

-- 8. Find the employee(s) who earn the maximum salary in each department.
SELECT * FROM Employees e1 WHERE salary = 
(SELECT MAX(SALARY) FROM Employees e2
WHERE e2.department = e1.department);

-- 9. Find employees who were hired before the overall company average hire date.
SELECT * FROM Employees WHERE hire_date < 
(SELECT DATEADD(day, AVG(DATEDIFF(day, '2000-01-01', hire_date)), '2000-01-01')
FROM Employees);

-- 10. Find employees who work in a department that has more than 1 employee.
SELECT * FROM Employees WHERE department IN
(SELECT department FROM Employees GROUP BY department
HAVING COUNT(*) > 1)
ORDER BY department;



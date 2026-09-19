-- SECTION 5 --
-- AGGRIGATE FUNCTIONS --

USE bank_db;

SELECT * FROM Employees;

/*
Q.1 How to find total no. of employees?
Q.2 Employee with Max or Min salary
Q.3 Average Salary of employees
Q.4 Sum/total salary paid
*/

-- Aggrigate Functions --

-- COUNT --
SELECT COUNT(EMP_ID) FROM Employees;

-- MIN --
SELECT MIN (SALARY) FROM Employees;

-- MAX --
SELECT MAX (SALARY) FROM Employees;

-- AVG --
SELECT AVG(SALARY) FROM Employees;

-- SUM --
SELECT SUM (SALARY) FROM Employees;



-- SECTION 5.2 --

-- GROUP BY --

-- Q.1 No. of employees by department --
SELECT department, COUNT(EMP_ID) AS EMPCOUNT FROM Employees GROUP BY department;

/*
Q.1 Find number of employees in each department
Q.2 Find number of employees in each city
Q.3 Find average salary in each department
*/

SELECT DEPARTMENT, COUNT(EMP_ID) FROM Employees GROUP BY department;

SELECT CITY, COUNT(EMP_ID) AS total_employee FROM EMPLOYEES GROUP BY CITY;

SELECT DEPARTMENT, AVG(SALARY) Average_salary FROM Employees GROUP BY department;

SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM Employees GROUP BY department;

SELECT job_title, COUNT(emp_id) AS total_emp FROM Employees GROUP BY job_title;


-- MULTI COLUMN GROUPING --
SELECT department, city, COUNT(emp_id) total_emp
FROM Employees GROUP BY department, city
ORDER BY department;


-- HAVING CLAUSE --
/*
1. Find departments with more than 2 employees
2. Find job titles with an average salary above 40000
3. Find department with average salary above 50000
4. Find department with total salary above 90000
*/

SELECT department, COUNT(emp_id) AS emp
FROM Employees GROUP BY department
HAVING COUNT(emp_id) > 1;


SELECT job_title, AVG(salary) avg_salary 
FROM Employees GROUP BY job_title 
HAVING AVG(salary) > 40000;


SELECT department, AVG(salary) avg_salary 
FROM Employees GROUP BY department
HAVING AVG(salary) > 50000;


SELECT department, SUM(salary) total_salary
FROM Employees GROUP BY department
HAVING SUM(salary) > 100000;



-- GROUP BY ROLLUP --
SELECT department, COUNT(emp_id) FROM Employees
GROUP BY ROLLUP(department);

SELECT job_title, SUM(salary) FROM Employees
GROUP BY ROLLUP(job_title);

/*
1. Employee headcount by city and department.
* You want a report showing the number of employees
for each city within each department, subtotal for
each department and grand total for entire company.
*/

-- COALESCE

SELECT department, COALESCE( city,'Total'), COUNT(emp_id) 
FROM Employees GROUP BY ROLLUP(department, city);
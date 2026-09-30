SELECT NAME FROM SYS.DATABASES;

USE bank_db;
SELECT name FROM SYS.tables;

SELECT * FROM Employees;


-- Topic 1 SELECT 
SELECT COUNT(*) FROM Employees;

SELECT * FROM Employees;

select fname, lname from Employees;

select fname, lname, salary from Employees;

select email from Employees;

select fname as Employee_Name from Employees;

select salary as Monthly_Salary from Employees;

select fname, lname, job_title from Employees;

select * from Employees;

select fname, department from Employees;

-- Topic 2 DISTINCT
select distinct department from Employees;

select distinct city from Employees;

select distinct job_title from Employees;

select distinct department, city from Employees;

select count(distinct department) from Employees;

select count(distinct city) from Employees;

select  count(distinct job_title) from Employees;


-- Topic 3 WHERE
select * from Employees where department = 'tech';

select * from Employees where city = 'pune';

select * from Employees where salary > 50000;

select * from Employees where salary < 50000;

select * from Employees where salary = 50000;

select * from Employees where hire_date > '2020-01-01';

select * from Employees where hire_date < '2020-01-01';

select * from Employees where job_title = 'Recruiter';

select * from Employees where city = 'Mumbai';

select * from Employees where salary > 55000;

-- Topic 4 Comparison Operators 
select * from Employees where salary >=  50000;

select * from Employees where salary <= 50000;

select * from Employees where department <> 'Tech';

select * from Employees where hire_date >= '2020-01-01';

select * from Employees where hire_date <= '2020-01-01';

-- Topic 5 AND OR NOT
select * from Employees where department = 'Tech' and city = 'Pune';

select * from Employees where department = 'Tech' and salary > 50000;

select * from Employees where department = 'Tech' OR department = 'Human Resource';

select * from Employees where city NOT IN ('Pune');

select * from Employees where department NOT IN('Tech');

select * from Employees where city = 'Pune' AND salary > 48000;

select * from Employees where city IN('Pune','Hyderabad') and salary > 45000;

-- LEVEL 2 Filtering & Sorting
-- Topic 6 IN
select * from Employees where city IN('PUNE','MUMBAI','HYDERABAD');

select * from Employees where department IN('Tech','Finance');

select * from Employees where job_title IN('Recruiter','Sales Executive');

select * from Employees where city IN('Pune','Bengluru');

select * from Employees where department IN('Tech','Marketing','Finance');

-- Topic 7 BETWEEN
select * from Employees where salary BETWEEN 45000 AND 50000;

select * from Employees where salary BETWEEN 50000 and 60000;

select * from Employees where hire_date BETWEEN '2019-01-01' AND '2020-12-31';

select * from Employees where salary NOT BETWEEN 50000 and 60000;

select * from Employees where hire_date BETWEEN '2018-01-01' AND '2019-12-31';

-- Topic 8 LIKE
select * from Employees where fname LIKE 'A%';

select * from Employees where fname LIKE 'R%';

select * from Employees where lname LIKE 'S%';

select * from Employees where fname LIKE '%a';

select * from Employees where lname LIKE '%a%';

select * from Employees where email LIKE '%gmail%';

select * from Employees where job_title LIKE '%Engineer%';

select * from Employees where job_title LIKE '%data%';

select * from Employees where fname LIKE '____';

select * from Employees where lname LIKE '_____';

-- Topic 9 ORDER BY
select * from Employees order by salary;

select * from Employees ORDER BY SALARY DESC;

select * from Employees order by fname;

select * from Employees order by hire_date DESC;

select * from Employees order by hire_date;

select * from Employees order by department;

select * from Employees order by salary desc, fname asc;

select * from Employees order by city, salary desc;


-- Topic 10 LIMIT / TOP N
select top 1 * from Employees order by salary desc;

select top 2 * from Employees order by salary desc;

select top 3 * from Employees order by salary;

select top 5 * from Employees order by hire_date desc;

select top 3 * from Employees order by hire_date;


-- Level 3 Aggrigate Functions
--  Topic 11 COUNT
select count(*) from Employees;

select count(department) from employees where department = 'Tech'

select count(city) from Employees where city = 'Pune';

select count(department) from Employees where department = 'Human Resource';

select count(*) from Employees where salary > 50000;

select count(hire_date) from Employees where hire_date < '2020-01-01';

-- Topic 12: SUM, AVG, MIN, MAX

select sum(salary) from Employees;

select avg(salary) from Employees;

select max(salary) from Employees;

select min(salary) from Employees;

select max(salary) - min(salary) from Employees;


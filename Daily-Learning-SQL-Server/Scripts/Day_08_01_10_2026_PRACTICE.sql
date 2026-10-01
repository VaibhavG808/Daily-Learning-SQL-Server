SELECT name FROM SYS.DATABASES;
USE bank_db;
SELECT NAME FROM SYS.TABLES;
EXEC SP_HELP Employees;

-- CRUD OPERATION --
/*
1. CREATE TABLES
2. INSERT DATA
3. SELECT DATA
4. UPDATE DATA
5. DELETE DATA
6. WHERE | GROUP BY | HAVING
7. AGGRIGATION SUM | MAX | MIN | COUNT | AVG
8. LOGICAL OPERATORS < | > | <= | >= | <> | !=
9. AND | OR
10. IN | NOT | BETWEEN
11. CASE
12. SUB-QUERY CO-RELATED | INLINE 
13. STRING FUNCTIONS (CONCAT, CONCAT_WS, LEN, TRIM, SUBSTRING,LEFT, RIGHT, UPPER, LOWER, REPLACE, REVERSE, CHARINDEX)
14. DATE FUNCTION :
	DAY(GETDATE());
	(GETDATE());
	YEAR(hire_date) FROM Employees;
	MONTH(hire_date) FROM Employees;
	DAY(hire_date) FROM Employees;
	DATEDIFF(YEAR,hire_date,GETDATE()) FROM Employees;
	DATEADD(DAY,30,GETDATE());
	SELECT * FROM Employees WHERE hire_date >= '2020-01-01';
15. ALTERING TABLE
16. ADD / DROP
17. EXEC SP_RENAME TABLE | COLUMN | CONSTRAINT | 
15. CONSTRAINT UNIQUE | CHECK | NAMED CONSTRAINT
*/
-- CASE
SELECT *,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'MEDIUM EARNER'
	ELSE 'LOW EARNER'
	END AS SALARY_BAND
FROM 
	Employees
ORDER BY salary;

-- SUB-QUERY --
SELECT * FROM Employees WHERE salary >
(SELECT AVG(SALARY) FROM Employees);

SELECT * FROM Employees e1 where salary = (
SELECT max(SALARY) FROM Employees e2
WHERE e2.department = e1.department);

select * from employees where department =
(select department from Employees where city = 'Pune'
group by department
having count(*) > 1)

-- STRING FUNCTIONS (CONCAT, CONCAT_WS, LEN, TRIM, SUBSTRING,LEFT, RIGHT, UPPER, LOWER, REPLACE, REVERSE, CHARINDEX)
select concat('hi',' ','hello');
select CONCAT_WS(':','hi','hello','good')
select len('Hello')
select trim('   Hi ')
select SUBSTRING('hello',2,4)
select left('hello',2)
select RIGHT('hello',2)
select upper('hello')
select lower('HELLO')
select replace('hello','h','g')
select reverse('hello')
select charindex('o','hello')

/*DATE FUNCTION :
	DAY(GETDATE());
	(GETDATE());
	YEAR(hire_date) FROM Employees;
	MONTH(hire_date) FROM Employees;
	DAY(hire_date) FROM Employees;
	DATEDIFF(YEAR,hire_date,GETDATE()) FROM Employees;
	DATEADD(DAY,30,GETDATE());
	SELECT * FROM Employees WHERE hire_date >= '2020-01-01';
*/
select (getdate())
select year(getdate())
select month(getdate())
select day(getdate())
select datediff(YEAR,'2020-01-01',getdate())
select datediff(MONTH,'2020-01-01',getdate())
select datediff(DAY,'2020-01-01',getdate())
select dateadd(day, 10, getdate())

-- alter table-- add, drop
alter table employees
add phone varchar(15)

alter table employees
drop column phone

-- rename table , column
exec sp_rename 
'employees.fname','first_name','column'

exec sp_rename
'employees','staff'

-- chenge datatype of column
alter table employees
alter column fnmae varchar(500) not null

-- set default value of column
alter table employees
add constraint default_dept DEFAULT 'TRAINEE'
for department

-- unique
alter table employees
add unique('department')

-- check 
create table emp
(name varchar(20), salary decimal(10,2)
constraint chk_emp_postive_salary check(salary>0)
)

-- alter table check constraint
alter table employees
add constraint chk_emp_positive_salary check(salary>0)

-- drop constraint
alter table employees
drop constraint chk_emp_positive_salary

alter table employees
add constraint chk_verified_mail check(email like '%@%.%')


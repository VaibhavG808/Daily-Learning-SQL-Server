SELECT NAME FROM SYS.DATABASES;
USE bank_db;
SELECT NAME FROM SYS.TABLES;
SELECT * FROM Employees;

-- PRACTICE --

-- CASE --
-- SALARY BAND --

SELECT FNAME, LNAME, DEPARTMENT, SALARY,
CASE
	WHEN SALARY > 60000 THEN 'HIGH EARNING'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'MEDIUM EARNING'
	ELSE 'LOW EARNING'
	END AS SALARY_BAND
FROM
	Employees;

-- BONUS --
SELECT fname, LNAME, DEPARTMENT, SALARY,
CASE
	WHEN DEPARTMENT IN('HUMAN RESOURCE','FINANCE') THEN SALARY * 0.10
	WHEN DEPARTMENT = 'TECH' THEN SALARY * 0.12
	ELSE SALARY * 0.05
	END AS BONUS
FROM
	Employees;

-- SUB-QUERIES --
-- Find employees whose salary is greater than the average salary.
SELECT * FROM Employees WHERE salary >
(SELECT AVG(SALARY) FROM Employees);

-- Find employees whose salary is less than the average salary.
SELECT * FROM Employees WHERE salary <
(SELECT AVG(SALARY) FROM Employees);

-- Find employees who earn the same salary as the highest-paid employee in the IT department.
SELECT * FROM Employees WHERE salary = 
(SELECT MAX(SALARY) FROM Employees WHERE department = 'TECH');

UPDATE EMPLOYEES
SET
SALARY = 55000
WHERE emp_id = 114;


-- Find employees who belong to a department where at least 2 employees work.
SELECT * FROM Employees WHERE department IN
(SELECT DEPARTMENT FROM Employees
GROUP BY department
HAVING COUNT(*) >= 2);


-- STRING FUNCTION --
-- CONCAT, CONCAT_WS, LEN, TRIM, SUBSTRING, LEFT, RIGHT, UPPER, LOWER, REPLACE, REVERSE, CHARINDEX
SELECT CONCAT('HI',' ','HELLO');
SELECT CONCAT_WS(':','HI','HELLO','HOW ARE YOU');
SELECT LEN('HELLO');
SELECT TRIM('    HELLO  ')
SELECT SUBSTRING('HELLO',2,4)
SELECT LEFT('HELLO',3)
SELECT RIGHT('HELEO',3)
SELECT UPPER('heelo')
SELECT LOWER('HELLO')
SELECT REPLACE('HELLO','H','G')
SELECT REVERSE('HELLO')
SELECT CHARINDEX('O','HELLO',1)


-- DATE FUNCTION --
SELECT GETDATE()
SELECT YEAR(GETDATE())
SELECT MONTH(GETDATE())
SELECT DAY(GETDATE())
SELECT DATEDIFF(DAY,'2026-10-01',GETDATE())
SELECT DATEDIFF(MONTH,'2026-9-01',GETDATE())
SELECT DATEDIFF(YEAR,'2025-10-01',GETDATE())
SELECT DATEADD(DAY,10,GETDATE())

-- ALTER TABLE --
SELECT * FROM Employees

ALTER TABLE Employees
ADD phone_number VARCHAR(15);

ALTER TABLE Employees
ADD address varchar(100);

ALTER TABLE EMPLOYEES
ADD Bonus DECIMAL(10,2);

ALTER TABLE EMPLOYEES
DROP COLUMN phone_number

ALTER TABLE EMPLOYEES
DROP COLUMN address

ALTER TABLE EMPLOYEES
ALTER COLUMN BONUS VARCHAR(100);

EXEC SP_HELP EMPLOYEES;

SELECT * FROM Employees;

ALTER TABLE EMPLOYEES
ADD JOINING_YEAR INT

-- RENAME TABLE --
EXEC SP_RENAME 'EMPLOYEES.BONUS','BONEX','COLUMN';

SELECT * FROM Employees;

EXEC sp_rename 'EMPLOYEES.JOINING_YEAR','YEAR','COLUMN';

EXEC sp_rename 'Employees.city','location','column';

exec sp_rename 'employees.location','city','column';

exec sp_rename 'employees','clients';

exec sp_rename 'clients','Employees';

select * from Employees;

exec sp_help Employees;

alter table Employees
add constraint df_employees_city 
default 'unkown' for city;

alter table Employees
add constraint df_Employees_bonex 
default 0 for bonex;

alter table employees
drop constraint df_Employees_bonex

exec sp_help Employees;

alter table employees
drop constraint df_employees_city;

-- named constraint
create table example 
(id int,
name varchar(50) not null,
salary decimal(10,2)not null,

constraint Pk_example_id PRIMARY KEY (id),
constraint df_example_salary default 30000 for salary
);

-- check constraint --
alter table Employees
add constraint ck_employees_bonex check (bonex > 0); 

/*
If you want to force SQL Server to apply the constraint anyway—meaning 
it will ignore existing bad data but enforce the rule strictly for all 
new data moving forward—you can add the WITH NOCHECK option:

ALTER TABLE Employees WITH NOCHECK
ADD CONSTRAINT CK_Employees_Salary CHECK (salary > 0);
*/

ALTER TABLE Employees
DROP CONSTRAINT CK_Employees_Salary;


/*
What if you didn't name the constraint?
If the constraint was created without a specific name, 
SQL Server assigned it a random, system-generated name. 
You can find that exact name by running this search query:

SELECT name 
FROM sys.check_constraints 
WHERE parent_object_id = OBJECT_ID('Employees');
*/

SELECT name 
FROM sys.check_constraints 
WHERE parent_object_id = OBJECT_ID('Employees');

USE store_db;

select name from sys.tables;

SELECT c.Cust_name,c.email,o.total_amount, o.order_date FROM Customer c
CROSS JOIN Orders o

SELECT * FROM Customer c
LEFT JOIN Orders o
ON c.cust_id = o.cust_id

SELECT * FROM Orders;

SELECT  count(*) FROM Customer c
CROSS JOIN Orders o

SELECT 
    c1.cust_id AS Customer1_ID, 
    c1.cust_name AS Customer1_Name,
    c2.cust_id AS Customer2_ID, 
    c2.cust_name AS Customer2_Name
FROM Customer c1
CROSS JOIN Customer c2;



SELECT 
    c1.cust_name AS Customer1, 
    c2.cust_name AS Customer2
FROM Customer c1
INNER JOIN Customer c2 ON c1.cust_id < c2.cust_id; 
-- The '<' operator prevents duplicate combinations and pairing a customer with themselves
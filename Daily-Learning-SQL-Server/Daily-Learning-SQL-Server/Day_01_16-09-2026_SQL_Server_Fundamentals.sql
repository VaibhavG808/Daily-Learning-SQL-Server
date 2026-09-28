
----------------------------------------------
-- List down existing databases 
----------------------------------------------
SELECT name FROM sys.databases;
EXEC SP_DATABASES;

----------------------------------------------
-- Creating a Database
----------------------------------------------
CREATE DATABASE Sampledb;

----------------------------------------------
-- Chenge or using Database
----------------------------------------------
USE Sampledb;
SELECT DB_NAME();

----------------------------------------------
-- Deleting or Drop Databases
----------------------------------------------
DROP DATABASE Sampledb;

----------------------------------------------
-- CRUD Operations -- CREATE | READ | UPDATE | DELETE
----------------------------------------------
-- Creating Table
/* A table is a colletion of related data held in
a table format within a Database. */
CREATE TABLE Student ( 
Student_id INT, 
Name VARCHAR (100), 
Age INT, 
Grade INT
);

-- Checking exsting table
EXEC sp_help Student;

----------------------------------------------
-- Insert Data into Table
----------------------------------------------
INSERT INTO Student (Student_id, name, Age, Grade)
VALUES
(101, 'Raju',10, 5),
(102, 'Sam', 11,6),
(103, 'John', 12,7);

INSERT INTO Student (Student_id, name, Age, Grade)
VALUES
(104, 'Max',11, 6);


----------------------------------------------
-- READ DATA FROM TABLE
----------------------------------------------
SELECT * FROM Student;
SELECT Name FROM Student;

----------------------------------------------
-- UPDATE DATA FROM TABLE
----------------------------------------------
UPDATE Student
SET	Grade = 12
WHERE Student_id = 102;

----------------------------------------------
-- DELETE DATA FROM TABLE
----------------------------------------------
DELETE FROM Student
WHERE Student_id = 104;

SELECT * FROM Student;

----------------------------------------------
-- TRUNCATE QUERY
----------------------------------------------
TRUNCATE TABLE Student;

SELECT * FROM Student;

----------------------------------------------
-- Exercise for CRUD Operations
----------------------------------------------
-- Q1. Write a query to chenge grade of John from 7 to 8
SELECT * FROM Student;

UPDATE Student
SET Grade = 8
WHERE Student_id = 103;


-- Q2. Add a new student to the table
-- ID = 105, Name = 'Alex', Age = 12, Grade = 7.
SELECT * FROM Student;
INSERT INTO Student VALUES(
105, 'Alex', 12, 7
);


-- Q3. Write a query to remove 'John' from table
SELECT * FROM Student;
DELETE Student
WHERE Student_id = 103

-- Q4. Write a query to retrive only the details for the student name 'Alex'.
SELECT * FROM Student WHERE Name = 'Alex';


-- Q5. Write a query to print/get Age of 'Ram'.
SELECT Name, Age FROM Student WHERE Name = 'Sam';



----------------------------------------------
/* Data Types: An attribute taht defines that
kind of data a column in a database table can
hold, such as numbers, text, dates, or boolean 
values.
*/
----------------------------------------------
/* MOST WIDELY USED DATATYPES
1. Numeric - INT | BIGINT | DECIMAL(5,2) EX. 155.25, 28.15 | FLOAT | NUMBER
2. String - VARCHAR | NVARCHAR | CHAR
3. Date - DATE
4. Date Time - DATETIME
5. Boolean - BIT(0/1)
*/


----------------------------------------------
/* Constraint : A constraint is decide what type
of data is allowed in a column.
*/
----------------------------------------------
/*
1. PRIMARY KEY
2. NOT NULL
3. IDENTITY
4. DEFAULT
5. UNIQUE
*/

----------------------------------------------
-- Problems of the current table.
----------------------------------------------
SELECT * FROM Student;

INSERT INTO Student VALUES(
101, 'Alex', 12, 7
);

INSERT INTO Student(Student_id,Age,Grade) VALUES(106,10, 5);



----------------------------------------------
-- PRIMAR KEY
----------------------------------------------
/*
1. Primary key constraint uniquely identifies each record in a table.
2. Primary keys must contain UNIQUE values, and cannot contain NULL values.
3. A table can have only one primary key.
*/
CREATE TABLE Students (
	Student_id INT PRIMARY KEY,
	fname VARCHAR(100) NOT NULL,
	lname VARCHAR(100) NOT NULL
);

CREATE TABLE Students1 (
	StudentID INT NOT NULL,
	Fname VARCHAR(100) NOT NULL,
	Lname VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Students1 PRIMARY KEY (StudentID)
);


----------------------------------------------
/* If you need to use two or more columns to
uniquely identify a record use this method.
*/
----------------------------------------------
CREATE TABLE OrderDetails (
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT,
	CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderID, ProductID)
);

----------------------------------------------
-- UNIQUE CONSTRAINT
----------------------------------------------
/*
1. A UNIQUE Constraint makes sure that no two rows
in a table have the same value in the column.
2. It helps to prevent duplicate data, like the 
same email or phone number being used twice.
3. However NULL is allowed - but only once 
(because NULL is treated as "Unknown", and SQL 
allows one unknown value in a unique column).
*/


----------------------------------------------
-- NOT NULL
----------------------------------------------
CREATE TABLE Customers
(
	id INT NOT NULL,
	name VARCHAR(100) NOT NULL
);


----------------------------------------------
-- DEFAULT 
----------------------------------------------
CREATE TABLE Account
( 
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email NVARCHAR(100) NOT NULL,
	created_at DATETIME DEFAULT GETDATE()
);


----------------------------------------------
-- IDENTITY
----------------------------------------------
/* 
1. It is used to automatically generate unique numbers 
for a column when new rows are inserted into a table.
2. It works like auto-increament, usually for primary key
columns.
*/
CREATE TABLE Accounts
( 
	id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email NVARCHAR(100) NOT NULL,
	created_at DATETIME DEFAULT GETDATE()
);


----------------------------------------------
-- Task : Create a Employee table using all the constraints.
----------------------------------------------
/* Requirements:
1. emp_id set as primary key and its value should be auto-increament by 1 starting from 101.
2. Email should be unique.
3. NULL value should not be allowed in 
	fname, lname, email, job_title
4. Salary Column - default set to 30,000 if not provided
5. Hire_date - default set to today's date
*/

-- Creating new database for employees table 

CREATE DATABASE bank_db;

USE bank_db;


CREATE TABLE Employees
(
	emp_id INT IDENTITY(101,1) PRIMARY KEY NOT NULL,
	fname VARCHAR(100) NOT NULL,
	lname VARCHAR(100) NOT NULL,
	email NVARCHAR(100) NOT NULL UNIQUE,
	job_title VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2) DEFAULT 30000.00,
	hire_date DATE NOT NULL DEFAULT CONVERT(date, GETDATE()),
	city VARCHAR(50)
);

SELECT * FROM Employees;

exec sp_help Employees;

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




----------------------------------------------
-- SELECTING DATA YOU NEED.
----------------------------------------------
/*
1. WHERE | DISTINCT | ORDER BY | LIKE | TOP
2. Logical Operators
3. IN | NOT IN | BETWEEN
*/

----------------------------------------------
-- CLAUSES
----------------------------------------------
/*
A SQL Caluse is a part of a SQL statement that 
defines specific actions or conditions for 
querying, filtering or organizing data in a 
database.
*/


----------------------------------------------
-- WHERE 
----------------------------------------------

-- 1. Find Employees in the IT department.
SELECT * FROM Employees WHERE department = 'Tech';
SELECT * FROM Employees WHERE department = 'Finance';

-- 2. Find employees with salary above 50,000.
SELECT * FROM Employees WHERE salary > 50000;
SELECT * FROM Employees WHERE salary < 50000;

-- 3. Find employees hired after 2020.
SELECT * FROM Employees WHERE hire_date > '2020-12-31';
SELECT * FROM Employees WHERE hire_date < '2020-12-31';

-- 4. Find employees whos department is not HR.
SELECT * FROM Employees WHERE department != 'Human Resource';
SELECT * FROM Employees WHERE department != 'Tech';



----------------------------------------------
-- DISTINCT 
----------------------------------------------
SELECT DISTINCT department FROM Employees;
SELECT DISTINCT job_title FROM Employees;
SELECT DISTINCT city FROM Employees;

----------------------------------------------
-- ORDER BY 
----------------------------------------------
SELECT * FROM Employees ORDER BY salary;
SELECT * FROM Employees ORDER BY salary DESC;
SELECT * FROM Employees ORDER BY hire_date;
SELECT * FROM Employees ORDER BY fname;
SELECT * FROM Employees ORDER BY fname DESC;
SELECT department, fname FROM Employees ORDER BY department, fname;


----------------------------------------------
-- LIKE (Wildcard)
----------------------------------------------
SELECT * FROM Employees WHERE department LIKE '%Human%';
SELECT * FROM Employees WHERE department LIKE '%man%';
SELECT * FROM Employees WHERE department LIKE '%Te%';
SELECT * FROM Employees WHERE fname LIKE '[ABCDEFGHIJKL]%';
SELECT * FROM Employees WHERE fname LIKE '%A';
SELECT * FROM Employees WHERE email LIKE '%rao%';
SELECT * FROM Employees WHERE fname LIKE '[^A]%';
SELECT * FROM Employees WHERE fname LIKE '_A%';
SELECT * FROM Employees WHERE fname LIKE '____';


----------------------------------------------
-- TOP
----------------------------------------------
SELECT TOP 3 * FROM Employees;
SELECT TOP 3 * FROM Employees ORDER BY salary DESC;
SELECT TOP 3 * FROM Employees ORDER BY salary;
SELECT TOP 2 * FROM Employees ORDER BY hire_date DESC;


----------------------------------------------
-- Exercise 1
----------------------------------------------
-- Q.1 Find Different type of departments in table
SELECT DISTINCT department FROM Employees;

-- Q.2 Display records with high-low salary
SELECT * FROM Employees ORDER BY salary DESC;

-- Q.3 How to see only top 3 records from the table
SELECT TOP 3 * FROM Employees;

-- Q.4 Show records where first name starts with letter 'A'
SELECT * FROM Employees WHERE fname LIKE 'A%';

-- Q.5 Show the records where length of the first name is 4 character
SELECT * FROM Employees WHERE fname LIKE '____';


----------------------------------------------
-- Logical Operators ( AND , OR )
----------------------------------------------
SELECT * FROM Employees WHERE salary > 50000 AND department = 'Finance';
SELECT * FROM Employees WHERE salary > 50000 AND department = 'Tech';
SELECT * FROM Employees WHERE salary > 50000 OR department = 'Finance';
SELECT * FROM Employees WHERE salary > 50000 AND department = 'Finance' OR city = 'Mumbai';



----------------------------------------------
-- IN | NOT IN | BETWEEN
----------------------------------------------
SELECT * FROM Employees WHERE department IN ('Tech', 'Finance')
SELECT * FROM Employees WHERE salary BETWEEN 50000 AND 55000;
SELECT * FROM Employees WHERE department NOT IN ('Tech', 'Finance')



----------------------------------------------
-- CASE
----------------------------------------------
SELECT 
	fname,
	lname,
	salary,
	CASE
		WHEN salary > 60000 THEN 'High Earner'
		WHEN salary >=50000 AND salary <= 60000 THEN 'Medium Earner'
		ELSE 'Low Earner'
	END AS salary_band
FROM
	Employees;



SELECT fname, lname, salary,
CASE
	WHEN salary > 60000 THEN 'High Earner'
	WHEN salary BETWEEN 50000 AND 60000 THEN 'Medium Earner'
	ELSE 'Low Earner'
	END AS Salary_category
FROM
	Employees;


/* Q.1 Calculate a bonus amount. Human Resource and Finance get a 10% bonus,
	Tech gets a 12% bonus, and everyone else gets a standard 5% bouns.
*/
SELECT fname, lname, department, salary,
CASE
	WHEN department IN ('Human Resource','Finance') THEN salary*0.10
	WHEN department = 'Tech' THEN salary*0.12
	ELSE salary*0.05
	END AS bonus
FROM
	Employees;


----------------------------------------------
-- NOT NULL
----------------------------------------------
SELECT * FROM Employees 
WHERE fname IS NULL;


----------------------------------------------
-- NOT LIKE
----------------------------------------------
SELECT * FROM Employees WHERE fname NOT LIKE 'A%';
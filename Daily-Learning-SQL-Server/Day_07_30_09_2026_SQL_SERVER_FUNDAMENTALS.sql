-- SECTION 7 --
---- ALTERING TABLE ----
SELECT * FROM Employees;

ALTER TABLE Employees
ADD Phone NVARCHAR(15);

ALTER TABLE Employees
DROP COLUMN Phone;

-- How to chenge datatype of a column?
-- ex. VARCHAR limit
ALTER TABLE Employees
ALTER COLUMN fname VARCHAR(200) NOT NULL;

EXEC SP_HELP Employees;

ALTER TABLE EMPLOYEES
ALTER COLUMN lname VARCHAR(200) NOT NULL;

ALTER TABLE EMPLOYEES
ALTER COLUMN department VARCHAR(50) NOT NULL;

EXEC SP_RENAME
'Employees.fname','first_name','COLUMN'

SELECT * FROM Employees;

EXEC SP_RENAME
'Employees.first_name','fname','COLUMN'

-- Chenging Table Name --
EXEC SP_RENAME
'Employees','Staff'

SELECT * FROM Staff;

EXEC SP_RENAME
'Staff','Employees'

-- ADD / DROP -- 

-- How to set a default value to a column?
ALTER TABLE Employees
ADD CONSTRAINT default_dept DEFAULT 'Trainee'
FOR department;

EXEC SP_HELP Employees;

INSERT INTO Employees
(fname,lname,email,job_title,city) VALUES
('Paul','Sims','paulsims@example.com','Fresher','Mumbai');

SELECT * FROM Employees;

-- UNIQUE CONSTRAINT --
ALTER TABLE Employees
ADD UNIQUE ('Column');

-- CHECK CONSTRAINT --
-- We want to make sure salary of an Employee is Positive...
INSERT INTO Employees
(fname,lname,email,job_title, salary, city) VALUES
('John','Smith','johnsmith@example.com','Finance',-30000,'Mumbai');

-- Add Check Constraint when creating a table

CREATE TABLE  emp(name varchar(50),
salary DECIMAL(10,2) CHECK(salary>0)
);

-- NAMED CONSTRAINT --
CREATE TABLE emp2
(name varchar(50),
salary DECIMAL(10,2)
CONSTRAINT chk_emp_positive_salary CHECK(salary>0)
);


-- USING ALTER TABLE CHECK CONSTRAINT --
ALTER TABLE EMPLOYEES
ADD CONSTRAINT chk_emp_salary_positive CHECK(salary>0);

SELECT * FROM Employees;

DELETE FROM Employees
WHERE emp_id = 112;


-- DROP CONSTRAINT -- 
ALTER TABLE Employees
DROP CONSTRAINT chk_emp_salary_positive


ALTER TABLE EMPLOYEES
ADD CONSTRAINT chk_valid_email CHECK(email LIKE '%@%.%');

INSERT INTO Employees
(fname,lname,email,job_title, salary, city) VALUES
('John','Smith','johnsmith@example_com','Finance',-30000,'Mumbai');

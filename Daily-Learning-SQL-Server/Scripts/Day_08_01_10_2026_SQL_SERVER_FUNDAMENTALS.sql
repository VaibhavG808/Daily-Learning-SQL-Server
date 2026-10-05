
-- SECTION 8 --
-- RELATIONSHIP --
/* A database relationship is a connection between two or more tables,
established using primary key and a foreign key.
*/

/* Problems with the current table
1. Data Redundancy (duplication)
2. What if I want to add finance department & its related details
3. what if amit leaves the company which was only one in the marketing department
4. what if there is typo in a department column.
*/

-- what is foreign key --
/* A foreign key is the column in one table that links to the
primary key of another table.
*/

-- Types of Relationships --
/*
1. one to one
2. one to many
3. many to many
*/


-- practical 1:many
/*  Suppose we need to store the following data.
1. customer name
2. customer email
3. order date
4. order price
*/
-- 1. customer table
-- 2. order table
CREATE DATABASE store_db;
USE store_db;

CREATE TABLE Customer 
(cust_id INT IDENTITY(101,1) PRIMARY KEY NOT NULL,
Cust_name VARCHAR(100) NOT NULL, 
email NVARCHAR(30) UNIQUE NOT NULL CHECK(email LIKE '%@%.%'));


CREATE TABLE Orders
(order_id INT IDENTITY(500,1) PRIMARY KEY NOT NULL,
order_date DATE NOT NULL DEFAULT (CAST(GETDATE() AS DATE)),
total_amount DECIMAL(10,2),
cust_id INT,
FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

INSERT INTO Customer (Cust_name, email)
VALUES
('Rahul Sharma', 'rahul@gmail.com'),
('Priya Patil', 'priya@gmail.com'),
('Amit Joshi', 'amit@gmail.com'),
('Sneha Kulkarni', 'sneha@gmail.com'),
('Rohit Verma', 'rohit@gmail.com');




INSERT INTO Orders (order_date, total_amount, cust_id)
VALUES
('2024-01-05', 1200.00, 101),
('2024-01-08', 2500.00, 102),
('2024-01-10', 800.00, 103),
('2024-01-15', 1500.00, 101),
('2024-01-18', 3000.00, 104),

('2024-01-20', 900.00, 105),
('2024-01-25', 1800.00, 102),
('2024-02-02', 2200.00, 103),
('2024-02-05', 500.00, 101),
('2024-02-10', 1200.00, 104),

('2024-02-14', 3500.00, 105),
('2024-02-18', 700.00, 102),
('2024-02-20', 1600.00, 103),
('2024-02-25', 2800.00, 101),
('2024-03-01', 900.00, 104),

('2024-03-05', 2100.00, 105),
('2024-03-10', 1300.00, 102),
('2024-03-15', 4000.00, 103),
('2024-03-20', 1100.00, 101),
('2024-03-25', 2500.00, 104);


SELECT * FROM Customer;
SELECT * FROM Orders;

INSERT INTO Customer (Cust_name,email) values('Paul Shin','paul@gmail.com');
INSERT INTO Orders (total_amount) values(2000)


-- CASCADE ON DELETE --
-- USE ON DELETE CASCADE IN CONSTRAINT SEPERATE WHEN YOU CREATE TABLE
CREATE TABLE Orders(ord_id int primary key identity(1,1)
date DATE,
amount DECIMAL(5,2),
cust_id INT,
FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
ON DELETE CASCADE
);


-- WHAT ARE JOINS --
/* Joins are used to combine rows from two or more 
tables based on related column between them.
*/
-- TYPES OF JOIN --
/*
1. CROSS JOIN
2. INNER JOIN
3. LEFT JOIN
4. RIGHT JOIN
5. FULL JOIN
*/

/* Cross Join
Every row from one table is combined with every row from another table.
*/
SELECT * FROM Customer
CROSS JOIN Orders

/* Inner Join
Returns only the rows where there is a match between the specified columns
in both the left(or first) and right(or second) table.
*/

SELECT * FROM Customer AS C1
INNER JOIN Orders AS O1
ON C1.cust_id = O1.cust_id;


SELECT C1.Cust_name, COUNT(O1.order_id) AS Total_orders, SUM(O1.total_amount) total_purchase FROM Customer C1
INNER JOIN Orders O1
ON C1.cust_id = O1.cust_id
GROUP BY C1.Cust_name

/* Left Join
Returns all rows from the left(or first table) and
matching rows from the right(or second table).
*/

SELECT * FROM Customer AS C1
LEFT JOIN Orders AS O1
ON C1.cust_id = O1.cust_id;

SELECT C1.Cust_name,COUNT(O1.order_id), SUM(O1.total_amount) FROM Customer AS C1
LEFT JOIN Orders AS O1
ON C1.cust_id = O1.cust_id
GROUP BY C1.Cust_name


/* Right Join
Returns all rows from the right(or second) table 
and matching rows from the left(or first) table.
*/

SELECT * FROM Customer AS C1
RIGHT JOIN Orders AS O1
ON C1.cust_id = O1.cust_id
ORDER BY C1.cust_id;

SELECT C1.Cust_name,COUNT(O1.order_id), SUM(O1.total_amount) FROM Customer AS C1
RIGHT JOIN Orders AS O1
ON C1.cust_id = O1.cust_id
GROUP BY C1.Cust_name


/* FULL OUTER JOIN
Returns all the rows when there is a match
either the left or right table.
*/

SELECT * FROM Customer AS C1
FULL OUTER JOIN Orders AS O1
ON C1.cust_id = O1.cust_id
ORDER BY C1.cust_id;


/* OUTER APPLY
OUTER APPLY is used to join each row from one table (the left table)
to the result of a table-valued function or subquery (the right side).
*/

/* Usecase of OUTER APPLY
For each customer show their most recent order (if they have one).
If they have no orders, still show the customers.
*/

SELECT c.cust_id, c.Cust_name,
o.Order_id, o.order_date, o.total_amount
FROM Customer c

OUTER APPLY(
SELECT TOP 1 * 
FROM Orders o 
where c.cust_id = o.cust_id
ORDER BY o.order_date desc
) as o;

/* CROSS APPLY
CROSS APPLY is used to join each row from left table
to the result of table-valued function or subquery to the right table.

It behaves like an INNER JOIN, it only returns rows where
the right side sub-query produces the result
*/

SELECT c.cust_id, c.Cust_name,
o.Order_id, o.order_date, o.total_amount
FROM Customer c

CROSS APPLY(
SELECT TOP 1 * 
FROM Orders o 
where c.cust_id = o.cust_id
ORDER BY o.order_date desc
) as o;


-- UNION & EXCEPT --

/* UNION:
UNION is used to combine a results of 
two or more SELECT statement into a single 
result set.

{combines data vertically (adds rows, same structure)}

REQUIREMENTS:
1. Each SELECT must	have same number of columns.
2. Corresponding columns must have compatible data types.
3. Coulmn names are taken from the first SELECT.

---- UNION VS UNION ALL ---

-- UNION must remove the duplicate values from the result.
*/




/* EXCEPT:
EXCEPT returns rows from the first query 
that do not exist in the second query.
*/



/* SELF JOIN : 
SELF JOIN is a standard sql join where a table is joined to itself.

It's used when rows in a table are related to other rows in the same table.
*/

use bank_db;

CREATE TABLE CompanyHierarchy(
EmployeeID INT PRIMARY KEY,
Name VARCHAR(100),
ManagerID INT
);


INSERT INTO CompanyHierarchy (EmployeeID,Name,ManagerID)
VALUES
(1,'Sonia Verma',NULL),
(2,'Rohan Gupta',1),
(3,'Amit Sharma',2),
(4,'Priya Singh',1),
(5,'Kabir Shah',2);

SELECT * FROM CompanyHierarchy;

SELECT 
e.Name as employee_name,
m.Name as manager_name
FROM CompanyHierarchy e
LEFT JOIN CompanyHierarchy m
ON e.ManagerID=m.EmployeeID

-- MANY TO MANY --
-- Students table | Courses Table | junction table(enrollment)
CREATE DATABASE Institute;
USE Institute;


CREATE TABLE courses ( 
  course_id INT IDENTITY(1,1) PRIMARY KEY, 
  course_name VARCHAR(100) NOT NULL, 
  course_fee NUMERIC(10, 2) NOT NULL 
);


INSERT INTO courses (course_name, course_fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);


CREATE TABLE students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);


INSERT INTO Students (student_name) VALUES
('Raju'),
('Sham'),
('Baburao'),
('Alex');


CREATE TABLE enrollment (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
 
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO enrollment (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2025-01-15'), -- Raju enrolled in Physics
(2, 1, '2025-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2025-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2025-03-25'); -- Alex enrolled in Chemistry

SELECT * FROM courses;
SELECT * FROM students;
SELECT * FROM enrollment;

SELECT s.student_name,c.course_name,e.enrollment_date,c.course_fee FROM enrollment e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id


SELECT c.course_name, COUNT(s.student_id) total_students, SUM(c.course_fee) total_fees
FROM enrollment e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;



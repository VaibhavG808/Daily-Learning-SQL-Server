**Absolutely — if this is a \*\*day-by-day SQL learning tracker\*\*, I’d keep it minimal: clear sections, topic progression, and exercises only. No explanations or SQL code.**



&#x20;**SQL Daily Learning Topics \& Exercises**



**# SQL — Daily Learning Topics \& Exercises**



&#x20;**A structured day-by-day learning plan covering SQL fundamentals, data manipulation, filtering, aggregation, string functions, and date functions.**



**---**



&#x20;**## Day 01 — Database Fundamentals**



&#x20;**### Topics**



&#x20;**- Databases**

**- Listing Databases**

**- Creating a Database**

**- Selecting / Using a Database**

**- Dropping a Database**



**---**



&#x20;**## Day 02 — CRUD Operations**



&#x20;**### Topics**



&#x20;**- CRUD Overview**

**- Creating Tables**

**- Viewing Existing Tables**

**- Inserting Data**

**- Reading Data**

**- Updating Data**

**- Deleting Data**

**- TRUNCATE**



&#x20;**### Exercises**



&#x20;**- Change John's grade from 7 to 8.**

**- Add a new student:**

&#x20; **- ID: 105**

&#x20; **- Name: Alex**

&#x20; **- Age: 12**

&#x20; **- Grade: 7**

**- Remove John from the table.**

**- Retrieve the details of Alex.**

**- Retrieve the age of Ram.**



**---**



&#x20;**## Day 03 — Data Types**



&#x20;**### Topics**



&#x20;**- Introduction to Data Types**

**- Numeric Data Types**

&#x20; **- INT**

&#x20; **- BIGINT**

&#x20; **- DECIMAL**

&#x20; **- FLOAT**

**- String Data Types**

&#x20; **- VARCHAR**

&#x20; **- NVARCHAR**

&#x20; **- CHAR**

**- Date Data Types**

&#x20; **- DATE**

&#x20; **- DATETIME**

**- Boolean Data Type**

&#x20; **- BIT**



**---**



&#x20;**## Day 04 — Constraints**



&#x20;**### Topics**



&#x20;**- Introduction to Constraints**

**- PRIMARY KEY**

**- Composite PRIMARY KEY**

**- UNIQUE**

**- NOT NULL**

**- DEFAULT**

**- IDENTITY**



&#x20;**### Exercises**



&#x20;**- Identify problems with an existing table design.**

**- Create an Employee table using multiple constraints.**

**- Configure an auto-incrementing Employee ID starting from 101.**

**- Make Email unique.**

**- Prevent NULL values in required columns.**

**- Set a default salary.**

**- Set the default hire date to the current date.**

**- Insert employee records using the defined constraints.**



**---**



&#x20;**## Day 05 — SELECT \& Data Filtering**



&#x20;**### Topics**



&#x20;**- SELECT**

**- WHERE**

**- DISTINCT**

**- ORDER BY**

**- LIKE**

**- TOP**

**- Wildcards**



&#x20;**### Exercises**



&#x20;**- Find employees in the IT department.**

**- Find employees with salary above 50,000.**

**- Find employees hired after 2020.**

**- Find employees who are not in HR.**

**- Find different departments.**

**- Display employees ordered by salary from highest to lowest.**

**- Display the top 3 records.**

**- Find employees whose first name starts with `A`.**

**- Find employees whose first name contains exactly 4 characters.**



**---**



&#x20;**## Day 06 — Operators \& Conditional Logic**



&#x20;**### Topics**



&#x20;**- Logical Operators**

&#x20; **- AND**

&#x20; **- OR**

**- IN**

**- NOT IN**

**- BETWEEN**

**- NOT LIKE**

**- CASE Expressions**



&#x20;**### Exercises**



&#x20;**- Filter employees using multiple conditions.**

**- Find employees belonging to selected departments.**

**- Find employees outside selected departments.**

**- Find employees within a specific salary range.**

**- Find names that do not match a specific pattern.**

**- Calculate employee bonuses based on department:**

&#x20; **- HR \& Finance → 10%**

&#x20; **- IT → 12%**

&#x20; **- Others → 5%**



**---**



&#x20;**## Day 07 — Aggregate Functions**



&#x20;**### Topics**



&#x20;**- Aggregate Functions**

**- COUNT**

**- MIN**

**- MAX**

**- AVG**

**- SUM**



&#x20;**### Exercises**



&#x20;**- Find the total number of employees.**

**- Find the employee with the maximum salary.**

**- Find the employee with the minimum salary.**

**- Calculate the average salary.**

**- Calculate the total salary paid.**



**---**



&#x20;**## Day 08 — GROUP BY \& HAVING**



&#x20;**### Topics**



&#x20;**- GROUP BY**

**- Multiple-Column GROUP BY**

**- HAVING**

**- Aggregate Functions with GROUP BY**



&#x20;**### Exercises**



&#x20;**- Find the number of employees in each department.**

**- Find the number of employees in each city.**

**- Find the average salary in each department.**

**- Find the total salary by department.**

**- Find departments with more than 2 employees.**

**- Find job titles with an average salary above 40,000.**

**- Find departments with an average salary above 50,000.**

**- Find departments with total salary above 90,000.**



**---**



&#x20;**## Day 09 — GROUP BY ROLLUP \& NULL Handling**



&#x20;**### Topics**



&#x20;**- GROUP BY ROLLUP**

**- Subtotals**

**- Grand Totals**

**- NULL Values**

**- IS NULL**

**- IS NOT NULL**

**- COALESCE**



&#x20;**### Exercises**



&#x20;**- Generate employee headcount by city and department.**

**- Display department-level subtotals.**

**- Display the overall employee count.**

**- Identify records containing NULL values.**

**- Replace NULL department values with a meaningful label.**



**---**



&#x20;**## Day 10 — Subqueries \& Derived Tables**



&#x20;**### Topics**



&#x20;**- Subqueries**

**- Nested Queries**

**- Derived Tables**

**- Inline Views**

**- Aggregate Subqueries**



&#x20;**### Exercises**



&#x20;**- Find departments with an average salary above 50,000.**

**- Find departments where the maximum salary is above 55,000.**

**- Find departments where total salary is above 80,000.**

**- Find departments where minimum salary is below 50,000.**



**---**



&#x20;## Day 11 — String Functions



&#x20;### Topics



&#x20;**- CONCAT**

**- CONCAT\\\_WS**

**- SUBSTRING**

**- LEFT**

**- RIGHT**

**- LEN**

**- UPPER**

**- LOWER**

**- TRIM**

**- LTRIM**

**- RTRIM**

**- REPLACE**

**- REVERSE**

**- CHARINDEX**



&#x20;**### Exercises**



&#x20;**- Create employee full names.**

**- Extract a portion of an employee's name.**

**- Extract the first character of a department.**

**- Extract the last characters of a name.**

**- Find the length of employee names.**

**- Convert names to uppercase and lowercase.**

**- Remove unwanted spaces.**

**- Replace specific text within a column.**

**- Reverse employee names.**

**- Find the position of a specific character.**

**- Create a formatted employee summary.**



**---**



&#x20;## Day 12 — Date \& Time Functions



&#x20;### Topics



&#x20;- GETDATE

\- SYSDATETIME

\- DATE

\- DATETIME

\- CAST

\- CONVERT

\- YEAR

\- MONTH

\- DAY

\- DATEPART

\- DATENAME

\- DATEDIFF

\- DATEADD



&#x20;**### Exercises**



&#x20;**- Retrieve the current date.**

**- Retrieve the current date and time.**

**- Extract the year from a hire date.**

**- Extract the month from a hire date.**

**- Extract the day from a hire date.**

**- Calculate employee tenure.**

**- Find employees hired after a specific year.**

**- Calculate future dates using DATEADD.**



**---**



&#x20;## SQL Learning Progression



```

Database Fundamentals

&#x20;       ↓

CRUD Operations

&#x20;       ↓

Data Types

&#x20;       ↓

Constraints

&#x20;       ↓

SELECT \& Filtering

&#x20;       ↓

Operators \& CASE

&#x20;       ↓

Aggregate Functions

&#x20;       ↓

GROUP BY \& HAVING

&#x20;       ↓

ROLLUP \& NULL Handling

&#x20;       ↓

Subqueries \& Derived Tables

&#x20;       ↓

String Functions

&#x20;       ↓

Date \& Time Functions

```



&#x20;### Next Topics



&#x20;- JOINs

\- INNER JOIN

\- LEFT JOIN

\- RIGHT JOIN

\- FULL OUTER JOIN

\- Self JOIN

\- Common Table Expressions (CTEs)

\- Window Functions

\- Views

\- Stored Procedures

\- Transactions

\- Indexes

\- Query Optimization

\- Database Normalization



&#x20;This keeps your original material intact in terms of \*\*topics and exercises\*\*, but presents it as a clean progression you can continue adding to day by day.


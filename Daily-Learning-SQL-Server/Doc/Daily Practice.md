**Absolutely. I’ll turn \*\*every topic you listed into simple daily SQL practice\*\*.**



&#x20;**I’ll keep the questions beginner-friendly and practical, with \*\*10 questions per topic\*\*. You can solve them yourself first, then send me your answers and I’ll check them.**



&#x20;**## Day 1 — CASE Statements**



&#x20;**Assume table:**



&#x20;**`Employees(emp\_id, fname, salary, department, city, hire\_date, email)`**



&#x20;**1. Display all employees and create a column `SALARY\_BAND`.**

&#x20;  **- Salary \\> 60000 → `'High'`**

&#x20;  **- Salary 50000–60000 → `'Medium'`**

&#x20;  **- Otherwise → `'Low'`**

**2. Display `fname`, `salary`, and classify employees:**

&#x20;  **- Salary \\>= 70000 → `'Excellent'`**

&#x20;  **- Salary \\>= 50000 → `'Good'`**

&#x20;  **- Otherwise → `'Needs Improvement'`**

**3. Create a column `CITY\_TYPE`.**

&#x20;  **- Pune → `'Pune Employee'`**

&#x20;  **- Mumbai → `'Mumbai Employee'`**

&#x20;  **- Otherwise → `'Other City'`**

**4. Create a column `SALARY\_LEVEL`.**

&#x20;  **- Salary \\< 40000 → `'Entry'`**

&#x20;  **- 40000–60000 → `'Mid'`**

&#x20;  **- > 60000 → `'Senior'`**

**5. Display employees and classify their departments:**

&#x20;  **- IT → `'Technology'`**

&#x20;  **- HR → `'Human Resources'`**

&#x20;  **- Sales → `'Business'`**

&#x20;  **- Otherwise → `'Other'`**

**6. Create an `AGE\_GROUP` column using an `age` column:**

&#x20;  **- \\< 25 → `'Young'`**

&#x20;  **- 25–40 → `'Adult'`**

&#x20;  **- > 40 → `'Senior'`**

**7. Create a column `BONUS`.**

&#x20;  **- Salary \\> 70000 → 10000**

&#x20;  **- Salary 50000–70000 → 5000**

&#x20;  **- Otherwise → 2000**

**8. Display `fname`, `salary`, and a column showing:**

&#x20;  **- Salary \\>= 60000 → `'Eligible'`**

&#x20;  **- Otherwise → `'Not Eligible'`**

**9. Sort employees by salary and display a salary category using `CASE`.**

**10. Create a `PERFORMANCE` column based on salary:**



&#x20;**- > = 80000 → `'A'`**

**- > = 60000 → `'B'`**

**- > = 40000 → `'C'`**

**- Otherwise → `'D'`**



**---**



&#x20;**# Day 2 — Subqueries**



&#x20;**1. Find employees whose salary is \*\*greater than the average salary\*\*.**

**2. Find employees whose salary is \*\*less than the average salary\*\*.**

**3. Find the employee(s) having the \*\*maximum salary\*\*.**

**4. Find the employee(s) having the \*\*minimum salary\*\*.**

**5. Find employees who earn the \*\*same salary as the highest-paid employee in the IT department\*\*.**

**6. Find employees who work in the \*\*same department as the employee named 'Rahul'\*\*.**

**7. Find employees who live in the \*\*same city as the employee named 'Amit'\*\*.**

**8. Find employees whose salary is greater than the salary of the employee named `'Priya'`.**

**9. Find the employee(s) having the \*\*maximum salary in each department\*\*.**

**10. Find employees who belong to a department where \*\*at least 2 employees work\*\*.**



**---**



&#x20;**# Day 3 — String Functions**



&#x20;**Practice these functions:**



&#x20;**`CONCAT, CONCAT\_WS, LEN, TRIM, SUBSTRING, LEFT, RIGHT, UPPER, LOWER, REPLACE, REVERSE, CHARINDEX`**



&#x20;**1. Combine `fname` and `department` using `CONCAT`.**

**2. Combine `fname`, `city`, and `department` using `CONCAT\_WS` with `'-'`.**

**3. Find the length of every employee's `fname`.**

**4. Remove leading/trailing spaces from `fname` using `TRIM`.**

**5. Extract the \*\*first 3 characters\*\* of `fname`.**

**6. Extract the \*\*last 2 characters\*\* of `fname`.**

**7. Convert all employee names to \*\*uppercase\*\*.**

**8. Convert all employee names to \*\*lowercase\*\*.**

**9. Replace `'a'` with `'@'` in employee names.**

**10. Find the position of the letter `'a'` in each employee's `fname` using `CHARINDEX`.**



**---**



&#x20;**# Day 4 — Date Functions**



&#x20;**Practice:**



&#x20;**`GETDATE(), YEAR, MONTH, DAY, DATEDIFF, DATEADD`**



&#x20;**1. Display the current date and time using `GETDATE()`.**

**2. Display the current year.**

**3. Display the current month.**

**4. Display the current day.**

**5. Display each employee's `hire\_date` and hire year.**

**6. Display each employee's `hire\_date` and hire month.**

**7. Display each employee's `hire\_date` and hire day.**

**8. Find how many \*\*years\*\* each employee has worked.**

**9. Find employees who were hired after `'2020-01-01'`.**

**10. Display each employee's hire date and calculate the date \*\*30 days after their hire date\*\*.**



**---**



&#x20;**# Day 5 — ALTER TABLE**



&#x20;**Practice adding, removing, and modifying columns.**



&#x20;**1. Add a column `phone` with datatype `VARCHAR(15)`.**

**2. Add a column `address` with datatype `VARCHAR(100)`.**

**3. Add a column `bonus` with datatype `DECIMAL(10,2)`.**

**4. Drop the `phone` column.**

**5. Drop the `address` column.**

**6. Change the datatype of `fname` to `VARCHAR(100)`.**

**7. Change the datatype of `salary` to `DECIMAL(12,2)`.**

**8. Add a column `joining\_year` with datatype `INT`.**

**9. Change the datatype of `email` to `VARCHAR(150)`.**

**10. Add a column `status` with datatype `VARCHAR(20)`.**



**---**



&#x20;**# Day 6 — Rename Table \& Column**



&#x20;**1. Rename column `fname` to `first\_name`.**

**2. Rename column `city` to `location`.**

**3. Rename column `department` to `dept`.**

**4. Rename column `salary` to `monthly\_salary`.**

**5. Rename table `employees` to `staff`.**

**6. Rename table `staff` back to `employees`.**

**7. Rename `first\_name` back to `fname`.**

**8. Rename `dept` back to `department`.**

**9. Rename `location` back to `city`.**

**10. Rename `monthly\_salary` back to `salary`.**



&#x20;**\*\*Note:\*\* In SQL Server, practice these using `sp\_rename`.**



**---**



&#x20;**# Day 7 — Change Datatype**



&#x20;**1. Change `fname` to `VARCHAR(100)`.**

**2. Change `email` to `VARCHAR(150)`.**

**3. Change `city` to `VARCHAR(50)`.**

**4. Change `department` to `VARCHAR(50)`.**

**5. Change `salary` to `DECIMAL(10,2)`.**

**6. Change `phone` to `VARCHAR(15)`.**

**7. Change `address` to `VARCHAR(200)`.**

**8. Change `fname` to `VARCHAR(100) NOT NULL`.**

**9. Change `email` to `VARCHAR(150) NOT NULL`.**

**10. Change `salary` to `DECIMAL(12,2) NOT NULL`.**



**---**



&#x20;**# Day 8 — DEFAULT Constraint**



&#x20;**1. Add a default value `'TRAINEE'` for `department`.**

**2. Add a default value `'UNKNOWN'` for `city`.**

**3. Add a default value `'ACTIVE'` for `status`.**

**4. Add a default value `0` for `bonus`.**

**5. Add a default value `'Not Provided'` for `phone`.**

**6. Insert an employee without specifying `department` and check the default value.**

**7. Insert an employee without specifying `city` and check the default value.**

**8. Insert an employee without specifying `status`.**

**9. Find the constraint name created for your default constraint.**

**10. Remove/drop the default constraint.**



**---**



&#x20;**# Day 9 — UNIQUE Constraint**



&#x20;**1. Create a table `Students` with a unique `email`.**

**2. Add a unique constraint to `Employees.email`.**

**3. Try inserting two employees with the same email.**

**4. Create a table with a unique `phone` column.**

**5. Add a unique constraint to `phone`.**

**6. Try inserting duplicate phone numbers.**

**7. Create a table where `username` must be unique.**

**8. Add a unique constraint to `username`.**

**9. Try inserting duplicate usernames.**

**10. Drop the unique constraint.**



&#x20;**\*\*Important:\*\* A `UNIQUE` constraint generally prevents duplicate values, while a `PRIMARY KEY` also identifies each row and cannot be `NULL`.**



**---**



&#x20;**# Day 10 — CHECK Constraint**



&#x20;**1. Create a table where salary must be greater than `0`.**

**2. Add a CHECK constraint to `Employees.salary` requiring salary \\> 0.**

**3. Try inserting an employee with salary `-5000`.**

**4. Add a CHECK constraint requiring salary \\>= 10000.**

**5. Add a CHECK constraint requiring `age >= 18`.**

**6. Add a CHECK constraint requiring `age <= 60`.**

**7. Add a CHECK constraint requiring department to be `'IT'`, `'HR'`, or `'SALES'`.**

**8. Add a CHECK constraint requiring email to contain `'@'`.**

**9. Add a CHECK constraint requiring salary between `20000` and `200000`.**

**10. Drop the CHECK constraint.**



**---**



&#x20;**## Your Daily Routine**



&#x20;**A good way to practice these is:**



&#x20;**- \*\*Day 1:\*\* CASE — 10 questions**

**- \*\*Day 2:\*\* Subqueries — 10 questions**

**- \*\*Day 3:\*\* String Functions — 10 questions**

**- \*\*Day 4:\*\* Date Functions — 10 questions**

**- \*\*Day 5:\*\* ALTER TABLE — 10 questions**

**- \*\*Day 6:\*\* Rename — 10 questions**

**- \*\*Day 7:\*\* Change Datatype — 10 questions**

**- \*\*Day 8:\*\* DEFAULT — 10 questions**

**- \*\*Day 9:\*\* UNIQUE — 10 questions**

**- \*\*Day 10:\*\* CHECK — 10 questions**



&#x20;**\*\*Best method:\*\* Don't look at your notes while solving. Write the query yourself, run it, and if you get an error, try fixing it before checking the solution.**



&#x20;**If you want, I can also make the \*\*next 100 questions slightly harder (Level 2)\*\* using the same topics.**


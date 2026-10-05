
Day 1 — CASE Statements
Assume table:

Employees(emp_id, fname, salary, department, city, hire_date, email)

Display all employees and create a column SALARY_BAND.

Salary > 60000 → 'High'

Salary 50000–60000 → 'Medium'

Otherwise → 'Low'

Display fname, salary, and classify employees:

Salary >= 70000 → 'Excellent'

Salary >= 50000 → 'Good'

Otherwise → 'Needs Improvement'

Create a column CITY_TYPE.

Pune → 'Pune Employee'

Mumbai → 'Mumbai Employee'

Otherwise → 'Other City'

Create a column SALARY_LEVEL.

Salary < 40000 → 'Entry'

40000–60000 → 'Mid'

60000 → 'Senior'

Display employees and classify their departments:

IT → 'Technology'

HR → 'Human Resources'

Sales → 'Business'

Otherwise → 'Other'

Create an AGE_GROUP column using an age column:

< 25 → 'Young'

25–40 → 'Adult'

40 → 'Senior'

Create a column BONUS.

Salary > 70000 → 10000

Salary 50000–70000 → 5000

Otherwise → 2000

Display fname, salary, and a column showing:

Salary >= 60000 → 'Eligible'

Otherwise → 'Not Eligible'

Sort employees by salary and display a salary category using CASE.

Create a PERFORMANCE column based on salary:

= 80000 → 'A'

= 60000 → 'B'

= 40000 → 'C'

Otherwise → 'D'

Day 2 — Subqueries
Find employees whose salary is greater than the average salary.

Find employees whose salary is less than the average salary.

Find the employee(s) having the maximum salary.

Find the employee(s) having the minimum salary.

Find employees who earn the same salary as the highest-paid employee in the IT department.

Find employees who work in the same department as the employee named 'Rahul'.

Find employees who live in the same city as the employee named 'Amit'.

Find employees whose salary is greater than the salary of the employee named 'Priya'.

Find the employee(s) having the maximum salary in each department.

Find employees who belong to a department where at least 2 employees work.

Day 3 — String Functions
Practice these functions:

CONCAT, CONCAT_WS, LEN, TRIM, SUBSTRING, LEFT, RIGHT, UPPER, LOWER, REPLACE, REVERSE, CHARINDEX

Combine fname and department using CONCAT.

Combine fname, city, and department using CONCAT_WS with '-'.

Find the length of every employee's fname.

Remove leading/trailing spaces from fname using TRIM.

Extract the first 3 characters of fname.

Extract the last 2 characters of fname.

Convert all employee names to uppercase.

Convert all employee names to lowercase.

Replace 'a' with '@' in employee names.

Find the position of the letter 'a' in each employee's fname using CHARINDEX.

Day 4 — Date Functions
Practice:

GETDATE(), YEAR, MONTH, DAY, DATEDIFF, DATEADD

Display the current date and time using GETDATE().

Display the current year.

Display the current month.

Display the current day.

Display each employee's hire_date and hire year.

Display each employee's hire_date and hire month.

Display each employee's hire_date and hire day.

Find how many years each employee has worked.

Find employees who were hired after '2020-01-01'.

Display each employee's hire date and calculate the date 30 days after their hire date.

Day 5 — ALTER TABLE
Practice adding, removing, and modifying columns.

Add a column phone with datatype VARCHAR(15).

Add a column address with datatype VARCHAR(100).

Add a column bonus with datatype DECIMAL(10,2).

Drop the phone column.

Drop the address column.

Change the datatype of fname to VARCHAR(100).

Change the datatype of salary to DECIMAL(12,2).

Add a column joining_year with datatype INT.

Change the datatype of email to VARCHAR(150).

Add a column status with datatype VARCHAR(20).

Day 6 — Rename Table & Column
Rename column fname to first_name.

Rename column city to location.

Rename column department to dept.

Rename column salary to monthly_salary.

Rename table employees to staff.

Rename table staff back to employees.

Rename first_name back to fname.

Rename dept back to department.

Rename location back to city.

Rename monthly_salary back to salary.

Note: In SQL Server, practice these using sp_rename.

Day 7 — Change Datatype
Change fname to VARCHAR(100).

Change email to VARCHAR(150).

Change city to VARCHAR(50).

Change department to VARCHAR(50).

Change salary to DECIMAL(10,2).

Change phone to VARCHAR(15).

Change address to VARCHAR(200).

Change fname to VARCHAR(100) NOT NULL.

Change email to VARCHAR(150) NOT NULL.

Change salary to DECIMAL(12,2) NOT NULL.

Day 8 — DEFAULT Constraint
Add a default value 'TRAINEE' for department.

Add a default value 'UNKNOWN' for city.

Add a default value 'ACTIVE' for status.

Add a default value 0 for bonus.

Add a default value 'Not Provided' for phone.

Insert an employee without specifying department and check the default value.

Insert an employee without specifying city and check the default value.

Insert an employee without specifying status.

Find the constraint name created for your default constraint.

Remove/drop the default constraint.

Day 9 — UNIQUE Constraint
Create a table Students with a unique email.

Add a unique constraint to Employees.email.

Try inserting two employees with the same email.

Create a table with a unique phone column.

Add a unique constraint to phone.

Try inserting duplicate phone numbers.

Create a table where username must be unique.

Add a unique constraint to username.

Try inserting duplicate usernames.

Drop the unique constraint.

Important: A UNIQUE constraint generally prevents duplicate values, while a PRIMARY KEY also identifies each row and cannot be NULL.

Day 10 — CHECK Constraint
Create a table where salary must be greater than 0.

Add a CHECK constraint to Employees.salary requiring salary > 0.

Try inserting an employee with salary -5000.

Add a CHECK constraint requiring salary >= 10000.

Add a CHECK constraint requiring age >= 18.

Add a CHECK constraint requiring age <= 60.

Add a CHECK constraint requiring department to be 'IT', 'HR', or 'SALES'.

Add a CHECK constraint requiring email to contain '@'.

Add a CHECK constraint requiring salary between 20000 and 200000.

Drop the CHECK constraint.

Your Daily Routine
A good way to practice these is:

Day 1: CASE — 10 questions

Day 2: Subqueries — 10 questions

Day 3: String Functions — 10 questions

Day 4: Date Functions — 10 questions

Day 5: ALTER TABLE — 10 questions

Day 6: Rename — 10 questions

Day 7: Change Datatype — 10 questions

Day 8: DEFAULT — 10 questions

Day 9: UNIQUE — 10 questions

Day 10: CHECK — 10 questions



------------------------------------------------------------------------------------------------------------------------------


 # Day 1 — Relationships & Foreign Keys

 Use your `Customer` and `Orders` tables.

 1. What is the primary key in the `Customer` table?
2. What is the primary key in the `Orders` table?
3. Which column creates the relationship between `Customer` and `Orders`?
4. Write a query to display all customers.
5. Write a query to display all orders.
6. Insert one new customer into the `Customer` table.
7. Insert one new order for customer `101`.
8. Try inserting an order with `cust_id = 999`. What happens?
9. Explain why `cust_id` is a foreign key in `Orders`.
10. Write a query to find how many orders customer `101` has placed.

---

 # Day 2 — ON DELETE CASCADE

 Create two simple tables for practice:

 `Customers` and `Orders`

 with a foreign key using `ON DELETE CASCADE`.

 1. Create a `Customers` table with `customer_id` as primary key.
2. Create an `Orders` table with `order_id` as primary key.
3. Add `customer_id` as a foreign key in `Orders`.
4. Add `ON DELETE CASCADE` to the foreign key.
5. Insert 3 customers.
6. Insert 5 orders for those customers.
7. Delete one customer.
8. Check what happened to that customer's orders.
9. Delete another customer.
10. Explain in your own words what `ON DELETE CASCADE` does.

---

 # Day 3 — CROSS JOIN

 Use:

 - `Customer`
- `Orders`

 Remember: **CROSS JOIN combines every row with every row.**

 1. Write a CROSS JOIN between `Customer` and `Orders`.
2. Display only `Cust_name` and `order_id`.
3. Display `Cust_name` and `total_amount`.
4. Count the total number of rows produced by the CROSS JOIN.
5. CROSS JOIN `Customer` with itself.
6. Display customer names from both sides.
7. Use aliases `C1` and `C2` for the customer tables.
8. Display `C1.Cust_name` and `C2.Cust_name`.
9. Find the number of rows produced when 5 customers are CROSS JOINed with 20 orders.
10. In one sentence, explain when a CROSS JOIN is useful.

---

 # Day 4 — INNER JOIN

 Use `Customer` and `Orders`.

 1. Display customer name and order ID.
2. Display customer name and order amount.
3. Display customer name, order date, and amount.
4. Display only orders belonging to customer `'Rahul Sharma'`.
5. Display all orders where amount is greater than `2000`.
6. Display customer names and their order dates.
7. Count the number of orders for each customer.
8. Calculate the total amount spent by each customer.
9. Display customers whose total purchase is greater than `5000`.
10. Sort customers by their total purchase from highest to lowest.

---

 # Day 5 — LEFT JOIN

 Remember:

 **LEFT JOIN → all rows from the left table + matching rows from the right table.**

 1. Display all customers and their orders.
2. Display customer name and order amount.
3. Display all customers even if they have no orders.
4. Find customers who have **no orders**.
5. Count orders for every customer.
6. Calculate total purchase for every customer.
7. Display customers whose total purchase is greater than `3000`.
8. Display customers having more than 2 orders.
9. Display customer name, order date, and amount using LEFT JOIN.
10. Explain the difference between INNER JOIN and LEFT JOIN.

---

 # Day 6 — RIGHT JOIN & FULL OUTER JOIN

 ### RIGHT JOIN

 1. Write a RIGHT JOIN between `Customer` and `Orders`.
2. Display customer name and order ID.
3. Display customer name and total amount.
4. Sort the result by `cust_id`.
5. Count orders for each customer using RIGHT JOIN.

 ### FULL OUTER JOIN

 6. Write a FULL OUTER JOIN between `Customer` and `Orders`.
7. Display customer name and order ID.
8. Display customer name, order date, and amount.
9. Find rows where there is no matching customer.
10. Explain the difference between LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.

---

 # Day 7 — OUTER APPLY & CROSS APPLY

 Use your `Customer` and `Orders` tables.

 ### OUTER APPLY

 1. Display each customer and their **most recent order**.
2. Display customer name and latest order date.
3. Display customer name, order ID, and latest order amount.
4. Use `TOP 1` with `ORDER BY order_date DESC`.
5. Make sure customers without orders are also displayed.

 ### CROSS APPLY

 6. Display each customer and their latest order using CROSS APPLY.
7. Display customer name and latest order amount.
8. Display customer name and latest order date.
9. Compare the result of OUTER APPLY and CROSS APPLY.
10. Explain when OUTER APPLY and CROSS APPLY give different results.

---

 # Day 8 — UNION, UNION ALL & EXCEPT

 Create two simple queries using your customer data.

 For example, you can select customer names based on different conditions.

 ### UNION

 1. Get customers whose name starts with `'R'` and combine with customers whose name starts with `'P'`.
2. Use UNION to combine two customer-name queries.
3. Make sure both SELECT statements return the same number of columns.
4. Use UNION to combine customers from two different cities if you add a city column.

 ### UNION ALL

 5. Write a UNION ALL query using two customer queries.
6. Create duplicate data between the two queries and observe the result.
7. Compare the number of rows returned by UNION and UNION ALL.

 ### EXCEPT

 8. Find customers present in the first query but not in the second query.
9. Find customer IDs in one result set that are not in another result set.
10. Explain the difference between **UNION**, **UNION ALL**, and **EXCEPT**.

---

 # Day 9 — SELF JOIN

 Use your `CompanyHierarchy` table:

```
EmployeeID
Name
ManagerID
```

 1. Display every employee and their manager.
2. Use aliases `e` and `m`.
3. Display only `employee_name` and `manager_name`.
4. Find employees who have a manager.
5. Find employees who don't have a manager.
6. Display Sonia's employees.
7. Find employees who report directly to Rohan.
8. Display employee ID, employee name, manager ID, and manager name.
9. Count how many employees report to each manager.
10. Explain why a SELF JOIN is useful for an employee-manager hierarchy.

---

 # Day 10 — MANY-TO-MANY Relationship

 Use:

 - `students`
- `courses`
- `enrollment`

 Relationship:

```
Students
   |
   | 1
   |
   | many
Enrollment
   |
   | many
   |
   | 1
Courses
```

 1. Display all students.
2. Display all courses.
3. Display all enrollments.
4. Display student name and course name.
5. Display student name, course name, and enrollment date.
6. Display the course(s) taken by `'Raju'`.
7. Display the students enrolled in `'Mathematics'`.
8. Count the number of students in each course.
9. Calculate the total course fees for each course based on enrollment.
10. Display each student and the total number of courses they are enrolled in.

---

 # Bonus — Mixed Practice

 After completing the 10 days, try these without looking at your notes:

1. Find the customer who has placed the most orders.
2. Find the customer who has spent the most money.
3. Find the customer who has never placed an order.
4. Find the latest order of every customer.
5. Find customers whose total purchase is greater than `5000`.
6. Find the average order amount for each customer.
7. Find the course having the highest number of students.
8. Find students who are enrolled in more than one course.
9. Find managers who have more than one employee.
10. Display customer name, number of orders, total purchase, and latest order date in one result.

 ### Recommended order

 - **Day 1:** Relationships & Foreign Keys
- **Day 2:** ON DELETE CASCADE
- **Day 3:** CROSS JOIN
- **Day 4:** INNER JOIN
- **Day 5:** LEFT JOIN
- **Day 6:** RIGHT + FULL JOIN
- **Day 7:** OUTER APPLY + CROSS APPLY
- **Day 8:** UNION + UNION ALL \+ EXCEPT
- **Day 9:** SELF JOIN
- **Day 10:** MANY-TO-MANY



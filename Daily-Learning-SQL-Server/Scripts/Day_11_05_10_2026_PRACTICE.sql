
SELECT NAME FROM SYS.DATABASES;
USE store_db;
SELECT NAME FROM SYS.TABLES;
EXEC SP_HELP Customer
EXEC SP_HELP Customer

SELECT * FROM Customer;
SELECT * FROM Orders;


-- JOINS --)

SELECT * FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id


SELECT c.Cust_name, o.total_amount FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id;

SELECT c.Cust_name, o.total_amount FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id
WHERE o.order_id IS NULL;

SELECT c.Cust_name, COUNT(o.order_id) AS ord FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id
GROUP BY c.Cust_name;


SELECT c.Cust_name, sum(o.total_amount) as total FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id
GROUP BY c.Cust_name;


SELECT c.Cust_name, sum(o.total_amount) as total FROM Customer c
LEFT JOIN Orders o
ON o.cust_id = c.cust_id
GROUP BY c.Cust_name
HAVING sum(o.total_amount) > 3000;

SELECT c.Cust_name,count(o.order_id) as tot_ord FROM Customer c
LEFT JOIN Orders o
ON c.cust_id = o.cust_id
group by c.Cust_name
HAVING count(o.order_id) > 3;

SELECT c.Cust_name,o.order_date,o.total_amount  FROM Customer c
LEFT JOIN Orders o
ON c.cust_id = o.cust_id


SELECT * FROM Customer c
RIGHT JOIN Orders o
ON c.cust_id = o.cust_id

SELECT C.Cust_name, O.order_id FROM Customer c
RIGHT JOIN Orders o
ON c.cust_id = o.cust_id

SELECT C.Cust_name, O.total_amount FROM Customer c
RIGHT JOIN Orders o
ON c.cust_id = o.cust_id


SELECT * FROM Customer c
RIGHT JOIN Orders o
ON c.cust_id = o.cust_id
ORDER BY c.cust_id;

SELECT c.Cust_name,COUNT(o.order_id) FROM Customer c
RIGHT JOIN Orders o
ON c.cust_id = o.cust_id
GROUP BY c.Cust_name;

SELECT  * FROM Customer c
FULL JOIN Orders o
ON c.cust_id = o.cust_id

SELECT * FROM Customer c
FULL OUTER JOIN Orders o
ON c.cust_id = o.cust_id


-- Here is a list of advanced MySQL interview questions and providing detailed answers .

-- Q1. How can you find the Nth highest salary from a table?
-- Answer :
SELECT DISTINCT salary 
FROM employee e1 
WHERE N-1 = (SELECT COUNT(DISTINCT salary) 
             FROM employee e2 
             WHERE e2.salary > e1.salary);
             
             
-- Q2. Explain `JOIN` and different types of `JOIN` in MySQL.
-- Answer :
/*JOIN is used to combine rows from two or more tables based on a related column between them. Types of joins:

- INNER JOIN: Returns records that have matching values in both tables.
- LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table, and the matched records from the right table.
- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table, and the matched records from the left table.
- FULL JOIN (or FULL OUTER JOIN): Returns all records when there's a match in one of the tables.
*/


-- Q3. How can you optimize a MySQL query?
-- Answer :
/*Some of the ways include:


- Using indexes effectively.
- Avoiding `SELECT *`.
- Limiting the result set using `LIMIT`.
- Using `EXPLAIN` to understand the query execution plan.
- Avoiding heavy operations like subqueries or joins if not necessary.
*/


-- Q4. Explain the difference between `CHAR` and `VARCHAR` data types?
-- Answer :
-- CHAR has a fixed length whereas VARCHAR has a variable length. CHAR always uses the same amount of storage space per entry, while VARCHAR uses only the space required plus a small overhead.


-- Q5. Write a query to retrieve duplicate records from a table without using the `DISTINCT` keyword.
-- Answer :
SELECT column_name, COUNT(column_name) 
FROM table_name 
GROUP BY column_name 
HAVING COUNT(column_name) > 1;


-- Q6. What are the differences between `UNION` and `UNION ALL`?
-- Answer : UNION combines the result sets of two or more queries and removes duplicates. UNION ALL combines result sets but does not remove duplicates.


-- Q7. How can you fetch alternate records from a table?
-- Answer :
-- For odd rows:
SELECT * FROM table_name WHERE MOD(id,2) = 1;

-- For even rows:
SELECT * FROM table_name WHERE MOD(id,2) = 0;


-- Q8. What is a `stored procedure` in MySQL?
-- Answer : A stored procedure is a precompiled group of SQL statements stored in the database. It can be executed multiple times whenever required.


-- Q9. How can you prevent SQL injection in MySQL?

-- Answer : Use prepared statements with parameterized queries, escape user inputs, and avoid using raw SQL queries with user input.


-- Q10. Write a query to find the second highest salary from a table.
-- Answer :
SELECT MAX(salary) 
FROM employee 
WHERE salary NOT IN (SELECT MAX(salary) FROM employee);


-- Q11. How do you index a column in a table?
-- Answer :
ALTER TABLE table_name ADD INDEX(index_name, column_name);


-- Q12. Explain the `ACID` properties in a database.
-- Answer : ACID stands for Atomicity, Consistency, Isolation, and Durability. It ensures that database transactions are processed reliably.


-- Q13. How can you improve the performance of a MySQL database?**
-- Answer :
-- Some methods include:

-- Normalizing the database.
-- Using appropriate indexes.
-- Using the latest versions of MySQL.
-- Using caching mechanisms.
-- Optimizing server settings.


-- Q14. Write a query to find all employees who started after Jan 1, 2020, but before Jan 1, 2023.
-- Answer :
SELECT * FROM employees 
WHERE start_date BETWEEN '2020-01-01' AND '2022-12-31';


-- Q15. What is a `trigger` in MySQL?
-- Answer : A trigger is a set of instructions that are automatically executed (or fired) in response to a specific event, such as inserting, updating, or deleting records in a table.


-- Q16. What is a view in MySQL?**
-- Answer : A view is a virtual table based on the result set of an SQL statement. It contains rows and columns from one or more tables. Views do not store data physically, but rather, they provide a way to look at data in different ways without changing the underlying schema.


-- Q17. How can you implement pagination in MySQL?**
-- Answer :Pagination can be implemented using the `LIMIT` and `OFFSET` clauses.


-- Q18. Explain the difference between `MyISAM` and `InnoDB`.**
-- Answer :
/*
MyISAM and InnoDB are storage engines for MySQL.

- MyISAM: Table-level locking, no foreign key constraints, no transaction support.
- InnoDB: Row-level locking, supports foreign key constraints, ACID-compliant with transaction support.
*/


-- Q19. How can you find all tables that have specific column names in a database?
-- Answer:
/*
SELECT table_name 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE COLUMN_NAME = 'your_column_name' 
AND TABLE_SCHEMA = 'your_database_name';
*/


-- Q20. How can you backup and restore a MySQL database?
/*Answer :
To backup:

```bash
mysqldump -u username -p database_name > backup.sql

```
To restore:

```bash
mysql -u username -p database_name < backup.sql
*/


-- Q21. How do you concatenate strings in MySQL?**
/* Answer :
You can use the `CONCAT` function or the `||` operator (if the `PIPES_AS_CONCAT` SQL mode is enabled).

SELECT CONCAT(first_name, ' ', last_name) AS full_name 
FROM employees;
*/


-- Q22. How can you retrieve unique values from a column without using the `DISTINCT` keyword?
-- Answer :
SELECT column_name 
FROM table_name 
GROUP BY column_name;


-- Q23. Explain the difference between a `PRIMARY KEY` and a `UNIQUE` constraint.
-- Answer: Both enforce uniqueness for the values in a column, but a table can have only one primary key, whereas it can have multiple unique constraints. Additionally, primary keys automatically create a clustered index on the column, whereas unique constraints create a non-clustered index by default.


-- Q24. How can you create a copy of a table, including both structure and data, without using any backup utilities?**
-- Answer :
CREATE TABLE new_table AS SELECT * FROM old_table;


-- Q25. How can you convert a UNIX timestamp into a readable date format in MySQL?
-- Answer :
SELECT FROM_UNIXTIME(your_unix_timestamp_column) 
FROM your_table;


-- Q26. What's the difference between `NOW()` and `CURRENT_DATE()` in MySQL?
-- Answer :
-- `NOW()` returns the current date and time, while `CURRENT_DATE()` returns only the current date.


-- Q27. Write a query to get the length of the string in a column.
-- Answer :
SELECT LENGTH(column_name) 
FROM table_name;


-- Q28. How do you delete all records from a table without deleting the table itself?**
-- Answer :
TRUNCATE TABLE table_name;


-- Q29. What is the purpose of the `GROUP_CONCAT` function in MySQL?
-- Answer :
-- `GROUP_CONCAT` function is used to concatenate values from multiple rows into a single string. It's especially useful when used with `GROUP BY`.


-- Q30. How do you convert a data type of a column in a table?
-- Answer :
ALTER TABLE table_name 
MODIFY column_name NEW_DATA_TYPE;


-- Q31. How would you retrieve the total count of rows, but only count each distinct value in a column once?
-- Answer:
SELECT COUNT(DISTINCT column_name) 
FROM table_name;


-- Q32. How would you find the three most frequent values in a column along with their counts?
-- Answer :
SELECT column_name, COUNT(column_name) 
FROM table_name 
GROUP BY column_name 
ORDER BY COUNT(column_name) DESC 
LIMIT 3;


-- Q33. Write a query to get the monthly sales amount for the last 12 months.
-- Answer :
SELECT MONTH(sale_date) AS month, YEAR(sale_date) AS year, SUM(amount) AS monthly_sales
FROM sales 
WHERE sale_date BETWEEN DATE_SUB(NOW(), INTERVAL 12 MONTH) AND NOW() 
GROUP BY YEAR(sale_date), MONTH(sale_date) 
ORDER BY YEAR(sale_date) DESC, MONTH(sale_date) DESC;


-- Q34. Write a query to find employees who have managers with a salary greater than $100,000.
-- Answer :
SELECT e1.* 
FROM employees e1 
INNER JOIN employees e2 ON e1.manager_id = e2.id 
WHERE e2.salary > 100000;







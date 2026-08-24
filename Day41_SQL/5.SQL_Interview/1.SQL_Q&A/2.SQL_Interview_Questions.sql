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














             
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


             
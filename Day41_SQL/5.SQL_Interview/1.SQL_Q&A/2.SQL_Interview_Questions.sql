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








             
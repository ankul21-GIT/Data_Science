-- Here is a list of advanced MySQL interview questions and providing detailed answers .

-- Q1. How can you find the Nth highest salary from a table?
-- Answer :
SELECT DISTINCT salary 
FROM employee e1 
WHERE N-1 = (SELECT COUNT(DISTINCT salary) 
             FROM employee e2 
             WHERE e2.salary > e1.salary);
             
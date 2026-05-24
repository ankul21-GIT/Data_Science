-- SQL Practice

CREATE DATABASE practice;

USE practice;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);


INSERT INTO Employee 
(id, name, salary) 
VALUES
(1, 'Ankul', 50000),
(2, 'Ravi', 70000),
(3, 'Neha', 60000),
(4, 'Amit', 90000);


SELECT * FROM Employee;

-- DROP TABLE Employee; - Completely remove the table (structure + data)

-- TRUNCATE TABLE Employee; - Remove all rows but keep table structure

-- DELETE = DELETE FROM Employee WHERE id = 2; it is used for delete any specific row.alter

-- 1. Find the maximum salary from Employee.

SELECT MAX(Salary) FROM Employee;

-- 2. Find the second highest salary from employee.

SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- OR

SELECT name, salary FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


-- OR

SELECT name, salary AS second_highest_salary
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee)
);
 
 
-- Using window funciton you can find 2,3 and 4 any salary.

SELECT salary AS nth_highest_salary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 3;

-- Third highest salary

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;


-- Difference between GROUP BY and OVER() window function.

-- GROUP BY - Pure table ko select nhi krta (GROUP BY poori table ko tod kar summary bana deta hai (rows gayab ho jaati hain))
SELECT id, MAX(salary)
FROM Employee
GROUP BY id;

-- OVER() - OVER select whole table.(OVER() poori table ko dekhta hai, lekin rows ko hataata nahi)
-- “Kaun employee highest salary se kitna peeche hai”
SELECT name, salary,
       MAX(salary) OVER ()
FROM Employee;


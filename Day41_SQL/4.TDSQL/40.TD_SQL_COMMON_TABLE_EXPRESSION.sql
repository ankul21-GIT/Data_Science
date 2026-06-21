/*
-- Common Table Expression

A Common Table Expression (CTE) in SQL is a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.

CTEs are defined using the WITH keyword and allow you to create a named, reusable subquery within your SQL statement. They provide a way to simplify complex queries and make them more readable.

-- Use Cases 

Simplifying complex queries by breaking them down into smaller, reusable parts.

Reusing subqueries within a single SQL statement to avoid duplication.

Performing recursive operations, such as navigating hierarchical data structures.

Organizing SQL statements for better readability and maintainability.

*/

USE rough;

-- Syntax

WITH cte_name (column1, column2, ...)
AS (
    -- SQL query (SELECT statement)
)
SELECT columns
FROM cte_name
WHERE condition;

SELECT CURDATE() AS currentD;


WITH curDate AS (
    SELECT CURDATE() AS currentD
)
SELECT c.currentD FROM curDate AS c;



WITH curDate AS (
    SELECT CURDATE() AS currentD
)
SELECT e.eid, e.empName,c.currentD FROM employee AS e, curDate AS c;


/*
-- Key Points

WITH keyword – starts the CTE definition.

cte_name – name of your CTE (like a temporary table).

(column list) – optional; used if column names need to be renamed.

AS ( ... ) – contains the actual SQL query.

The CTE can be used just like a table or view in the subsequent query.
*/


-- Example

-- Regular Subquery

SELECT Eid, empName, salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);


-- Scope: Exists only inside the query where it is written.
-- Readability: Can get complex when nested deeply.
-- Reusability: Cannot be referenced multiple times directly.


-- With CTE

WITH avg_salary AS (
    SELECT AVG(salary) AS avg_sal FROM employees
)
SELECT eId, empName, salary
FROM employees, avg_salary
WHERE salary > avg_salary.avg_sal;

-- Scope: Exists only for the query immediately following it.
-- Readability: Easier to break down complex queries.
-- Reusability: The CTE result can be referenced multiple times in the main query.



-- A) Non - Recursive CTEs

#Example - 1  Top 3 Selling Products

WITH ProductSales AS (
    SELECT p.productName,
           SUM(o.qty) AS total_quantity
    FROM products p
    JOIN order_items o ON p.productCode = o.productCode
    GROUP BY p.productName
)
SELECT *
FROM ProductSales
ORDER BY total_quantity DESC
LIMIT 3;



#Example - 2 The highest revenue the branch earned on any single day in 2001.

CREATE TABLE pro_sales (
    branch VARCHAR(50),
    sale_date DATE,
    seller VARCHAR(30),
    item VARCHAR(50),
    quantity INT,
    unit_price INT
);

INSERT INTO pro_sales
(branch, sale_date, seller, item, quantity, unit_price)
VALUES
('India - Delhi',     '2021-12-07', 'Amit',  'Headphones A2', 1,  80),
('USA - New York',    '2021-12-06', 'Ravi',  'Cell Phone X2', 2, 120),
('UK - London',       '2021-12-07', 'Priya', 'Headphones A1', 1,  60),
('India - Mumbai',    '2021-12-07', 'Amit',  'Battery Charger', 1, 50),
('UK - London',       '2021-12-07', 'Priya', 'Cell Phone B2', 2,  90),
('USA - New York',    '2021-12-07', 'Ravi',  'Headphones A0', 5,  75),
('USA - Chicago',     '2021-12-07', 'Neha',  'Cell Phone X1', 2, 100),
('India - Bangalore', '2021-12-08', 'Amit',  'Cell Phone X3', 3, 150),
('USA - New York',    '2021-12-08', 'Ravi',  'Battery Charger', 4, 45),
('UK - Manchester',   '2021-12-09', 'Priya', 'Headphones A2', 2,  80),
('India - Delhi',     '2021-12-09', 'Neha',  'Cell Phone B2', 1,  90),
('UK - London',       '2021-12-10', 'Priya', 'Headphones A0', 3,  75),
('India - Hyderabad', '2021-12-10', 'Amit',  'Cell Phone X1', 5, 100),
('USA - Chicago',     '2021-12-11', 'Neha',  'Headphones A1', 2,  60),
('India - Mumbai',    '2021-12-11', 'Amit',  'Battery Charger', 2, 50),
('USA - New York',    '2021-12-12', 'Ravi',  'Cell Phone X2', 1, 120);


SELECT * FROM pro_sales;

WITH daily_revenue AS (
    SELECT
        branch,
        sale_date,
        SUM(unit_price * quantity) AS daily_revenue_amt
    FROM pro_sales
    WHERE EXTRACT(YEAR FROM sale_date) = 2021
    GROUP BY 1, 2
)
SELECT
    branch,
    MAX(daily_revenue_amt) max_daily_revenue
FROM daily_revenue
GROUP BY 1
ORDER BY 2 DESC;



#Example - 3

-- Find the total quantity sold and total revenue for each
-- product, then order products by revenue in descending order.

WITH ProductSales AS (
    SELECT productCode,
           SUM(qty) AS total_qty
    FROM order_items
    GROUP BY productCode
),
ProductPrice AS (
    SELECT productCode, salePrice
    FROM products
)
SELECT
    p.productCode,
    p.salePrice,
    ps.total_qty,
    (p.salePrice * ps.total_qty) AS revenue
FROM ProductPrice p
JOIN ProductSales ps
    ON p.productCode = ps.productCode
ORDER BY revenue DESC;



#Example - 4

-- Top 3 departments by salary expense

WITH dept_expense AS (
    SELECT department,
           SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
),
ranked_dept AS (
    SELECT department,
           total_salary,
           RANK() OVER (ORDER BY total_salary DESC) AS rnk
    FROM dept_expense
)
SELECT *
FROM ranked_dept
WHERE rnk <= 3;


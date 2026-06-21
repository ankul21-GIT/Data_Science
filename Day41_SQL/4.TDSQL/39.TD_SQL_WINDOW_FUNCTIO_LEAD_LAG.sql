-- Windows Function -- ADV LESSON 28


-- Revision Aggregate Window Function

-- SUM(): Sums values within a window.
-- AVG(): Calculates the average value within a window.
-- COUNT(): Counts the rows within a window.
-- MAX(): Returns the maximum value in the window.
-- MIN(): Returns the minimum value in the window.



USE rough;

DROP TABLE sales;
CREATE TABLE sales (
    id INT PRIMARY KEY,
    employee VARCHAR(50),
    region VARCHAR(50),
    amount INT
);


INSERT INTO sales (id, employee, region, amount) VALUES
(1, 'Alice',   'East',  1000),
(2, 'Bob',     'East',  1200),
(3, 'Alice', 'West',   900),
(4, 'Dave',    'West',  1500),
(5, 'Eve',     'East',  1100),
(6, 'Frank',   'West',  1000),
(7, 'Grace',   'South',  700),
(8, 'Bob',   'South',  900),
(9, 'Ivan',    'South',  950),
(10,'Judy',    'East',  1300);


SELECT * FROM sales;


SELECT 
	id,
    region,
    employee,
    amount,
    SUM(amount) OVER (PARTITION BY region) AS region_total
FROM sales;


-- Without windows function 

SELECT s.*
FROM sales s
JOIN (
  SELECT region, MAX(amount) AS max_amount
  FROM sales
  GROUP BY region
) t ON s.region = t.region AND s.amount = t.max_amount;


# OVER 

-- Defines the window (or "scope") for the function to operate on.
-- Without OVER: ROW_NUMBER() cannot work because it needs to know how to group and order rows.
  
# PARTITION BY column

-- Splits the rows into groups (partitions) based on column value.


# ORDER BY column ASC/DESC

-- Same work but with windows partition by OVER keyword.

-- ROW_NUMBER()

#Use: Assigns a unique sequential number to each row in the result set.

-- Top 1 Order per Customer (e.g., finding latest purchase of each customer).

SELECT * FROM orderss;

SELECT
	orderNumber,
    custID,
    orderDate,
    ROW_NUMBER() OVER (PARTITION BY custID ORDER BY orderDate DESC) AS row_num
FROM orderss;


SELECT * FROM employee;

-- With CTE

SELECT * FROM employee;
WITH RANKED AS (
	SELECT
		department,
        empName,
        salary,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rownum
	FROM employee
)
SELECT department FROM ranked WHERE rowNum = 1;


-- Find the latest order of each customers.

SELECT * FROM orderss;

SELECT orderNumber, custID, orderDate,
ROW_NUMBER() OVER (PARTITION BY custID ORDER BY orderDate) AS row_num
FROM orderss;


SELECT custId, SUM(orderAmount) AS total_sales,
RANK() OVER (ORDER BY SUM(orderAmount) DESC) AS sales_rank
FROM orderss
GROUP BY custId;


-- RANK()



#Use: Assigns rank to rows. Ties get the same rank, and the next rank is skipped.

-- Find Top-Selling Products where ties should have same rank.

SELECT * FROM orderdetails;

SELECT 
	 productCode,
     SUM(priceEach*quantityOrdered) As totalsales,
     RANK() OVER (ORDER BY SUM(priceEach*quantityOrdered) DESC) AS ranks
FROM orderdetails
GROUP BY productCode;


SELECT * FROM sales;
     
     
SELECT 
    employee,
    SUM(amount) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS `rank`
FROM sales
GROUP BY employee;


-- DENSE_RANK()

#Use: Similar to RANK(), but no ranks are skipped.

-- Sales Competition where products with equal sales get same rank without skipping.

SELECT 
    employee,
    SUM(amount) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS `dense_rank`
FROM sales
GROUP BY employee;



-- DENSE_RANK()

#Use: Similar to RANK(), but no ranks are skipped.

-- Sales Competition where products with equal sales get same rank without skipping.

SELECT 
    productCode,
    SUM(priceEach) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(priceEach) DESC) AS `dense_rank`
FROM orderdetails
GROUP BY productCode;

SELECT * FROM orderDetails;


-- PERCENT_RANK()

#Use: Computes the relative rank of a row (0 to 1 scale).

-- Find Performance Percentiles of employees or students.
SELECT * FROM employee;

SELECT
	eID,
    salary,
    PERCENT_RANK() OVER (ORDER BY salary DESC) AS salary_percent_rank
FROM employee;

-- In ascsending order

SELECT
	eID,
    salary,
    PERCENT_RANK() OVER (ORDER BY salary ASC) AS salary_percent_rank
FROM employee;




-- NTILE(n)

#Use: Distributes rows into n buckets as evenly as possible.

-- Divide Employees into Salary Quartiles for HR analytics.

SELECT
	eID,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employee;


SELECT
	eID,
    salary,
    NTILE(2) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employee;
   
   
-- LAG() 

#Use: Accesses data from the previous row within the same result set.

SELECT * FROM sales;

SELECT
	id,
    region,
    amount,
    LAG(amount, 1) OVER (ORDER BY id) AS previous_amount
FROM sales;



-- LEAD()

-- Use: Accesses data from the next row within the same result set.

SELECT
	id,
    region,
    amount,
    LEAD(amount, 1) OVER (ORDER BY id) AS next_amount
FROM sales;


SELECT
	id,
    region,
    amount,
    LEAD(amount, 1) OVER (ORDER BY id) AS next_amount,
    LAG(amount, 1) OVER (ORDER BY id) AS previous_amount
FROM sales;




-- FIRST_VALUE()

-- Use: Returns the first value in an ordered set.

-- Identify First Purchase Date of a customer.

SELECT * FROM orderss;

SELECT 
    custId,
    orderDate,
    STATUS,
    custId,
    FIRST_VALUE(orderDate) OVER (PARTITION BY custId ORDER BY orderDate) AS first_order_date
FROM orderss;

SELECT * FROM orderss WHERE custID = 103 ORDER BY orderDate ASC;


-- LAST_VALUE()

#Use: Returns the last value in an ordered set.

-- Find Most Recent Transaction per customer.

SELECT * FROM orderss;

SELECT 
    custId,
    orderDate,
    status,
    custId,
    LAST_VALUE(orderDate) OVER 
    (PARTITION BY custId ORDER BY orderDate ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)AS last_order_date
FROM orderss;


SELECT  * FROM orderss WHERE custId = 103 ORDER BY orderDate DESC;



-- NTH_VALUE()

#Use: Fetches the nth value from the window.

-- Find Second Purchase Date (or any nth event).

SELECT 
    custId,
    NTH_VALUE(orderDate, 3) OVER (PARTITION BY custId ORDER BY orderDate) AS second_order_date
FROM orderss;


SELECT 
    custId,
    NTH_VALUE(orderDate, 4) OVER (PARTITION BY custId ORDER BY orderDate) AS second_order_date
FROM orderss;



-- CUME_DIST() - Cumulative Distribution

#Use: Relative standing of a row within a group.
 
-- Salary Percentile Analysis (e.g., find employees in the top 10% salary range).

SELECT * FROM employee;

SELECT 
    eId,
    salary,
    CUME_DIST() OVER (ORDER BY salary asc) AS salary_distribution
FROM employee;



-- Common Uses in Real Scenarios

-- Ranking Data (RANK, DENSE_RANK, ROW_NUMBER)

-- Find top 3 highest-paid employees in each department.

SELECT 
    department,
    empName,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS ranks
FROM employee;


-- Running Totals & Cumulative Sums

#Example: Calculate cumulative sales by date.
SELECT 
    order_date,
    SUM(amount) OVER (ORDER BY order_date) AS cumulative_sales
FROM orders;



#Example: Calculate a 7-day rolling average.

SELECT 
    order_date,
    AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg
FROM orders;


#Example: Find each student's percentile based on scores.   

SELECT 
    student_id,
    score,
    PERCENT_RANK() OVER (ORDER BY score DESC) AS percentile
FROM students;
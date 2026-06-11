-- LESSON: 11  Practice / Assigment -- 

-- Write a query to fetch all columns for all employees.

SELECT * FROM employees;

-- Fetch the unique product from the orders table.

SELECT DISTINCT productcode FROM orderdetails;

-- Fetch all details of employees who belong to the 'Sales' department.

SELECT * FROM employees WHERE department = 'Sales';

-- Fetch the employee names and their salaries with column aliases "Name" and "Income" show intern if income is 0.

SELECT CONCAT(firstname, ' ', lastname) as name, 
COALESCE(NULLIF(salary,0), 'intern') AS income FROM employees;


-- Show all products buy price above 50 Dollar.

SELECT * FROM products WHERE buyprice > 50;

-- Fetch the top 2 highest paid employees in our company.

SELECT * FROM employees ORDER BY salary DESC LIMIT 2;

-- Get employees who are either in Sales or have a salary above 30,000.

SELECT * FROM employees WHERE department = 'Sales' OR salary > 30000;

-- Fetch products with a price between 20 and 100.

SELECT * FROM products WHERE buyprice BETWEEN 100 AND 200;

-- Retrieve orders where the product is either 'Laptop' or 'Tablet'

SELECT * FROM products WHERE productname IN ('Laptop','Tablet');

-- Find employee names starting with 'J'

SELECT * FROM employees WHERE firstname LIKE 'j%';

-- Case insensitive search for employee names containing 'son'

SELECT * FROM employees WHERE firstname LIKE '%son%';

-- Display employee names along with their salary category as 'High' if above 70,000, else 'Low'

SELECT CONCAT(firstname, ' ', lastname) as Name,
	salary,
	CASE
		WHEN salary > 35000 THEN 'High'
		ELSE 'Low'
	END
FROM employees;

-- Show the delivery date, but if it is NULL, display 'Pending'

SELECT orderNumber,
	COALESCE (shippedDate,'Pending') AS status
FROM orders;

-- Compare two columns and return NULL if they are the same.

SELECT 
	NULLIF(firstname,lastname) AS col
FROM employees;

-- OR

SELECT 
	COALESCE(NULLIF(firstName, lastName),'SAME') AS col
FROM employees;

-- Display employee names and their salary incremented by 10% as "New Salary"

SELECT CONCAT(firstname,' ',lastname) AS Name,
	salary,
    salary + (salary % 10) AS IncrementedSalary
FROM employees;

-- Get the employees who are either in 'Sales' or 'Marketing' department and earn more than 30,000.

SELECT * FROM employees
WHERE departments IN ('Sales','Marketing')
AND salary > 30000;

-- Show the product name and its availability status as 'In Stock' if the quantity is more than0, else 'Out of Stock'

SELECT 
	product_name,
    CASE
		WHEN quantity > 0 THEN 'In Stock'
        ELSE 'Out of stock'
	
    END AS availibility_status
FROM products;

-- Display customer names and delivery dates, but if the delivery date is NULL, show 'Not Delivered'

-- Using CASE

SELECT 
    customer_name,
    CASE 
        WHEN delivery_date IS NULL THEN 'Not Delivered'
        ELSE delivery_date
    END AS delivery_status
FROM orders;

-- Using COALESCE (shorter way

SELECT 
    customer_name,
    COALESCE(delivery_date, 'Not Delivered') AS delivery_status
FROM orders;


-- Retrieve all products whose names contain the letter 'a' (case insensitive) and are priced between 50 and 200, 
-- ordered by price in ascending order.

SELECT * FROM products WHERE productname LIKE '%a%' AND buyprice BETWEEN 50 AND 200 ORDER BY BUYprice ASC; 

-- Count the number of different products sold.

SELECT COUNT(DISTINCT product_id) AS total_products_sold
FROM sales;


-- Count how many employees have salaries above 70,000.

SELECT COUNT(*) AS high_salary_employees
FROM employees
WHERE salary > 70000;




-- -----------------------------------------   -------------------------------------------     --------------------------------------------------



-- LESSON: 11  Practice / Assigment -- 

-- Write a query to fetch all columns for all employees.

   SELECT * FROM employees;

-- Fetch the unique product from the orders table.
  
   SELECT DISTINCT productCode FROM orderdetails;

-- Fetch all details of employees who belong to the 'Sales' department.
   
   SELECT * FROM employees where department = 'SALES';

-- Fetch the employee names and their salaries with column aliases "Name" and "Income" Show Intern if income is 0  
   
   select CONCAT(firstName,' ',lastName) as Name,
  	COALESCE (NULLIF(salary,0),'Intern') as Income from employees;
 

-- Show all products buy price above 50 Dollar.
  
   select * from products WHERE buyPrice > 50;

-- Fetch the top 2 highest paid employees in our company.
   
   SELECT * FROM employees order by salary DESC LIMIT 2;
   

-- Get employees who are either in Sales or have a salary above 30,000.
  
   SELECT * FROM employees WHERE department = 'Sales' OR salary > 30000;

-- Fetch products with a price between 20 and 100.
   SELECT * FROM products WHERE buyPrice BETWEEN 100 and 200;

-- Retrieve orders where the product is either 'Laptop' or 'Tablet'
   
   select * from products where productline in ('Vintage Cars','Motorcycles') 

-- Find employee names starting with 'J'
   
   SELECT * FROM employees where firstName LIKE 'J%';

-- Case insensitive search for employee names containing 'son'

  	SELECT * FROM employees where firstName LIKE '%son%';
  
-- Display employee names along with their salary category as 'High' if above 35,000, else 'Low'
   
   select CONCAT(firstName,' ',lastName) as Name,
   		  salary,
   		  CASE 
   		  	WHEN salary > 35000 THEN 'High'
   		  	ELSE 'Low'
   		  END
   FROM employees;
   		  
   

-- Show the delivery date, but if it is NULL, display 'Pending'

    select orderNumber,
   		COALESCE (shippedDate,'Pending') as status
   	from orders;
   
-- Compare two columns and return NULL if they are the same.
   
   SELECT 
    COALESCE(NULLIF(firstName,lastName),'SAME') as col
   from employees;
   
   

-- Display employee names and their salary incremented by 10% as "New Salary"
  
   SELECT CONCAT(firstName,' ',lastName) as Name,
           salary,
   		  salary + (salary % 10) AS incrementedSalary
   		 FROM employees;

-- Get the employees who are either in 'Sales' or 'Marketing' department and earn more than 30,000.
   		
   		-- BY YOU GUYS

-- Show the product name and its availability status as 'In Stock' 
--    if the quantity is more than 0, else 'Out of Stock'
		
   		-- BY YOU GUYS
   		
-- Display customer names and delivery dates, but if the delivery date is NULL, show 'Not Delivered'
   		
   		-- BY YOU GUYS

-- Retrieve all products whose names contain the letter 'a' (case insensitive) and are priced 
--  between 50 and 200, ordered by price in ascending order.

	 select * from products 
   		where productName LIKE '%8%' and buyPrice 
   	BETWEEN 50 and 200 ORDER BY buyPrice desc;
   		
   		
-- Count the number of different products sold.
   

-- Count how many employees have salaries above 70,000.




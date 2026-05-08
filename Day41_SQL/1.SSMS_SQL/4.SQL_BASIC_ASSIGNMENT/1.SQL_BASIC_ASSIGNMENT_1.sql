
--Step 1) Create Table

CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table

INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');



SELECT * FROM EmployeeSales;


-- Questions for this assignment -1


-- Q-1--> Write a query to calculate the total sales amount for each department in the EmployeeSales table.

SELECT Department,
       SUM(SaleAmount) AS Total_Sales
FROM EmployeeSales
GROUP BY Department;

-- Q-2--> Write a query to count the number of sales made by each employee.

SELECT EmployeeID,
       COUNT(SaleID) AS Total_Sales_Count
FROM EmployeeSales
GROUP BY EmployeeID;

-- Q-3--> Write a query to calculate the average sale amount for each department.

SELECT Department,
       AVG(SaleAmount) AS Average_Sale
FROM EmployeeSales
GROUP BY Department;

-- Q-4--> Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.

SELECT EmployeeID,
       SUM(SaleAmount) AS Total_Sales
FROM EmployeeSales
GROUP BY EmployeeID
HAVING COUNT(SaleID) > 1;

-- Q-5--> Write a query to find the total sales for each month in 2023.

SELECT 
    MONTH(SaleDate) AS Sale_Month,
    SUM(SaleAmount) AS Total_Sales
FROM EmployeeSales
WHERE YEAR(SaleDate) = 2023
GROUP BY MONTH(SaleDate)
ORDER BY Sale_Month;
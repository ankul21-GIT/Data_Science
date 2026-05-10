DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

-- Questions for this assignment-5

-- Q-1--> Write a SQL query to select all columns and rows from the Employees table.

SELECT *
FROM Employees;

-- Q-2--> Write a SQL query to find the names and email addresses of all employees who work in the department with DepartmentID = 101.

SELECT FirstName, LastName, Email
FROM Employees
WHERE DepartmentID = 101;

-- Q-3--> Write a SQL query to find the total number of employees in the Employees table.

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

-- Q-4--> Write a SQL query to find the details of employees who were hired in the year 2020.

SELECT *
FROM Employees
WHERE YEAR(HireDate) = 2020;

-- Q-5--> Write a SQL query to update the salary of 'Jane Doe' to 90,000.

UPDATE Employees
SET Salary = 90000
WHERE FirstName = 'Jane' AND LastName = 'Doe';
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

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


SELECT * FROM Employees;


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);


INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

SELECT * FROM Departments;

-- Q-1--> Write a SQL query to list the names of employees along with the names of the departments they work in.

SELECT 
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM Employees e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- OR

SELECT FirstName, LastName, DepartmentID
FROM Employees;

-- Q-2--> Write a SQL query to list all the departments and the employees working in them, including departments with no employees.

SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- OR

SELECT 
d.DepartmentID,
d.DepartmentName,
e.FirstName,
e.LastName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;

-- Q-3--> Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID).

SELECT 
e.FirstName,
e.LastName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


SELECT FirstName, LastName
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM Departments d
    WHERE e.DepartmentID = d.DepartmentID
);

-- Q-4--> Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.

SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employees
    WHERE FirstName = 'Jane' AND LastName = 'Doe'
);

-- Q-5--> Write a SQL query to find the department with the highest total salary paid to its employees.

SELECT TOP 1 DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
ORDER BY TotalSalary DESC;


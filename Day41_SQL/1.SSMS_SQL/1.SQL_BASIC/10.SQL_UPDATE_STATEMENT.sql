CREATE DATABASE employee_info


USE employee_info



CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(10, 2),
	HireDate DATE
	
);



INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 50000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2019-03-23'),
(3, 'Alice', 'Johnson', 'IT', 75000.00, '2021-07-10'),
(4, 'Bob', 'Brown', 'Marketing', 55000.00, '2018-09-30'),
(5, 'Charlie', 'Davis', 'IT', 70000.00, '2022-02-20');



-- Practice

SELECT * FROM dbo.Employees

-- Temporary Table

SELECT * INTO #1 FROM [dbo].[Employees]


SELECT * FROM #1


UPDATE #1
SET Department = 'HR'
WHERE Department IS NULL

UPDATE #1
SET Salary = 89000, HireDate = '2023-01-01'
WHERE EmployeeID = 7

SELECT * FROM #1 WHERE EmployeeID = 7

SELECT * INTO #2 FROM dbo.Employees

SELECT * FROM #2

UPDATE #2
SET Department = 'Finance'
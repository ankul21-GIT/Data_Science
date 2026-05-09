
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employee (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

-- Questions for this assignment-2

-- Q-1--> Write a SQL query to find the names of employees who have a salary higher than the average salary of all employees.

SELECT FirstName, LastName, Salary
FROM Employee
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
);

-- Q-2--> Write a SQL query to list the employee names and their departments for employees who were hired after the oldest employee in the company.


SELECT FirstName, LastName, DepartmentID
FROM Employee
WHERE HireDate > (
    SELECT MIN(HireDate)
    FROM Employee
);

-- Q-3--> Write a SQL query to find the details of the employee(s) with the highest salary.

SELECT *
FROM Employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employee
);

-- Q-4--> Write a SQL query to find the names of employees who work in the same department as 'John Smith'.

SELECT DepartmentID 
FROM Employee 
WHERE FirstName = 'John' AND LastName = 'Smith'


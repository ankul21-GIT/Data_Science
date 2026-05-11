CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);

--1. How do you select employees who work in the 'IT' department and have a salary greater than 75,000?

SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary > 75000;


--2. How do you find employees who work in the 'HR' department or have a salary less than 60,000?

SELECT *
FROM Employees
WHERE Department = 'HR'
OR Salary < 60000;


--3. How do you select employees who do not work in the 'Finance' department?

SELECT *
FROM Employees
WHERE Department <> 'Finance';

SELECT * FROM Employees WHERE Department NOT IN ('Finance')

--or

select * from Employees where not Department = 'Finance'


--4. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?

SELECT *
FROM Employees
WHERE Department = 'Finance'
AND Salary BETWEEN 60000 AND 70000;


--5. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000?
SELECT * FROM Employees WHERE Department = 'Finance' AND Salary<=80000

SELECT *
FROM Employees
WHERE Department = 'IT'
AND Salary <= 80000;

--or

select * from Employees where Department in ('Finance') and not Salary>80000


--6. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?

SELECT *
FROM Employees
WHERE Department IN ('HR','Finance')
AND Salary > 65000;

--7. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?
SELECT * FROM Employees WHERE LastName LIKE 'd%' AND Department NOT IN ('HR')


--8. How do you find employees who do not work in the 'IT' department and have a salary greater than 70,000?

SELECT *
FROM Employees
WHERE Department <> 'IT'
AND Salary > 70000;

--9. How do you select employees who work in the 'IT' department and either have a salary greater 
--than 75,000 or have the first name 'Laura'?

SELECT *
FROM Employees
WHERE Department = 'IT'
AND (Salary > 75000 OR FirstName = 'Laura');


--10. How do you find employees who do not work in the 'HR' or 'IT' departments?

SELECT *
FROM Employees
WHERE Department NOT IN ('HR','IT');
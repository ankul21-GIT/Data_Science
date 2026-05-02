
CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalary (EmployeeID, EmployeeName, Salary, Department)
VALUES
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'HR'),
(3, 'Charlie', 55000, 'HR'),
(4, 'David', 75000, 'Finance'),
(5, 'Eve', 80000, 'Finance'),
(6, 'Frank', 72000, 'Finance'),
(7, 'Grace', 90000, 'IT'),
(8, 'Heidi', 95000, 'IT'),
(9, 'Ivan', 87000, 'IT');


-- Practice



SELECT * FROM EmployeeSalary

SELECT *
,FIRST_VALUE(Salary) OVER(ORDER BY salary ASC) [Minimum Salary]
FROM EmployeeSalarY

SELECT *
,FIRST_VALUE(EmployeeName) OVER(ORDER BY salary ASC) [Emp with Minimum Salary]
,FIRST_VALUE(Salary) OVER(ORDER BY salary ASC) [Minimum Salary]
FROM EmployeeSalary


SELECT * 
,FIRST_VALUE(EmployeeID) OVER(PARTITION BY department ORDER BY salary) [First Value]
FROM EmployeeSalary

SELECT * 
,FIRST_VALUE(EmployeeID) OVER(PARTITION BY department ORDER BY salary DESC) [First Value EID]
,FIRST_VALUE(EmployeeName) OVER(PARTITION BY department ORDER BY salary DESC) [First Value EName]
FROM EmployeeSalary
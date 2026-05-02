
CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
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


CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalaries (EmployeeID, EmployeeName, Salary, Department)
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


SELECT * FROM EmployeeSalaries

-- Practice




--Order Of Execution

SELECT * FROM EmployeeSalaries

--Correct Query

SELECT DISTINCT TOP 1 Department,AVG(Salary) [Avg Salary] 
FROM EmployeeSalaries
WHERE Salary>50000
GROUP BY Department
HAVING AVG(Salary)>55000
ORDER BY Department 


--From & Joins
--where
--group by
--having
--select
--distinct
--order by
--top

--Incorrect Query

SELECT DISTINCT TOP 1 Department,AVG(Salary) [Avg Salary] 
FROM EmployeeSalaries
WHERE Salary>50000
GROUP BY Department
HAVING AVG(Salary)>55000
ORDER BY Department 
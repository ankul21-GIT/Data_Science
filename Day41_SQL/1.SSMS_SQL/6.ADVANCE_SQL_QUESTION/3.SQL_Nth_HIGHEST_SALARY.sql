DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, EmployeeName, Salary)
VALUES
(1, 'Alice Smith', 70000.00),
(2, 'Bob Johnson', 85000.00),
(3, 'Carol White', 95000.00),
(4, 'David Brown', 60000.00),
(5, 'Eve Davis', 75000.00),
(6, 'Frank Miller', 90000.00),
(7, 'Grace Lee', 80000.00),
(8, 'Hannah Clark', 62000.00),
(9, 'Ivy Harris', 74000.00),
(10, 'Jack Lewis', 98000.00);






SELECT *
FROM Employees;

--2nd Highest Salary
SELECT MAX(Salary) AS [2nd Highest Salary]
FROM Employees
WHERE Salary < ( SELECT MAX(Salary) FROM Employees
);

--3rd highest salary
SELECT MAX(Salary) AS [3rd Highest Salary]
FROM Employees
WHERE Salary < ( SELECT MAX(Salary) FROM Employees WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);

-- OR

SELECT MAX(Salary) AS [3rd Highest Salary]
FROM Employees
WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees
        WHERE Salary < (
                SELECT MAX(Salary)
                FROM Employees
        )
);

--CTE
with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [2nd Highest Salary] from cte where DR = 2

-- OR

WITH SalaryRank AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS DR
    FROM Employees
)

SELECT Salary AS [2nd Highest Salary]
FROM SalaryRank
WHERE DR = 2;

--3rd Highest Salary

with cte as(
select *,DENSE_RANK() over(order by salary desc) [DR] from Employees
)

select salary [3rd Highest Salary] from cte where DR = 3

-- OR

WITH SalaryRank AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS DR
    FROM Employees
)
SELECT Salary AS [3rd Highest Salary]
FROM SalaryRank
WHERE DR = 3;

--Sub Query along with Dense_Rank()

select salary as [2nd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) x
where DR = 2

-- OR

SELECT Salary AS [2nd Highest Salary]
FROM (
        SELECT *,
               DENSE_RANK() OVER (ORDER BY Salary DESC) AS DR
        FROM Employees
     ) AS X
WHERE DR = 2;

--------------------------------------------------------
select salary as [3rd highest salary] from
(select *, DENSE_RANK() over(order by salary desc) [DR] from Employees) x
where DR = 3

-- OR

SELECT Salary AS [3rd Highest Salary]
FROM (
        SELECT *,
               DENSE_RANK() OVER (ORDER BY Salary DESC) AS DR
        FROM Employees
     ) AS X
WHERE DR = 3;


--Sub Query
select top 1 salary [2nd Highest Salary] from 
(select distinct top 2 salary from Employees order by Salary desc) x
order by Salary asc

-- OR

SELECT TOP 1 Salary AS [2nd Highest Salary]
FROM (
        SELECT DISTINCT TOP 2 Salary
        FROM Employees
        ORDER BY Salary DESC
     ) AS X
ORDER BY Salary ASC;

--3rd Highest Salary

select top 1 salary [3rd Highest Salary] from 
(select distinct top 3 salary from Employees order by salary desc) y
order by Salary asc

-- OR

SELECT TOP 1 Salary AS [3rd Highest Salary]
FROM (
        SELECT DISTINCT TOP 3 Salary
        FROM Employees
        ORDER BY Salary DESC
     ) AS Y
ORDER BY Salary ASC;
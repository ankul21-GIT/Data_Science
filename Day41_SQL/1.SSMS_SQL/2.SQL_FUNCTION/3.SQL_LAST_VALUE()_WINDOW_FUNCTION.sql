
CREATE TABLE EmployeeSalariess (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT,
    Department VARCHAR(50)
);


INSERT INTO EmployeeSalariess (EmployeeID, EmployeeName, Salary, Department)
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




SELECT * FROM EmployeeSalariess

--Incorrect Query

SELECT * 
,LAST_VALUE(EmployeeName) OVER(ORDER BY salary DESC) [Emp with Lowest Salary]
FROM EmployeeSalariess


--correct Query
SELECT * 
,LAST_VALUE(EmployeeName) OVER(ORDER BY salary DESC ROWS BETWEEN unbounded preceding and unbounded following) [Emp with Lowest Salary]
FROM EmployeeSalariess


--correct Query
SELECT * 
,LAST_VALUE(EmployeeName) OVER(ORDER BY salary DESC ROWS BETWEEN unbounded preceding and unbounded following) [Emp with Lowest Salary]
,LAST_VALUE(Salary) OVER(ORDER BY salary DESC ROWS BETWEEN unbounded preceding and unbounded following) [Lowest Salary]
FROM EmployeeSalariess

--correct Query
SELECT * 
,LAST_VALUE(EmployeeName) OVER(partition by department
ORDER BY salary DESC ROWS BETWEEN unbounded preceding and unbounded following) [Emp with Lowest Salary]
,LAST_VALUE(Salary) OVER(partition by department ORDER BY salary DESC ROWS between unbounded preceding and unbounded following) [Lowest Salary]
FROM EmployeeSalariess


/*
SELECT 
    *,
    LAST_VALUE(EmployeeName) OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS [Emp with Lowest Salary],
    
    LAST_VALUE(Salary) OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS [Lowest Salary]
FROM EmployeeSalaries;


*/




--correct Query [Last Value Window Fun]

SELECT * 
,LAST_VALUE(EmployeeName) OVER(partition by department
ORDER BY salary ROWS BETWEEN unbounded preceding and unbounded following) [Emp with Highest Salary]

,LAST_VALUE(Salary) OVER(partition by department ORDER BY salary ASC ROWS BETWEEN unbounded preceding and unbounded following) [Highest Salary]
FROM EmployeeSalariess

--correct Query [First Value Window Fun]

SELECT * 
,FIRST_VALUE(EmployeeName) OVER(partition by department
ORDER BY salary DESC) [Emp with Highest Salary]
,FIRST_VALUE(Salary) OVER(partition by department ORDER BY salary DESC) [Highest Salary]
FROM EmployeeSalariess
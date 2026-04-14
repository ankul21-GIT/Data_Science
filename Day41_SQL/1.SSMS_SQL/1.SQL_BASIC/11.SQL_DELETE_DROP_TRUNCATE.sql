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


SELECT * INTO #3 FROM dbo.Employees


SELECT * FROM #3


DELETE FROM #3
WHERE LastName = ' ' OR Department = '0'


SELECT * INTO #4 FROM dbo.Employees

SELECT * FROM #4

DELETE FROM #4


SELECT * FROM #3


TRUNCATE TABLE #3


DROP TABLE #3



--Delete - delete certain records from the table

--if we will use delete without where condition, all records from the table will be deleted, but the 
--table structure remains intact

--Truncate - delete all the records from the table but the structure of the table remains intact

--Drop - all the records will be deleted plus table structure will also be removed
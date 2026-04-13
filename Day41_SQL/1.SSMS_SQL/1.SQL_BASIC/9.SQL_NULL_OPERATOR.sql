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

INSERT INTO dbo.Employees
VALUES
(9, 'Jay', 'IT', '', 73000, '2022-04-04')


INSERT INTO DBO.Employees
VALUES (10,'Nitin','shamani','0',54000,'2021-02-22')


SELECT * FROM dbo.Employees WHERE Department = NULL

SELECT * FROM dbo.Employees WHERE Department is NULL

SELECT * FROM dbo.Employees WHERE Department IS NOT NULL
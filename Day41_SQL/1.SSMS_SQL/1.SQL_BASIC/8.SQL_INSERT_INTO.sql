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


-- INSERT

INSERT INTO Employees
VALUES
(6, 'Raj', 'Ambani', 'IT', 67000, '2023-04-20')

INSERT INTO dbo.Employees (EmployeeID,FirstName,LastName)
VALUES (7,'Rohit','Mehera')

INSERT INTO dbo.Employees
VALUES
(8,'Mahesh','Narang','HR',73000,'2024-01-21')

SELECT * FROM dbo.Employees


SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'Employees'
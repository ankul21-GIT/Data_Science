CREATE TABLE EmployeeRecords(
	EmployeeID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Department VARCHAR(50),
	Salary DECIMAL(10, 2)
	
);



INSERT INTO EmployeeRecords (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Miller', 'HR', 60000.00),
(2, 'Jane', 'Smith', 'Finance', 75000.00),
(3, 'John', 'Miller', 'HR', 60000.00),
(4, 'Emily', 'Davis', 'IT', 85000.00),
(5, 'Michael', 'Brown', 'Finance', 75000.00),
(6, 'Jane', 'Smith', 'Finance', 75000.00);



-- Practice

SELECT * FROM dbo.EmployeeRecords
WHERE NOT FirstName = 'John' AND NOT Salary = 60000


SELECT * FROM dbo.EmployeeRecords
WHERE NOT LastName  = 'Miller' OR NOT Department = 'HR'




SELECT * FROM dbo.EmployeeRecords
WHERE Salary BETWEEN 75000 AND 85000


SELECT * FROM dbo.EmployeeRecords
WHERE Salary>= 75000 AND Salary<=85000


SELECT * FROM dbo.EmployeeRecords
WHERE Salary NOT BETWEEN 75000 AND 85000



SELECT * FROM dbo.EmployeeRecords
WHERE Department = 'HR' OR Department = 'IT'


SELECT * FROM dbo.EmployeeRecords
WHERE Department IN ('HR','IT')


SELECT * FROM dbo.EmployeeRecords
WHERE Department NOT IN ('HR','IT')


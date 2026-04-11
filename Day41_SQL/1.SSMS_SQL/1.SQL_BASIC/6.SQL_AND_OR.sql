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



-- Practice Question

SELECT * FROM EmployeeRecords

SELECT * FROM EmployeeRecords
WHERE LastName = 'Miller' AND EmployeeID = 3


SELECT * FROM EmployeeRecords
WHERE Department = 'HR' OR Department = 'Finance'


SELECT * FROM EmployeeRecords
WHERE (Department = 'HR' OR Department = 'Finance') AND Salary = 60000


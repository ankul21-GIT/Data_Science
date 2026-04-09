-- CREATE DATABASE employee_info


-- USE employee_info



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


SELECT DISTINCT FirstName FROM EmployeeRecords

SELECT DISTINCT FirstName,LastName FROM EmployeeRecords

SELECT DISTINCT salary FROM Employeerecords

SELECT DISTINCT * FROM EmployeeRecords
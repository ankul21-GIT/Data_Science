

/* SELECT column1, column2,...
FROM table_name
WHERE condition;
*/

SELECT * FROM EmployeeRecords
WHERE EmployeeID = 2


SELECT EmployeeID, FirstName FROM [dbo].[EmployeeRecords]
WHERE EmployeeID = 2



SELECT * FROM dbo.EmployeeRecords WHERE Salary>=75000


SELECT FirstName, Lastname, Department, Salary
FROM [dbo].[EmployeeRecords] WHERE Salary>=75000.00

SELECT DISTINCT FirstName, LastName, Department, Salary
FROM [dbo].[EmployeeRecords] WHERE Salary>=75000.00


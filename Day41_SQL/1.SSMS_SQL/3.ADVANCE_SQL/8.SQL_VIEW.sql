

SELECT * FROM Employees

SELECT * INTO emp_bk FROM Employees

emp_bk


--A View is a virtual table,it is a stored SQL Query
--It helps in reducing the complexity of the code
--It helps in implementing security

CREATE VIEW View_1 as (
SELECT * FROM emp_bk
)

SELECT * FROM View_1
--**
UPDATE View_1
SET EmployeeID = 100;


--**




CREATE VIEW View_2 AS (
SELECT EmployeeID,FirstName,LastName,Email,DepartmentID,HireDate FROM emp_bk
)

SELECT * FROM View_2

----------

DROP VIEW View_2
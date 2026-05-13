-- Create the table with EmployeeID and Email
CREATE TABLE EmployeeRecords_1 (
    EmployeeID INT,
    Email VARCHAR(100)
);



INSERT INTO EmployeeRecords_1 (EmployeeID, Email) VALUES
(1, 'alice@example.com'),
(2, 'bob@example.com'),
(3, 'carol@example.com'),
(4, 'david@example.com'),
(2, 'bob@example.com'),        -- Duplicate entry (same EmployeeID and Email)
(4, 'david@example.com'),      -- Duplicate entry (same EmployeeID and Email)
(5, 'shared@example.com'),     -- Valid case: Same email, different EmployeeID
(6, 'shared@example.com');     -- Valid case: Same email, different EmployeeID



SELECT * FROM EmployeeRecords_1
ORDER BY Employeeid,email;

------
SELECT DISTINCT * INTO #1 FROM EmployeeRecords_1

TRUNCATE TABLE EmployeeRecords_1

INSERT INTO EmployeeRecords_1 SELECT * FROM #1

SELECT * FROM EmployeeRecords_1 ORDER BY email

--

--Record with Lower Employee ID should remain
with cte AS (
SELECT *, DENSE_RANK() OVER(PARTITION BY email ORDER BY employeeid) [DR] FROM EmployeeRecords_1
)
DELETE FROM cte WHERE dr = 2


---
SELECT * INTO employeerecords_2 from #1

SELECT * FROM employeerecords_2 ORDER BY email

--Retail the record with higher Employee id
with cte AS (
SELECT *, DENSE_RANK() OVER(PARTITION BY email ORDER BY employeeid DESC) [DR] FROM employeerecords_2
)
--select * from cte
DELETE FROM cte WHERE DR = 2
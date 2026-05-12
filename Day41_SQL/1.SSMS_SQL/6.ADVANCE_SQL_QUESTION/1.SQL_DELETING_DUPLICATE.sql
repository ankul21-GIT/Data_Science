DROP TABLE IF EXISTS EmployeeRecords;

CREATE TABLE EmployeeRecords (
    EmployeeID INT,
    EmployeeName VARCHAR(100),
    ManagerID INT
);



INSERT INTO EmployeeRecords (EmployeeID, EmployeeName, ManagerID) VALUES
(1, 'Alice Smith', NULL),
(2, 'Bob Johnson', 1),
(3, 'Carol White', 1),
(4, 'David Brown', 2),
(5, 'Eve Davis', 2),
(6, 'Frank Miller', 3),
(2, 'Bob Johnson', 1),  -- Duplicate entry
(4, 'David Brown', 2);  -- Duplicate entry





SELECT * FROM EmployeeRecords
ORDER BY EmployeeID,EmployeeName,ManagerID;

With CTE AS (
SELECT *, row_number() OVER(PARTITION BY employeeid,employeename,managerid ORDER BY employeeid) [Row Number] FROM EmployeeRecords
)
DELETE FROM cte WHERE [Row Number] = 2

-----------------------
SELECT * INTO emprecords_bkp FROM EmployeeRecords

SELECT * FROM emprecords_bkp

SELECT DISTINCT * INTO #1 FROM emprecords_bkp

TRUNCATE TABLE emprecords_bkp

INSERT INTO emprecords_bkp SELECT * FROM #1

SELECT * FROM #1
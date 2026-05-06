

SELECT * FROM Employees

SELECT * INTO #1 FROM dbo.Employees;

---Example 1

With CTE1 AS (
SELECT * FROM #1 WHERE EmployeeID in (1,2)
),CTE2 AS (
SELECT * FROM #1 WHERE EmployeeID in (3,4)
)
SELECT * FROM cte1
UNION ALL
SELECT * FROM cte2;

--Example 2

with cte3 AS (
SELECT employeeid,firstname FROM #1 WHERE EmployeeID = 1
),cte4 as (
SELECT employeeid,firstname FROM #1 WHERE EmployeeID in (3)
)
SELECT * INTO #2 FROM (
SELECT * FROM cte3
UNION ALL
SELECT * FROM cte4
) x;


--Example 3 
with cte3 AS (
SELECT employeeid,firstname FROM #1 WHERE EmployeeID = 1
),cte4 AS (
SELECT employeeid,firstname FROM #1 WHERE EmployeeID in (3)
)
INSERT INTO #2 SELECT * FROM (
SELECT * FROM cte3
UNION ALL
SELECT * FROM cte4
) x;

SELECT * FROM #2;

--Example 4
with cte3 AS (
SELECT employeeid,firstname,Salary FROM #1 WHERE EmployeeID = 2
),cte4 AS (
SELECT employeeid,firstname,Salary FROM #1 WHERE EmployeeID in (4)
)
DELETE FROM #1 WHERE EmployeeID IN (SELECT DISTINCT employeeid FROM cte3
UNION ALL
SELECT DISTINCT EmployeeID FROM cte4
);

SELECT * FROM #1;

--Example 5 :

with cte3 AS (
SELECT employeeid,firstname,Salary FROM #1 WHERE EmployeeID = 9
),cte4 AS (
SELECT employeeid,firstname,Salary FROM #1 WHERE EmployeeID in (10)
)
UPDATE #1 SET employeeid = 100 WHERE EmployeeID NOT IN (SELECT DISTINCT employeeid FROM cte3
UNION ALL
SELECT DISTINCT EmployeeID FROM cte4
)
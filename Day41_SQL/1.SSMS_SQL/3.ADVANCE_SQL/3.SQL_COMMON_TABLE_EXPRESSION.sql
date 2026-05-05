

/*
A Common Table Expression (CTE) in SQL is a temporary result set that you can reference within a 
SELECT, INSERT, UPDATE, or DELETE statement. CTEs are defined using the WITH keyword, 
and they can make complex queries easier to write, understand, and maintain by breaking them into simpler parts.
*/

SELECT * FROM Employees

SELECT * INTO #temp1 FROM Employees

SELECT * FROM #temp1;

---Example 1 : CTE

With CTE AS (
SELECT * FROM #temp1
)
SELECT * FROM cte;

--Example 2 :

with Test_CTE as (
SELECT employeeid,firstname FROM #temp1 WHERE EmployeeID in (2,4)
)
SELECT * FROM test_cte;

--Example 3
DROP TABLE IF EXISTS #temp2;

with [Comm Table Expression] AS (
SELECT * FROM #temp1 WHERE EmployeeID IN (1,2,3)
)
SELECT * INTO #temp2 FROM [Comm Table Expression]
SELECT * FROM #temp2;

-- OR

WITH CommTableExpression AS
(
    SELECT * 
    FROM #temp1 
    WHERE EmployeeID IN (1,2,3)
)

SELECT * INTO #temp2
FROM CommTableExpression;

SELECT * FROM #temp2;

--Example 4 :

with CTE_1 AS (
SELECT * FROM #temp1 WHERE EmployeeID in (2,4,6)
)
UPDATE #temp1 set employeeid = 101 WHERE employeeid IN (SELECT DISTINCT employeeid FROM cte_1)

--
SELECT * FROM #temp1;


--Example 5 :

with cte_2 AS (
SELECT * FROM #temp1 WHERE EmployeeID = 1
)
DELETE FROM #temp1 WHERE EmployeeID in (SELECT DISTINCT employeeid FROM cte_2)
SELECT * FROM #temp1;

--Example 6 :

with cte_3 as (
SELECT * FROM #temp1 WHERE EmployeeID in (101)
)
INSERT INTO #temp1 SELECT * FROM cte_3
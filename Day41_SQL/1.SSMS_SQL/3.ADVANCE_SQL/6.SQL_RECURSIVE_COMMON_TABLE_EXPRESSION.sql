

--Recursive CTE
--Factorial of a given number (5)

with [R CTE] AS (
--Anchor Query
SELECT 1 AS n
UNION ALL
--Recursive Query
SELECT n+1 FROM [R CTE] WHERE n<=4
)
select exp(sum(log(n))) [Factorial] from [R CTE];

-----------
--3*2*1
--5*4*3*2*1


----------------

with [R CTE] AS (
--Anchor Query
SELECT 1 AS n
UNION ALL
--Recursive Query
SELECT n+1 FROM [R CTE] WHERE n<=4
)
select * from [R cte]
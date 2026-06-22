-- Recursive CTE

/*
A Recursive CTE (Common Table Expression) is a temporary result set in SQL that refers to itself to repeatedly execute and build a result until a termination condition is met.

It is primarily used to query hierarchical or sequential data such as organizational charts, category trees, graph paths, or number sequences.

Key Parts –

Anchor Member – runs once, sets the starting data.

Recursive Member – references the CTE itself to fetch the next level.

UNION ALL – combines anchor + recursive results.

Termination Condition – recursion stops when no new rows are returned.

*/


/*

WITH RECURSIVE cte_name (columns) AS (
    -- Anchor member (base result)
    SELECT ...
    FROM ...
    WHERE condition

    UNION ALL

    -- Recursive member (refers to itself)
    SELECT ...
    FROM table t
    JOIN cte_name c ON ...
)
SELECT * FROM cte_name;

*/
USE rough;


WITH RECURSIVE numbers AS (
	SELECT 1 AS num         -- Anchor
    
    UNION ALL 
    
    SELECT num+1           -- Recursive
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;     -- Main Query



-- Workflow Visualization

/*
Start
  ↓
Run Anchor Member → Store result (Iteration 0)
  ↓
Run Recursive Member with previous iteration data (0)
  ↓
New rows found? → Yes → Add to result & repeat
  ↓
If no new rows → Stop
  ↓
Return final result
*/

-- E2

WITH RECURSIVE factorial_cte (n, fact) AS (
    SELECT 1, 1      -- Anchor: factorial of 1 = 1

    UNION ALL

    SELECT n + 1, fact * (n + 1)
    FROM factorial_cte
    WHERE n < 6
)
SELECT * FROM factorial_cte;



# Example - 1

SELECT * FROM employee;

-- Manager - Team Lead - Employee - Intern


WITH RECURSIVE employee_hierarchy AS (
    -- Anchor: start from a CEO
    SELECT eId, empName, reportsTo
    FROM employee
    WHERE reportsTo IS NULL   -- CEO / top manager

    UNION ALL

    -- Recursive: get subordinates
    SELECT e.eId, e.empName, e.reportsTo
    FROM employee e
    JOIN employee_hierarchy eh
        ON e.reportsTo = eh.eId
)
SELECT * FROM employee_hierarchy;



# Example - 2

SELECT * FROM orderss;

WITH RECURSIVE order_process AS (
    -- Start with first order
    SELECT custId, orderAmount
    FROM orderss
    WHERE custId = 10104

    UNION ALL

    -- Add next order one by one
    SELECT o.custId, o.orderAmount
    FROM orderss o
    JOIN order_process p ON o.custId = p.custId + 1
    WHERE o.custId < 10159
),
running_total AS (
    SELECT
        custId,
        orderAmount,
        SUM(orderAmount) OVER (ORDER BY custId) AS running_sum
    FROM order_process
)
SELECT * FROM running_total;

-- INTERVIEW QUESTION
/*

-- Basic-Level

1. What is a CTE in SQL?

- A CTE (Common Table Expression) is a temporary named result set created using the WITH clause. 
It exists only for the duration of the query and helps make complex SQL queries more readable and maintainable.

2. Why do we use CTEs instead of subqueries?

- CTEs are used instead of subqueries because they:
- Improve readability
- Allow reuse of the same logic multiple times
- Make debugging easier
- Support recursive queries, which subqueries cannot handle cleanly

3. What is the difference between a CTE and a derived table?
           CTE	                                                  Derived Table
   Defined using WITH	                                       Defined inside FROM
   Can be referenced multiple times	                           Used only once
   More readable	                                           Harder to read
   Supports recursion	                                       oes not support recursion.
   
4. Can we use multiple CTEs in a single query?

- Yes.
You can define multiple CTEs separated by commas in one WITH clause, and they can even reference 
each other.


Intermediate-Level

5. What is a recursive CTE and how does it work?

- A recursive CTE is a CTE that references itself. It works by:
Running the anchor query once
Running the recursive query repeatedly
Stopping when no new rows are returned
It is mainly used for hierarchical or sequential data.

6. What are the key components of a recursive CTE?

A recursive CTE has:
- Anchor Member – starting point
- Recursive Member – refers to the CTE itself
- UNION ALL – combines anchor and recursive results
- Termination condition – stops recursion

7. What is the purpose of the anchor member in a recursive CTE?

The anchor member:
Executes first
Provides the initial dataset
Defines where recursion starts
Without it, recursion cannot begin.

8. What is the role of UNION ALL in a recursive CTE?

UNION ALL:
- Combines anchor and recursive results
- Allows duplicate rows
- Performs faster than UNION
- It is mandatory in recursive CTEs.


Advanced-Level

9. Can a recursive CTE call itself more than once?

- No.
A recursive CTE can reference itself only once in the recursive part. Multiple self-references cause an error.

10. What happens if we use UNION instead of UNION ALL in a recursive CTE?

Using UNION:
- Removes duplicates
- Adds extra overhead
- Can slow down recursion
- May lead to unexpected termination

👉 Best practice: Always use UNION ALL

11. Can you write a recursive CTE without an anchor member? Why not?

- No.
- Without an anchor member:
- There is no starting point
- SQL cannot initialize recursion
 Query results in an error

👉 Anchor member is mandatory.

*/

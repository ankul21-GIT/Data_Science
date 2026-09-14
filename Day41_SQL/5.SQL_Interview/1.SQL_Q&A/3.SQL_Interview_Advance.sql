-- Q53. Retrieve the departments where the total salary expenditure exceeds the average total salary expenditure across all departments.
-- Answer :
SELECT department_id 
FROM employees 
GROUP BY department_id
HAVING SUM(salary) > (
    SELECT AVG(total_salary) 
    FROM (
        SELECT department_id, SUM(salary) as total_salary 
        FROM employees 
        GROUP BY department_id
    ) AS subquery
);


-- Q54. Find the employee with the third highest salary without using the LIMIT clause.
-- Answer :
SELECT name, salary 
FROM employees e1 
WHERE 2 = (
    SELECT COUNT(DISTINCT e2.salary) 
    FROM employees e2 
    WHERE e2.salary > e1.salary
);


-- Q55. Identify departments that have less than the company-wide median number of employees.
-- Answer :
SELECT department_id 
FROM employees 
GROUP BY department_id
HAVING COUNT(id) < (
    SELECT AVG(employee_count) 
    FROM (
        SELECT department_id, COUNT(id) as employee_count 
        FROM employees 
        GROUP BY department_id
    ) AS subquery
);


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


-- Q56. Get the most common job title among employees who earn above the company average.
-- Answer :
SELECT job_title 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees)
GROUP BY job_title 
ORDER BY COUNT(*) DESC 
LIMIT 1;


-- Q57. Identify employees who earn more than the average salary in both their department and the company.
-- Answer :
SELECT id, name, salary 
FROM employees e1 
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e1.department_id
) 
AND salary > (
    SELECT AVG(salary) 
    FROM employees
);


-- Q58. Retrieve the month (in numbers) with the highest total sales from a table of daily sales.
-- Answer :
SELECT MONTH(date) as sales_month 
FROM sales 
GROUP BY MONTH(date) 
ORDER BY SUM(amount) DESC 
LIMIT 1;


-- Q59. Get the department that has the maximum difference between the highest and lowest salaries.
-- Answer:
SELECT department_id, (MAX(salary) - MIN(salary)) as salary_difference 
FROM employees 
GROUP BY department_id 
HAVING salary_difference = (
    SELECT MAX(max_salary - min_salary) 
    FROM (
        SELECT department_id, MAX(salary) as max_salary, MIN(salary) as min_salary 
        FROM employees 
        GROUP BY department_id
    ) AS subquery
);


-- Q60. Find the employee who earns the median salary in each department.**
-- Answer :
SELECT e1.department_id, e1.name, e1.salary 
FROM employees e1
WHERE (
    SELECT COUNT(*) 
    FROM employees e2 
    WHERE e2.department_id = e1.department_id AND e2.salary <= e1.salary
) = (
    SELECT COUNT(*) 
    FROM employees e3 
    WHERE e3.department_id = e1.department_id AND e3.salary >= e1.salary
);
 

-- Q61. Retrieve employees who earn more than their respective department's median salary.
-- Answer :
SELECT e1.name, e1.salary, e1.department_id
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(salary) 
    FROM (
        SELECT salary 
        FROM employees e2 
        WHERE e2.department_id = e1.department_id 
        ORDER BY salary 
        LIMIT 2 - (SELECT COUNT(*) FROM employees e3 WHERE e3.department_id = e1.department_id) MOD 2 
        OFFSET (SELECT (COUNT(*) - 1) / 2 FROM employees e4 WHERE e4.department_id = e1.department_id)
    ) AS median_subquery
);


-- Q62. Identify the departments where the minimum salary is greater than the maximum salary of at least one other department.
-- Answer :
SELECT DISTINCT e1.department_id 
FROM employees e1 
WHERE e1.salary = (
    SELECT MIN(salary) 
    FROM employees 
    WHERE department_id = e1.department_id
) 
AND e1.salary > ANY (
    SELECT MAX(salary) 
    FROM employees 
    GROUP BY department_id
);



















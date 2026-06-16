USE rough;

SELECT * FROM orderss;
SELECT * FROM product;
SELECT * FROM payments;
SELECT * FROM customers;

-- order id 10100

SELECT * FROM orderss WHERE orderNumber = 10100;

SELECT * FROM customers WHERE custID = 363;

/*
In SQL, a Subquery (also known as an inner query or nested query) is a query within another query. It
is enclosed in parentheses and can be used in SELECT, INSERT, UPDATE, or DELETE statements.
Subqueries help perform complex queries by breaking them into smaller, more manageable parts.

Types of Subqueries:

Single-Row Subquery
Multi-Row Subquery
Multi-Column Subquery
Correlated Subquery
Nested Subquery
Scalar Subquery
Inline View
*/

/*
Single-Row Subquery

Definition: Returns only one row and one column as the result.
Usage: Typically used with operators like =,<,>,<=,>=, and <>.

*/


SELECT salary
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);


-- Get customer who spent more than the average order value.

SELECT AVG(orderAmount) AS avgAmount FROM orderss;


SELECT custID FROM orderss WHERE orderAmount > 2694;


SELECT * FROM customers WHERE custID IN (363, 141, 131);

SELECT custID FROM orderss WHERE orderAmount > (SELECT AVG(orderAmount) AS avgAmount FROM orderss);

/*
Multi-Row Subquery

Returns multiple rows from one column.
Used with operators like IN, ANY, ALL
*/

SELECT name
FROM employee
WHERE department_id IN (SELECT department_id FROM departments
WHERE location = 'New York');

-- Find the products bought in order by customers with gmail address.

SELECT custID,custEmail FROM customerS WHERE custEmail LIKE '%@gmail.com';

SELECT * FROM orderss WHERE custID IN (SELECT custID FROM customers WHERE custEmail LIKE '%@gmail.com');



SELECT
    productCode
FROM
    orderdetails
WHERE
    orderNumber IN (
        SELECT
            orderNumber
        FROM
            orders
        WHERE
            custId IN (
                SELECT
                    custId
                FROM
                    customers
                WHERE
                    custEmail LIKE '%@gmail.com'
            )
    );


/*

Multi-Column Subquery

Returns more than one column.
Usually used in IN or as a set of columns for comparison.

*/

SELECT * FROM orderdetails 
WHERE (productCode, quantityOrdered) IN 
(SELECT productCode, quantityOrdered FROM orderdetails WHERE orderNumber = 10100);
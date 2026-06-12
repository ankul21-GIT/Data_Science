-- AGGREGATE FUNCTION
/*
Common Aggregate Functions

SUM() – Returns the total sum of a numeric column.
AVG() – Returns the average value of a numeric column.
COUNT() – Returns the number of rows that match the query.
MAX() – Returns the maximum value in a column.
MIN() – Returns the minimum value in a column.
GROUP_CONCAT() (MySQL specific) – Concatenates values from a group into a single string.

*/

CREATE TABLE casess;

USE cases;


CREATE TABLE employeess (
   employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    salary INT,
    email VARCHAR(100),
    officeCode INT,
    reportsTo INT,
    levels VARCHAR(30)
);

INSERT INTO employeess 
(employeeNumber, lastName, firstName, salary, email, officeCode, reportsTo, levels)
VALUES
(1002, 'Murphy', 'Diane', 20502, 'dmurphy@classicmodelcars.com', 1, NULL, NULL),
(1056, 'Patterson', 'Mary', 13443, 'mpatterson@classicmodelcars.com', 1, 1002, NULL),
(1076, 'Firell', 'Jeff', 14712, 'jfirell@classicmodelcars.com', 1, 1002,NULL),
(1088, 'Patterson', 'William', 33031, 'wpatterson@classicmodelcars.com', 6, 1056, NULL),
(1102, 'Bondur', 'Gerard', 12519, 'gbondur@classicmodelcars.com', 4, 1056, NULL),
(1143, 'Bow', 'Anthony', 13000, 'abow@classicmodelcars.com', 1, 1056,NULL),
(1165, 'Jennings', 'Leslie', 12950, 'ljennings@classicmodelcars.com', 1, 1143, NULL),
(1166, 'Thompson', 'Leslie', 5246, 'lthompson@classicmodelcars.com', 2, 1143, NULL),
(1188, 'Firrell', 'Julie', 36880, 'jfirrell@classicmodelcars.com', 2, 1143, NULL),
(1216, 'Patterson', 'Steve', 18161, 'spatterson@classicmodelcars.com', 2, 1143, NULL),
(1286, 'Tseng', 'Foon Yue', 29666, 'ftseng@classicmodelcars.com', 3, 1143, NULL),
(1323, 'Vanauf', 'George', 43346, 'gvanauf@classicmodelcars.com', 3, 1143, NULL);

SELECT * FROM employeess;

SELECT SUM(salary) AS total_salary FROM employeess GROUP BY departments;

SELECT AVG(salary) FROM employees;

SELECT COUNT(*) FROM employee WHERE salary > 50000;


SELECT MAX(salary) FROM employees;

SELECT MIN(salary) FROM employees;

SELECT GROUP_CONCAT(empname) FROM employees;

SELECT * FROM orders WHERE orderdate > '23-01-06';

SELECT COUNT(*) orders WHERE orderdate > '23-01-06';


SELECT COUNT(*) FROM orders WHERE orderdate BETWEEN '2003-10-06' AND '2004-10-06';


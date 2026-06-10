-- CASE STATEMENTS -> The CASE statement is used for conditional logic, similar to IF-ELSE in programming languages.

/*
SYNTAX

CASE case_value
WHEN condition THEN result1
WHEN condition THEN result2

...
Else result
END CASE;
*/

CREATE DATABASE cases;

USE cases;


CREATE TABLE employees (
    employeeNumber INT PRIMARY KEY,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    salary INT,
    email VARCHAR(100),
    officeCode INT,
    reportsTo INT,
    levels VARCHAR(30)
);


INSERT INTO employees 
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


SELECT * FROM employees;

SELECT
	salary,
    CASE
		WHEN salary > 20000 THEN 'HIGH'
        WHEN salary > 10000 THEN 'MEDIUM'
        ELSE 'LOW'
	END AS 'Range'
FROM employees;

-- UPDATE

UPDATE employees SET level = ( CASE
		WHEN salary > 20000 THEN 'HIGH'
        WHEN salary > 10000 THEN 'MEDIUM'
        ELSE 'LOW'
	END)


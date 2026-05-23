/*
UNION

It is used to combine the result-set of two or more SELECT statements.
Gives UNIQUE records.

To use it:

- Every SELECT should have the same number of columns

- Columns must have similar data types

- Columns in every SELECT should be in the same order

*/

CREATE DATABASE college;

USE college;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT

);


INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);


CREATE TABLE employees(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT

);


INSERT INTO employees
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "James", NULL),
(104, "Smith", 103);

SELECT * FROM employee;

SELECT * FROM employees;

SELECT name FROM employee
UNION
SELECT name FROM employees;


-- UNION ALL -> Union all allow all the duplicate value.

SELECT name FROM employee
UNION ALL
SELECT name FROM employees;

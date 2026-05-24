/*
VIEW - A view is a virtual table based on the result-set of an SQL statements.
*/

CREATE DATABASE college;

USE college;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    mark INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);


INSERT INTO student
(rollno, name, mark, grade, city)
VALUES
(101, 'Anil', 78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emaneul', 92, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi');


SELECT * FROM student;

-- Creating a view virtual table.

CREATE VIEW view1 AS
SELECT rollno, name, mark FROM student;

SELECT * FROM view1;


SELECT * FROM view1
WHERE mark > 90;


-- How to drop view table.

DROP VIEW view1;





-- -- Rough work --------

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    mark INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);


INSERT INTO student
(rollno, name, mark, grade, city)
VALUES
(101, 'Anil', 78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emaneul', 92, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi');


SELECT * FROM student;

-- VIEW 

CREATE VIEW temp1 AS
SELECT rollno, name FROM student;

SELECT name FROM temp1;

SELECT MAX(mark) FROM temp1;

CREATE VIEW temp2 AS
SELECT mark FROM student;

SELECT name, mark
FROM student
WHERE mark = (SELECT MAX(mark) FROM student);

SELECT name, MAX(mark)
FROM student
GROUP BY name;


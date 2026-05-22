/*
-- LEFT AND RIGHT EXCLUSIVE JOIN

1. LEFT EXCLUSIVE JOIN -> Return only the rows from the LEFT table that have NO matching rows in the RIGHT table.
*/

CREATE DATABASE college;

USE college;


CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);


INSERT INTO student
(id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");


CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)

);

INSERT INTO course
(id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");



SELECT * FROM student;

SELECT * FROM course;

-- LEFT EXCLUSIVE JOIN

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL;

-- Using alias

SELECT * 
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
WHERE c.id IS NULL;


-- RIGHT EXCLUSIVE JOIN  -> Return only the rows from the RIGHT table that have NO matching rows in the LEFT table.

SELECT * 
FROM student
RIGHT JOIN course 
ON student.id = course.id
WHERE student.id IS NULL;

-- Using alias

SELECT * 
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id
WHERE s.id IS NULL;



-- FULL EXCLUSIVE JOIN - It show only left and right side table it don't show common data in a table.

SELECT *
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL
UNION
SELECT *
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;







-- -- Rough Work ---- 

USE joins;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);


INSERT INTO student
(id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");


CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)

);

INSERT INTO course
(id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(107, "computer science");


SELECT * FROM student;

SELECT * FROM course;

-- LEFT EXCLUSIVE JOIN

SELECT *
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL;

-- Using alias

SELECT *
FROM student AS s
LEFT JOIN course AS c
ON s.id = c.id
WHERE c.id IS NULL;


-- RIGHT EXCLUSIVE JION

SELECT *
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;


-- Using Alias

SELECT *
FROM student AS s
RIGHT JOIN course AS c
ON s.id = c.id
WHERE s.id IS NULL;


-- FULL EXCLUSIVE JOIN

SELECT *
FROM student
LEFT JOIN course
ON student.id  = course.id
WHERE course.id IS NULL
UNION
SELECT *
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;
/*
JOIN IN SQL ->  Join is used to combine a rows from two or more table, based on related column between them.

- Types of JOIN
1. INNER JOIN 
2. LEFT JOIN
3. RIGHT JOIN
4. FULL JOIN


-- INNER JOIN -> Return records that have matching values in both tables.

-- SELECT column(s)
-- FROM tableA
-- INNER JOIN tableB
-- ON tableA.col_name = tableB.col_name;
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


SELECT * FROM
student
INNER JOIN course
ON student.id = course.id;


-- alias as a(alias method)

SELECT * FROM
student as s
INNER JOIN course as c
ON s.id = c.id;




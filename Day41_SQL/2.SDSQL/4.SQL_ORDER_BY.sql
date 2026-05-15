-- ORDER BY

-- ASC = Ascending Order -> 1,2,3,4,5...
-- DESC = Descending Order -> 1,2,3,4,5..

CREATE DATABASE college;

USE college;

CREATE TABLE student(	
	rollno INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(50)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, 'Anil', 78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emaneul', 12, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi');

SELECT * FROM student;


-- ASC Order
SELECT * 
FROM student
ORDER BY city ASC;


-- DESC

SELECT *
FROM student
ORDER BY marks DESC;


SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3;




-- ------- ROUGH WORK--------------------------

CREATE TABLE student(	
	rollno INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(50)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, 'Anil', 78, 'C', 'Pune'),
(102, 'Bhumika', 93, 'A', 'Mumbai'),
(103, 'Chetan', 85, 'B', 'Mumbai'),
(104, 'Dhruv', 96, 'A', 'Delhi'),
(105, 'Emaneul', 12, 'F', 'Delhi'),
(106, 'Farah', 82, 'B', 'Delhi');

SELECT * FROM students;


SELECT *
FROM students
ORDER BY city ASC;


SELECT * 
FROM students
ORDER BY mark ASC;


SELECT * 
FROM students
ORDER BY mark DESC;


SELECT *
FROM students
ORDER BY name DESC;

-- Find top 3 student marks

SELECT *
FROM students
ORDER BY mark DESC LIMIT 3;







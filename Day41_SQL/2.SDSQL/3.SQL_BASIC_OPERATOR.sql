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

SELECT name, marks FROM student;

SELECT city FROM student;

SELECT DISTINCT city FROM student;

-- WHERE Clause - Filter the table

SELECT * FROM student WHERE marks > 80;

-- OR

SELECT * 
FROM student 
WHERE marks > 80;


SELECT * 
FROM student 
WHERE marks > 80 AND city = 'Mumbai';


-- Arithmatic Operator
SELECT * 
FROM student
WHERE marks+10 > 100;


-- Comparison Operator
SELECT * 
FROM student
WHERE marks = 93;


-- AND Operator

SELECT * FROM student WHERE marks > 90 AND city = 'Mumbai';

SELECT * FROM student WHERE marks > 101 OR city = 'Mumbai';


-- OR Operator

SELECT * 
FROM student 
WHERE marks > 90 OR city = 'Mumbai';


-- BETWEEN OPERATOR
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;


-- IN Operator
SELECT * FROM student WHERE city IN ('Delhi','Mumbai');


-- NOT IN Operator
SELECT * FROM student WHERE city NOT IN ('Mumbai','Delhi');


-- LIMIT Operator
SELECT * FROM student LIMIT 3;


SELECT * 
FROM student 
WHERE marks> 75
LIMIT 3;




-- ----------------------------- ROUGH WORK --------------


CREATE TABLE students(
	rollno INT PRIMARY KEY,
    name VARCHAR(20),
    mark INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
    
);

INSERT INTO students
(rollno, name, mark, grade, city)
VALUES
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "delhi");

SELECT * FROM students;


SELECT name, mark FROM students;

SELECT city FROM students;

SELECT DISTINCT city FROM students;

-- WHERE 

SELECT * FROM students WHERE mark > 80;

SELECT * 
FROM students 
WHERE mark > 80;


SELECT * FROM students WHERE city = "Mumbai";

SELECT * 
FROM students 
WHERE city = "Mumbai" AND mark > 90;

-- Addition Operator(Addition)

SELECT * 
FROM students
WHERE mark+10 > 100;

-- Comparison Oprator(Equal To)

SELECT * 
FROM students
WHERE mark = 93;

-- AND Operator 

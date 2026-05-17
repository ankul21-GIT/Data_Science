-- TABLE REALTED Queries 

-- UPDATE -> To update the existing rows

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

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET grade = "O"
WHERE grade = "A";


UPDATE student
SET marks = 82
WHERE rollno = 105;

-- Update students grade B where marks is between 80 to 90

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student;

-- Add 1 marks for every students

UPDATE student
SET marks = marks + 1;


-- DELETE Method -> (To delete the existing rows)

UPDATE student
SET marks = 12
WHERE rollno = 105;

SELECT * FROM student;


DELETE FROM student
WHERE marks > 33;



DELETE FROM student
WHERE marks < 33;

SELECT * FROM student;





-- ------- ROUGH WORK -----------------------------

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

UPDATE student
SET grade = "O"
WHERE grade = "A";
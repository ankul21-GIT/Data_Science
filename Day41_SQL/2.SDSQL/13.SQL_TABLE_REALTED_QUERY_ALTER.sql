-- Table Related Queries
-- ALTER(To change the schema)

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


-- How to ADD COLUMN
ALTER TABLE student
ADD COLUMN age INT;

-- How to DELETE COLUMN
ALTER TABLE student
DROP COLUMN age;


-- how to add a culumn
ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 22;

SELECT * FROM student;

-- how to modify a culumn
ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, stu_age)
VALUES
(107, 'Gargi', 68, 100);

ALTER TABLE student
CHANGE age stu_age INT;

SELECT * FROM student;


-- DROP COLUMN

ALTER TABLE student
DROP COLUMN stu_age;

SELECT * FROM student;

-- how to rename the table

ALTER TABLE student
RENAME TO stu;

ALTER TABLE stu
RENAME TO student;

-- 
SELECT * FROM student;


-- TRUNCATE table -> it delete only the data not the structure of the data

TRUNCATE TABLE student;

DROP DATABASE college;



-- Practice Qs 

-- Qs: In the student table:

-- a. Change the name of column "name" to "full_name".

ALTER TABLE student
CHANGE name full_name VARCHAR(50);


-- b. Delete all the students who scored marks less than 80.

DELETE FROM student
WHERE marks < 80;


-- c. Delete the column for grades.
ALTER TABLE student
DROP COLUMN grade;


SELECT * FROM student;


SET SQL_SAFE_UPDATES = 0;




-- ---- Rough Work ---------------

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

-- ALTER TABLE

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;


SELECT * FROM student;


-- DROP COLUMN

ALTER TABLE student
DROP COLUMN age;

SELECT * FROM student;

-- MODIFY COLUMN

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, grade, city, age)
VALUES
(107, "Gargi", 99, "A", "Noida", "33");

SELECT * FROM student;


-- CHANGE COLUMN NAME

ALTER TABLE student
CHANGE age stu_age INT;

SELECT * FROM student;

ALTER TABLE student
CHANGE stu_age age INT;

SELECT * FROM student;

-- RENAME CHANGE TABLE NAME

ALTER TABLE student
RENAME stu;

ALTER TABLE stu
RENAME student;


ALTER TABLE student 
DROP COLUMN age;

-- TRUNCATE - Delete the data not a structure of table.

TRUNCATE TABLE student;

SELECT * FROM student;

-- Q1 - Change name into full name.

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(20); 

SELECT * FROM student;

-- Q2 - Delete all the student who score marks less than 80.
SET SQL_SAFE_UPDATES = 0;

DELETE FROM student
WHERE marks < 80;

SELECT * FROM student;

-- Q3 - Delete column for grade.

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;
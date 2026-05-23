-- SQL SUBQURIES

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

 /*
 Get name of the all students who scored more than class average.
 
 STEP 1 -> Find the average marks
 STEP 2 -> Find the name of the student who score greater than the average mark.
 
 */
 
SELECT AVG(mark) 
FROM student;


SELECT name, mark
FROM student
WHERE mark > 87.6667;


SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);


 -- Find the even rollno
 -- Find the name of the student who have even roll no.
 
SELECT * FROM student
WHERE rollno % 2 = 0;


SELECT name, rollno
FROM student
WHERE rollno % 2 = 0; 

     -- OR
     
SELECT rollno, name
FROM student
WHERE rollno IN (102, 104, 106);


SELECT name, rollno
FROM student
WHERE rollno IN(
	SELECT rollno
    FROM student
    WHERE rollno % 2 = 0);
    
    
    
/*
Find the maximum marks from the student of Delhi.
Step 1 -> Find the student of Delhi.
Step 2 -> Find their maximum marks using the sublist in step 1.

*/

SELECT * 
FROM student
WHERE city = "Delhi";

SELECT MAX(marks)
FROM student
WHERE city = 'Delhi';

-- Maximum mark

SELECT MAX(mark) 
FROM (SELECT * FROM student WHERE city = "Delhi") AS temp;




-- Rough Work

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



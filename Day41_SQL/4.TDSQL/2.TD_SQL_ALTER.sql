CREATE DATABASE school;

USE school;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL,
    course VARCHAR(50)

);

INSERT INTO student
(id, name, age, course)
VALUES
(1, 'Kanha', 26, 'DSA');

SELECT * FROM student;

-- How to add column

ALTER TABLE student 
ADD COLUMN rollno INT;

ALTER TABLE student 
ADD COLUMN fathername INT;

-- How to delete column

ALTER TABLE student
DROP fathername;

-- Rename a column

ALTER TABLE student
RENAME COLUMN rollno TO rollnumber;

SELECT * FROM student;

RENAME TABLE student TO college;


RENAME TABLE college TO student;







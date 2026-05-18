CREATE DATABASE college;

USE college;

CREATE TABLE student(	
	rollno INT PRIMARY KEY,
    name VARCHAR(20),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(50)
);


CREATE TABLE dept(	
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE TEACHER(	
	id INT PRIMARY KEY,
    name VARCHAR(20),
    dept_id INT,
    city VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES dept(id)
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
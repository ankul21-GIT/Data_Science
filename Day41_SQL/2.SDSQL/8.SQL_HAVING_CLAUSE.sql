-- HAVING Cluase

-- Similar to where i.e. applies some condition on rows.alter
-- Used when we want to apply any condition after grouping.alter

-- Count the number of students in each city where max marks cross.alter

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


SELECT city , COUNT(rollno)
FROM student
GROUP BY city;


SELECT city , COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 90
ORDER BY city ASC;


SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 93;



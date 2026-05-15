-- Aggregate Function

-- Aggregate function perform a calculation on set of value, and return a single value.

-- COUNT
-- MAX
-- MIN
-- SUM
-- AVG

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

-- MAX
SELECT MAX(marks) FROM student;

-- MIN
SELECT MIN(marks) FROM student;

-- AVG
SELECT AVG(marks) FROM student;

-- COUNT
SELECT COUNT(rollno) FROM student;

SELECT COUNT(grade) FROM student;


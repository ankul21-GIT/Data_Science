-- GROUP BY Clause

-- Group row that have the same value into summary rows.
-- It collect data from multiple record and groups the result by one or more column.

-- Generally we use GROUP BY with some aggreagate function.

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

-- GROUP BY

SELECT city 
FROM student
GROUP BY city;


SELECT city, COUNT(name)
FROM student
GROUP BY city;


SELECT city, name, COUNT(rollno)
FROM student
GROUP BY city, name;


SELECT name, COUNT(rollno)
FROM student
GROUP BY name;


-- Find the average marks of the city.

SELECT city, AVG(marks)
FROM student
GROUP BY city;


-- Write a query to find the average marks in each city in ascending order.

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city;


-- Write the query to find average marks in each city in ascending order.

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city DESC;


SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks);


SELECT grade
FROM student
GROUP BY grade;


SELECT grade, COUNT(rollno)
FROM student
GROUP BY grade
ORDER BY grade;
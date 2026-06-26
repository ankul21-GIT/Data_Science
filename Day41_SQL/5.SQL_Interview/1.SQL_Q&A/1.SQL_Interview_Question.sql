-- Here are 100+ MySQL interview questions with their answers, ranging from basic to more intermediate topics:


-- Q1. How do you create a new database in MySQL?
-- Answer

CREATE DATABASE database_name;


-- Q2. How do you create a new table in MySQL?

CREATE TABLE table_name (
    column1 datatype1,
    column2 datatype2,
    ...
);


-- Q3. How do you insert values into a table?
-- Answer:
INSERT INTO table_name (column1, column2, ...)
VALUES (value1, value2, ...);

-- Q4. How do you retrieve all the columns from a table?
-- Answer:
SELECT * FROM table_name;


-- Q5. How can you retrieve specific columns from a table?
-- Answer:
SELECT column1, column2 
FROM table_name;


-- Q6. What is the use of the WHERE clause?
-- Answer : To filter records based on specific conditions.


-- Q7. How would you fetch data from a table where the age is greater than 25?
-- Answer:
SELECT * FROM table_name WHERE age > 25;


-- Q8. What are the different types of SQL JOINs?
-- Answer : INNER JOIN, LEFT (or LEFT OUTER) JOIN, RIGHT (or RIGHT OUTER) JOIN, and FULL (or FULL OUTER) JOIN.


-- Q9. Write a SQL query to join two tables: `students` and `courses`, assuming each student is enrolled in a course and they share a common column `course_id`.
-- Answer:
SELECT * FROM students 
INNER JOIN courses 
ON students.course_id = courses.course_id;





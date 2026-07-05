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


-- Q10. What is the difference between the `HAVING` clause and the `WHERE` clause?
-- Answer : `WHERE` filters records before aggregating in `GROUP BY`, whereas `HAVING` filters after aggregation.


-- Q11. How would you list the number of students enrolled in each course, but only display courses with more than 5 students?
-- Answer:
SELECT course_id, COUNT(student_id) as number_of_students 
FROM enrollments 
GROUP BY course_id 
HAVING number_of_students > 5;


-- Q12. What is the `LIKE` operator used for?
-- Answer : To search for a specified pattern in a column.


-- Q13. Write a SQL query to find all students whose names start with 'A'.
-- Answer :
SELECT * FROM students WHERE name LIKE 'A%';


-- Q14. How would you update a record in a table?
-- Answer :
UPDATE table_name 
SET column1 = value1, column2 = value2, ...
WHERE some_column = some_value;


-- Q15. How can you delete records from a table?
-- Answer : DELETE FROM table_name WHERE condition;


-- Q16. How do you drop a table?
-- Answer : DROP TABLE table_name;


-- Q17. What is the purpose of the `ALTER` table command?
-- Answer : To modify an existing table structure, such as adding, deleting, or modifying columns.


-- Q18. How would you add a new column `email` to the `students` table?
-- Answer : ALTER TABLE students ADD COLUMN email VARCHAR(255);

-- Q19. What does the `DISTINCT` keyword do in a SQL query?
-- Answer : It removes duplicate rows from the result set.


-- Q20. Write a query to find the total number of distinct courses from the `enrollments` table.
-- Answer :
SELECT COUNT(DISTINCT course_id) FROM enrollments;


-- Q21. What does the `EXISTS` operator do?
-- Answer : It tests for the existence of any record in a subquery.


-- Q22. Write a SQL query to find students who have enrolled in a course.
-- Answer :
SELECT student_id 
FROM students 
WHERE EXISTS (SELECT 1 FROM enrollments WHERE students.student_id = enrollments.student_id);


-- Q23. How can you concatenate columns in MySQL?
-- Answer : Using the `CONCAT()` function.


-- Q24. Write a query to get the full name of a student, given `first_name` and `last_name` columns.
-- Answer :
SELECT CONCAT(first_name, ' ', last_name) as full_name FROM students;


-- Q25. How do you find the total number of rows in a table?**
-- Answer :
SELECT COUNT(*) FROM table_name;


-- Q26. How can you fetch the first 5 records from a table?
-- Answer :
SELECT * FROM table_name LIMIT 5;


-- Q27. What is the difference between `CHAR` and `VARCHAR` data types?
-- Answer : `CHAR` is fixed-length while `VARCHAR` is variable-length.


-- Q28. How can you change the data type of a column?
-- Answer :ALTER TABLE table_name MODIFY column_name NEW_DATA_TYPE;




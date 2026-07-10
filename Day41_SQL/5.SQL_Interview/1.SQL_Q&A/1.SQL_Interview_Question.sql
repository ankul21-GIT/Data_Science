-- Here are MySQL interview questions with their answers, ranging from basic to more intermediate topics:


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


-- Q29. Write a SQL query to find the 3rd highest salary from a `salaries` table.
-- Answer :

SELECT DISTINCT salary 
FROM salaries 
ORDER BY salary DESC 
LIMIT 1 OFFSET 2;


-- Q30. How do you create a primary key in a table?
-- Answer : ALTER TABLE table_name ADD PRIMARY KEY (column_name);


-- Q31. What is a foreign key constraint, and why is it used?
-- Answer : A foreign key constraint establishes a link between two tables and ensures that records in one table correspond to records in another. It's used to maintain referential integrity in the database.


-- Q32. How can you add a foreign key constraint to an existing table?
-- Answer : ALTER TABLE table_name ADD FOREIGN KEY (column_name) REFERENCES other_table(other_column);


-- Q33. How can you retrieve the unique values from a column?
-- Answer :
SELECT DISTINCT column_name FROM table_name;


-- Q34. What is the difference between an `INNER JOIN` and a `LEFT JOIN`?
-- Answer : An `INNER JOIN` returns rows when there is a match in both tables, while a `LEFT JOIN` returns all rows from the left table and the matched rows from the right table. If there's no match, the result is `NULL` on the right side.


-- Q35. What is normalization, and why is it important?
-- Answer : Normalization is the process of organizing a database to reduce redundancy and ensure data integrity. It divides larger tables into smaller ones and establishes relationships between them using foreign keys.


-- Q36. Describe 1NF, 2NF, and 3NF in database normalization.
-- Answer : 
--      - 1NF (First Normal Form):** Each table has a primary key, and all attributes are atomic (no repeating groups or arrays).
--      - 2NF (Second Normal Form):** All non-key attributes are fully functionally dependent on the primary key.
--      - 3NF (Third Normal Form):** All attributes are functionally dependent only on the primary key.


-- Q37. What is a subquery, and how is it different from a JOIN?
-- Answer : A subquery is a query nested inside another query. A subquery can return data that will be used in the main query as a condition. A JOIN is used to combine rows from two or more tables based on a related column.


-- Q38. Write a query to find employees whose salary is above the average salary.
-- Answer :
SELECT employee_name, salary 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);


-- Q39. What is a stored procedure in MySQL?
-- Answer : A stored procedure is a precompiled group of SQL statements stored in the database. It can be invoked as needed.

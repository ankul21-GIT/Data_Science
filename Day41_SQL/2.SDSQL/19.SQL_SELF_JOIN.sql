/*
SELF JOIN -> It is the regular join but the table is joined with itself.

-- SELECT column(s)
-- FROM table as a
-- JOIN table as b
-- ON a.col_name = b.col_name;

*/


CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT

);


INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);


SELECT * FROM employee;


SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


-- Manager name

SELECT a.name AS manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;




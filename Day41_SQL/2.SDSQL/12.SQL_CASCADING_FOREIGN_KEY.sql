-- Cascading For Foreign Key

/** ON DELETE CASCADE -> When we create a foreign key using this option , it delete the refrencing rows in the 
child table when the refrenced rows is deleted in the parent table in which has a primary key.
**/

/** ON UPDATE CASCADE -> When we create a foreign key using UPDATE CASCADE the refrencing rows are update in 
the child table when the refrenced row is updated in the parent table which has a primary key.
**/


USE college;


CREATE TABLE dept(	
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, 'Englisg'),
(102, 'IT');

SELECT * FROM dept;


UPDATE dept
SET id = 111
WHERE id = 101;

CREATE TABLE teacher(	
	id INT PRIMARY KEY,
    name VARCHAR(20),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, 'Adam', 101),
(102, 'Eve', 102);

SELECT * FROM teacher;




-- ------------------- Rough Work --------------------
USE college;

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(20)
);


INSERT INTO dept
(id, name)
VALUES
(101, "English"),
(102, "IT");



CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(20),
    dept_id INT,
    FOREIGN KEY (id) REFERENCES dept(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO teacher
(id, name, dept_id)
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM dept;

SELECT * FROM teacher;

UPDATE dept
SET id = 103
WHERE id = 102;

UPDATE dept
SET id = 111
WHERE id = 101;

SELECT * FROM dept;

SELECT * FROM teacher;
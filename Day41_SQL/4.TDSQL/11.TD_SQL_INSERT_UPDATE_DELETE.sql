CREATE DATABASE school;

USE school;

CREATE TABLE studentinfo(
	rollno INT NOT NULL,
    name VARCHAR(50),
    age INT,
    class VARCHAR(50),
    city VARCHAR(50)
    
);


INSERT INTO studentinfo
(rollno, name, age, class, city)
VALUES
(1, 'Kanha', 26, '12th', 'Agra');

SELECT * FROM studentinfo;


INSERT INTO studentinfo
(rollno, name, age, class, city)
VALUES
(2, 'Rajiv', 26, '12th', 'Agra'),
(3, 'Ayush', 27, '11th', 'Ranchi'),
(4, 'Rjesh', 28, '10th', 'Bihar');


SELECT * FROM studentinfo;

-- UPDATE -> The UPDATE statement is used to modify the existing records in a table.

UPDATE studentinfo
SET city = 'Delhi';

SELECT * FROM studentinfo;

SET SQL_SAFE_UPDATES = 0;


UPDATE studentinfo
SET city = 'Agra', age = 27
WHERE rollno = 1;

SELECT * FROM studentinfo;

-- ------ -------------- ---------        -----------------
UPDATE studentinfo
SET city = 'Banglore'
WHERE rollno IN (1,2,4);

SELECT * FROM studentinfo;


-- DELETE -> The DELETE statement is used to delete existing records in a table.

DELETE FROM studentinfo
WHERE rollno = 4;

SELECT * FROM studentinfo;



DELETE FROM studentinfo
WHERE rollno = 3 AND age = 27;

SELECT * FROM studentinfo;








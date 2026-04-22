CREATE DATABASE [Sales Database]

USE [Sales Database]

--Creating Table1 & insertinting records in Table1
CREATE TABLE table1 (C1 INT, C2 NVARCHAR(MAX))
INSERT INTO table1 VALUES (1,'A'),
(1,'B'),
(2,'C'),
(NULL,'D'),
(3,'E'),
(7,'DA')

--Creating Table2 & insertinting records in Table2
CREATE TABLE table2 (C1 INT, C3 NVARCHAR(MAX))
INSERT INTO table2 VALUES (1,'XA'),
(2,'MB'),
(2,'NX'),
(NULL,'MO'),
(4,'XY'),
(5,'TF')


-- Practice

SELECT * FROM table1

SELECT * FROM table2


-- LEFT ANTI JOIN

SELECT * FROM table1 LEFT JOIN table2
ON table1.C1 = table2.C1
WHERE table2.C1 IS NULL


-- RIGHT ANTI JOIN

SELECT * FROM table1 RIGHT JOIN table2
ON table1.C1 = table2.C1
WHERE table1.C2 IS NULL


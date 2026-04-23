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


SELECT * FROM table1 a INNER JOIN table1 b
ON a.C1 = b.C1


SELECT a.C1,b.C2 FROM table1 a INNER JOIN table1 b
ON a.C1 = b.C1


SELECT a.C1,b.C2 FROM table1 a JOIN table1 b
ON a.C1 = b.C1
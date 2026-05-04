
CREATE DATABASE Test_Index

USE Test_Index

drop table if exists students
CREATE TABLE Students ( id int, name nvarchar(50), age int, gender varchar(20))

INSERT INTO Students VALUES
(1,'Raj',23,'M'),
(4,'Nitin',25,'M'),
(3,'Priya',21,'F'),
(2,'Nikita',20,'F'),
(5,'Monica',20,'F');

SELECT * FROM Students;

CREATE CLUSTERED INDEX ix_1 ON students (id);

DROP INDEX ix_1 ON students;

CREATE CLUSTERED INDEX ix_2 ON students (id DESC);

DROP INDEX ix_2 ON students;

CREATE CLUSTERED INDEX ix_3 ON students (gender DESC, age ASC);

DROP INDEX ix_3 on students;

CREATE NONCLUSTERED INDEX ix_1 ON students (gender DESC, age ASC)
drop index ix_1 ON students;


DROP INDEX ix_3 ON students;
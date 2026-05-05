CREATE TABLE Students ( id int, name nvarchar(50), age int, gender varchar(20))

INSERT INTO Students VALUES
(1,'Raj',23,'M'),
(4,'Nitin',25,'M'),
(3,'Priya',21,'F'),
(2,'Nikita',20,'F'),
(5,'Monica',20,'F');

SELECT * FROM Students


CREATE NONCLUSTERED INDEX ix_2 ON students (id)

CREATE NONCLUSTERED INDEX ix_1 ON students (gender desc, age asc)

DROP INDEX ix_2 ON students





--More than one non clustered index can exist while that is not the case with clustered index

--Clustered Index determines the physical order in which data is stored in a table while that is
--not the case with non clustered index

--Clustered index is faster than non clustered index because non clustered index needs to refer back to
--table if selected column is not present in it

=======


SELECT * FROM Students;

CREATE NONCLUSTERED INDEX ix_2 ON students (id);

CREATE NONCLUSTERED INDEX ix_1 ON students (gender desc, age asc);

DROP INDEX ix_2 ON students;





--More than one non clustered index can exist while that is not the case with clustered index

--Clustered Index determines the physical order in which data is stored in a table while that is
--not the case with non clustered index

--Clustered index is faster than non clustered index because non clustered index needs to refer back to
--table if selected column is not present in it

-- 2146a209 (Local)
--Non clustered index requires separate disc space for storage
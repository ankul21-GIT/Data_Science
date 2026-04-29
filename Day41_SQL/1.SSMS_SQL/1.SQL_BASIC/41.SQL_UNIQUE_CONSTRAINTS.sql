


--Unique Constraint
--It ensures that a column consists of unique values

--Case 1 : when the table already exists

ALTER TABLE test_unique
ADD UNIQUE (lastname)




--Case 2 : We need to create the table

CREATE TABLE test_unique (
SID INT UNIQUE,
age TINYINT not null,
firstname VARCHAR(256) not null UNIQUE,
lastname VARCHAR(256)
)


SELECT * FROM test_unique


INSERT INTO test_unique VALUES (1,22,'Mayank','Mehera')

INSERT INTO test_unique VALUES (1,24,'Rohit','Singh') --*****************

INSERT INTO test_unique VALUES (null,34,'Akhilesh','Jain')

INSERT INTO test_unique VALUES (null,54,'Nitin','Singh') --******************

TRUNCATE TABLE test_unique
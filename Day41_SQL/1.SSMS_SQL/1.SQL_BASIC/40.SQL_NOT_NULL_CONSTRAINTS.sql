

CREATE DATABASE constraints

USE constraints


--Constraints 
--Conditions that can be applied on columns of a table & these conditions are to be followed while
--inserting records into the table


--Not Null constraint

--Case 1 : We will have to create a new table
CREATE TABLE test_not_null ( 
EID INT not null,
age TINYINT,
firstname VARCHAR(256)
)


SELECT * FROM test_not_null


SELECT * FROM INFORMATION_SCHEMA.columns 
WHERE TABLE_NAME LIKE 'test_not_null'


INSERT INTO test_not_null VALUES (1,23,'Mayank')

INSERT INTO test_not_null VALUES (null,23,'Mayank')

INSERT INTO test_not_null VALUES (2,null,'Raj')


--Case 2 : the table already exists
--We want to make firstname column nullable

ALTER TABLE test_not_null
ALTER COLUMN firstname VARCHAR(256) not null


INSERT INTO test_not_null VALUES (21,34,null)

ALTER TABLE test_not_null
ALTER COLUMN age TINYINT not null

SELECT * FROM test_not_null
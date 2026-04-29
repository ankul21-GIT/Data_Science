
--Check Constraint
--It checks for certain condition that can be applied on the columns of a table, if this condition is not
--fulfilled, we will not be able to insert the records into the table

--Case 1 : Table doesn't exist

CREATE TABLE test_check (
EID INT,
firstname VARCHAR(256),
age TINYINT CHECK(age>=10)
)

SELECT * FROM test_check

INSERT INTO test_check VALUES (1,'Mayank','20')

INSERT INTO test_check VALUES (2,'Raj',9)

UPDATE test_check SET EID = 11 WHERE EID = 1

--Case 2 : Table exists

ALTER TABLE test_check
ADD CHECK (eid>5)

INSERT INTO test_check VALUES(3,'Nitin',34)

INSERT INTO test_check VALUES(30,'Nitin',34)

--Default Constraint
--This constraint to provide default values to columns

--Case 1 : The table does not exist

CREATE TABLE test_default (
EID INT DEFAULT 5,
firstname VARCHAR(256) DEFAULT 'Rohit',
lastname VARCHAR(256),
age TINYINT
)

SELECT * FROM test_default

INSERT INTO test_default VALUES(1,'Nitin','Jain',23)

INSERT INTO test_default(lastname,age) VALUES('Singh',34)

INSERT INTO test_default (lastname) VALUES('Grover')

--Case 2 : The table already exists

ALTER TABLE test_default
ADD DEFAULT 25 FOR age

INSERT INTO test_default (lastname) VALUES('Jain')

SELECT * FROM test_default
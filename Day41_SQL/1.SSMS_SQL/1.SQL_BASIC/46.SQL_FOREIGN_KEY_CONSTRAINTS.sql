

--Foreign Key Constraint

--Case 1 : When the new table has to be created
CREATE TABLE test_Primary_key (
ID INT PRIMARY KEY,
name VARCHAR(256)
)

INSERT INTO test_primary_key VALUES(1,'Mayank'),(2,'Raj'),(3,'Jayant')

SELECT * FROM test_Primary_key

CREATE TABLE test_foreign_key (
ID INT FOREIGN KEY REFERENCES test_primary_key(id),
course VARCHAR(256)
)

INSERT INTO test_foreign_key VALUES(1,'A')

SELECT * FROM test_foreign_key

INSERT INTO test_foreign_key VALUES(null,'B')

INSERT INTO test_foreign_key VALUES (5,'C')

--Case 2 : Table already exists

CREATE TABLE test_foreign_key_2 (ID INT, course VARCHAR(256))

ALTER TABLE test_foreign_key_2
ADD FOREIGN KEY(id) REFERENCES test_primary_key(id)
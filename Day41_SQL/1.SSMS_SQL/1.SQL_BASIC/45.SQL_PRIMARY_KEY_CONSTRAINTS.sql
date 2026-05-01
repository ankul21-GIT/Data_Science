
--Primary Key Constraint

--Case 1 : When new is to be created

CREATE TABLE test_pk_1 (
eid INT PRIMARY KEY,
gender CHAR(1),
age TINYINT,
firstname VARCHAR(256)
)


INSERT INTO test_pk_1 VALUES(1,'M',23,'Mayank')

SELECT * FROM test_pk_1

INSERT INTO test_pk_1 VALUES(1,'F',19,'Priya')

INSERT INTO test_pk_1 VALUES(null,'M',25,'Raj')

TRUNCATE TABLE test_pk_1


--Case 2 : Table Already exists

ALTER TABLE test_pk_1
ADD PRIMARY KEY(age)

DROP TABLE test_pk_2

CREATE TABLE test_pk_2 (
SID INT NOT NULL UNIQUE,
firstname NVARCHAR(256),
age TINYINT NOT NULL
)

ALTER TABLE test_pk_2
ADD PRIMARY KEY (sid,age)

ALTER TABLE test_pk_2
ADD PRIMARY KEY(sid)
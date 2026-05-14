CREATE DATABASE College;

USE College;

CREATE TABLE Students(
	ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    AGE INT NOT NULL
);
    
INSERT INTO Students VALUES(1, "AMAN", 26);
INSERT INTO Students VALUES(2, "SHRADHHA", 24);

SELECT * FROM Students; 


-- You can also drop table
-- DROP TABLE Students;








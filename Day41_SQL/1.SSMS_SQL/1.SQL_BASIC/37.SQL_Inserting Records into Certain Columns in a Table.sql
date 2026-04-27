
INSERT INTO student_details(Age,event_date)
values (34,'2023-10-04'),(43,'2019-01-01'),(19,'2022-08-08')

SELECT * FROM student_details

--Datatype of column age is tinyint (0 to 255)

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'student_details'

INSERT INTO student_details (Age)

--------------------------

INSERT INTO student_details(Age,event_date)
VALUES (34,'2023-10-04'),(43,'2019-01-01'),(19,'2022-08-08')

SELECT * FROM student_details

--Datatype of column age is tinyint (0 to 255)

SELECT * FROM  INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME LIKE 'student_details'

INSERT INTO student_details (Age)
VALUES (256)
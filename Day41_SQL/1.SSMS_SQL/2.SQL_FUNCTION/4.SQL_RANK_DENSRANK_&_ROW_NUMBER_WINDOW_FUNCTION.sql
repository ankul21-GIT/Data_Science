

CREATE TABLE Students (
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);


INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);





SELECT * FROM Students

--Row_Number -> In case of a tie row numbers are assigned randomly.

SELECT *,ROW_NUMBER() OVER(ORDER BY marks DESC) AS [Row Number]
FROM Students

--Rank -> if there's a tie next rank/ranks will be skipped.

SELECT *,RANK() OVER(ORDER BY marks DESC) AS [Rank Function]
FROM Students

--Dense_Rank -> if there's a tie ranks will not be skipped.

SELECT *,DENSE_RANK() OVER(ORDER BY marks DESC) [Dense Rank]
FROM Students

-----------------------------


--Row_Number -> In case of a tie row numbers are assigned randomly

SELECT *,ROW_NUMBER() OVER(ORDER BY marks) AS [Row Number]
FROM Students

--Rank -> if there's a tie next rank/ranks will be skipped

SELECT *,RANK() OVER(ORDER BY marks) AS [Rank Function]
FROM Students

--Dense_Rank -> if there's a tie ranks will not be skipped

SELECT *,DENSE_RANK() OVER(ORDER BY marks) [Dense Rank]
FROM Students

-----------------------------------------

--Row_Number -> In case of a tie row numbers are assigned randomly

SELECT *,ROW_NUMBER() OVER(ORDER BY marks ASC) AS [Row Number]
FROM Students

--Rank -> if there's a tie next rank/ranks will be skipped

SELECT *,RANK() OVER(ORDER BY marks ASC) AS [Rank Function]
FROM Students

--Dense_Rank -> if there's a tie ranks will not be skipped

SELECT *,DENSE_RANK() OVER(ORDER BY marks ASC) AS [Dense Rank]
from Students





--- The row number have to be assigned according to the marks column
--to each one of the record, but it has to be done for each subject.
-- a window has to be created basically for each subject.

SELECT *, ROW_NUMBER() OVER(PARTITION BY subject ORDER BY marks DESC) AS [Row Number Desc]
FROM Students

SELECT *, ROW_NUMBER() OVER(PARTITION BY subject ORDER BY marks) AS [Row Number Asc]
FROM Students

SELECT *, ROW_NUMBER() OVER(PARTITION BY student_name ORDER BY marks DESC) AS [Row Number Desc]
FROM Students

SELECT *, ROW_NUMBER() OVER(PARTITION BY student_name ORDER BY marks) AS [Row Number ASC]
FROM Students

SELECT *, RANK() OVER(PARTITION BY student_name ORDER BY marks DESC) AS [Rank Desc]
FROM Students

SELECT *, RANK() OVER(PARTITION BY student_name ORDER BY marks) AS [Rank ASC]
FROM Students

SELECT *, DENSE_RANK() OVER(PARTITION BY student_name ORDER BY marks DESC) AS [Dense Rank Desc]
FROM Students

SELECT *, DENSE_RANK() OVER(PARTITION BY student_name ORDER BY marks) [Dense Rank ASC]
FROM Students


SELECT *, RANK() OVER(PARTITION BY subject ORDER BY marks DESC) [Rank Desc]
FROM Students

SELECT *, RANK() OVER(PARTITION BY subject ORDER BY marks) [Rank Asc]
FROM Students


SELECT *, DENSE_RANK() OVER(PARTITION BY subject ORDER BY marks DESC) [Dense Desc]
FROM Students

SELECT *, DENSE_RANK() OVER(PARTITION BY subject ORDER BY marks) [DENSE Asc]
FROM Students
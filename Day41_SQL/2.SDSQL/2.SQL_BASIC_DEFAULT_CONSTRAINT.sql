CREATE DATABASE College;

USE College;

CREATE TABLE Students(
	ROLLNO INT PRIMARY KEY,
    NAME VARCHAR(20)
);
    
INSERT INTO Students
VALUES
(ROLLNO, NAME),
(1, "Karan"),
(2, "Arjun"),
(3, "Ram");

SELECT * FROM Students; 

-- DROP DATABASE College;

-- Question - Create a database for your company name XYZ

-- Step 1 :- Create a table inside this Database to store employee info (id, name, and Salary)

-- Step 2 :- Add following information in the Database 
-- 1, "Adam", 25000
-- 2, "Bob", 30000
-- 3, "Casey", 40000

CREATE DATABASE xyz_company;

USE xyz_company;

CREATE TABLE Employee(
	ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    SALARY INT
);

INSERT INTO Employee
VALUES
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 40000);

-- SQL Constraint - SQL constraint are used to specify rule for data in table.

-- NOT NULL - Column can not have null value.

-- UNIQUE - All value in a column should be different

-- PRIMARY KEY - Make a column unique and NOT NULL and there is only one PK in a table we can't create second PK in a table.


SELECT * FROM Employee;
    
CREATE TABLE temp3(
	id INT UNIQUE
);

INSERT INTO temp3 VALUES(101);
INSERT INTO temp3 VALUES(101);


-- FOREIGN KEY - Prevent action that would destroy action between tables.

CREATE TABLE temp(
	cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id)
);


-- DEFAULT CONSTRAINTS - Set the default value of the column.

CREATE TABLE emp(
	id INT,
    salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES(101);
INSERT INTO emp (id) VALUES(102);

SELECT * FROM emp;


-- CHECK CONSTRAINTS - It can limits the value allowed in a column.

CREATE TABLE city(
	 Id INT PRIMARY KEY,
     city VARCHAR(20),
     age INT,
     CONSTRAINT age_check (CHECK age >= 18 AND city = "Delhi")
);

-- ---------OR-------------------------------

CREATE TABLE city(
	age INT CHECK(age >= 18)
);







--   --- ROUGH------


CREATE TABLE Students(
	RollNo INT PRIMARY KEY,
    Name VARCHAR(20)
);


INSERT INTO Students
(RollNo, Name)
VALUES
(1, "Karan"),
(2, "Arjun"),
(3, "Ram");

SELECT * FROM Students;



-- Question - Create a database for your company name XYZ

-- Step 1 :- Create a table inside this Database to store employee info (id, name, and Salary)

-- Step 2 :- Add following information in the Database 
-- 1, "Adam", 25000
-- 2, "Bob", 30000
-- 3, "Casey", 40000


CREATE TABLE Employee(
	Id INT PRIMARY KEY,
    Name VARCHAR(20),
    Salary INT NOT NULL
);

INSERT INTO Employee
(Id, Name, Salary)
VALUES
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 40000);

SELECT * FROM Employee;


-- CONSTRAINT

-- UNIQUE

CREATE TABLE temp1(
	Id INT UNIQUE
);

INSERT INTO temp1 VALUES(101);
INSERT INTO temp1 VALUES(101); -- It show error
INSERT INTO temp1 VALUES(102);

SELECT * FROM temp1;

-- PRIMARY KEY

CREATE TABLE temp2 (
    id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(20),
    PRIMARY KEY (id, name)
);

INSERT INTO temp2 
(id, name, age, city)
VALUES
(1, "Ankur", 25, "Varanasi"),
(1, "Rahul", 26, "Chennai"),
(1, "Ankur", 27, "Gurugram"),
(2, "Ankur", 28, "Delhi");  -- It show error 


-- DEFAULT CONSTRAINT

CREATE TABLE emp(
	 id INT PRIMARY KEY,
     Salary INT DEFAULT(25000)
);

INSERT INTO emp
(id)
VALUES
(101),
(102),
(103);

SELECT * FROM emp;


CREATE DATABASE temp1;

-- How to drop database

DROP DATABASE temp1;

CREATE DATABASE IF NOT EXISTS temp1;

-- ------------

CREATE DATABASE school;

USE school;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL,
    course VARCHAR(50)

);

INSERT INTO student
(id, name, age, course)
VALUES
(1, 'Kanha', 26, 'DSA');

SELECT * FROM student;

SELECT * FROM school.student;



CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL,
    subject VARCHAR(50)

);


CREATE TABLE products(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT NOT NULL,
    size VARCHAR(50)
);


-- ------------------------------------

CREATE DATABASE store;

USE store;

CREATE TABLE products(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT NOT NULL,
    size VARCHAR(50)
);


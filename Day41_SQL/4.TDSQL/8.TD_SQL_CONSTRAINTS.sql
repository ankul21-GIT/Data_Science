CREATE DATABASE school;

USE school;

CREATE TABLE student(
	id INT,
    name VARCHAR(50),
    age INT NOT NULL,
    course VARCHAR(50)

);

INSERT INTO student
(id, name, age, course)
VALUES
(1, 'Kanha', 26, 'DSA');

SELECT * FROM student;

-- ----------------------------------

INSERT INTO student
(id, name, age, course)
VALUES
(1, 'Ravi', 40, 'English');

SELECT * FROM student;


USE store;


CREATE TABLE customer(
	CustomerID INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);


INSERT INTO customer
(CustomerID, name, address)
VALUES
(1, 'Ayush', 'Delhi');

SELECT * FROM customer;



CREATE TABLE Orders (
OrderId INT PRIMARY KEY,
ProductID VARCHAR(50),
OrderDate DateTime,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


INSERT INTO `store`.`Orders`
(
  `OrderId`,
  `ProductID`,
  `OrderDate`,
  `CustomerID`
)
VALUES
(
  101,
  "Nike Shoes",
  "2025-01-10",
  2
);

INSERT INTO `store`.`customer`
(`CustomerID`,
`name`,
`address`)
VALUES
(2,
'Kanha',
'Agra');

SELECT * FROM store.orders;
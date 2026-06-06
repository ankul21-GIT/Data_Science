-- SQL constraint are used to specify rule for data in a table.

USE school;

CREATE TABLE Employees (
EmployeeID INT NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50)
);


INSERT INTO `school`.`Employees`
(
  `EmployeeID`,
  `FirstName`,
  `LastName`
)
VALUES
(
  '1',
  'K',
  'A'
);


SELECT * FROM employees;


-- UNIQUE CONSTRAINT - Ensures all values in a column are different.

CREATE TABLE customers(
	CustomerID INT UNIQUE,
    Email VARCHAR (100) UNIQUE
);


INSERT INTO `school`.`customers`
(
  `CustomerID`,
  `Email`)
VALUES
(
  '1',
  'K@gmail.com'
);

SELECT * FROM customers;

-- CHECK CONSTRAINTS - Ensure that the value in a column satisfy a specific condition.

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
Price DECIMAL(10, 2) CHECK (Price > 0),
Stock INT CHECK (Stock >= 0)
);


INSERT INTO `school`.`Products`
(ProductID,
`Price`,
`Stock` )
VALUES
(1,
100.0,
5);

SELECT * FROM products;


-- DEFAULT CONSTRAINT - Sets a default value for a column if no value is specified.

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
OrderDate DATE DEFAULT (CURRENT_DATE),
Status VARCHAR(20) DEFAULT 'Pending'
);


INSERT INTO `school`.`Orders`
(`OrderID`)
VALUES
(101);

SELECT * FROM orders;


-- AUTO INCREMENT - Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

CREATE TABLE Persons (
Personid INT NOT NULL AUTO_INCREMENT,
LastName VARCHAR(255) NOT NULL,
FirstName VARCHAR(255),
Age INT,
PRIMARY KEY (Personid)
);


INSERT INTO `school`.`Persons`
(
    `LastName`,
    `FirstName`,
    `Age`
)
VALUES
(
    'Agarwal',
    'Kanhaiya',
    26
);
 SELECT * FROM person;
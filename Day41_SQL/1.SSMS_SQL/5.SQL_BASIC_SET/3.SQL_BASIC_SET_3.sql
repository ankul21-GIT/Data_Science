CREATE DATABASE [SQL Questions];

USE [SQL Questions];

-- Create the Customers table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table

INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);



SELECT * FROM Customers

SELECT * FROM Orders

SELECT * FROM Products


--1) Write an SQL query to find the names of customers who have placed an order.

SELECT DISTINCT c.CustomerName
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--2) Find the list of customers who have not placed any orders.

SELECT DISTINCT CustomerName FROM Customers c left join Orders o ON O.CustomerID = C.CustomerID WHERE o.OrderID is null

-- OR

SELECT c.CustomerName
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--3) List all orders along with the product name and price.

select distinct ProductName,Price from Orders o join Products p on o.ProductID = p.ProductID  

-- OR

SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
JOIN Products p
ON o.ProductID = p.ProductID;

--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct CustomerName,OrderID from Customers c left join Orders o on o.CustomerID = c.CustomerID

-- OR

SELECT c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

--5) Retrieve a list of products that have never been ordered.
select distinct p.ProductID,ProductName from Products p left join Orders o on p.ProductID = o.ProductID where o.OrderDate is null

-- OR

SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Orders o
ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;

--6) Find the total number of orders placed by each customer.

select customername,count(orderid) [Number of Orders] from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by customername

--OR 
select customername,count(orderid) [Number of Orders] from Customers c LEFT join Orders o on c.CustomerID = o.CustomerID
group by customername

-- OR

SELECT c.CustomerName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName;

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join Products p on o.ProductID = p.ProductID

-- OR

SELECT 
c.CustomerName,
p.ProductName,
o.OrderDate
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN Products p
ON o.ProductID = p.ProductID;


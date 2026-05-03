
CREATE TABLE Customersss (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);


INSERT INTO Customersss (CustomerID, FirstName, LastName, Email, PhoneNumber, Address)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-1234', '123 Elm St'),
(2, 'Bob', 'Smith', NULL, '555-5678', NULL),
(3, 'Charlie', 'Williams', 'charlie.williams@example.com', NULL, '456 Oak St'),
(4, 'Diana', 'Brown', NULL, NULL, '789 Pine St'),
(5, 'Eve', 'Davis', 'eve.davis@example.com', '555-8765', NULL);


-- Practice

SELECT * FROM Customersss


--Isnull
SELECT ISNULL(null,'1 st value null')

SELECT ISNULL('abx',null)

SELECT ISNULL(null,null)

SELECT COALESCE('A','B','C')

SELECT COALESCE(null,'B','C')

SELECT COALESCE(null,null,'C')

--
SELECT * FROM Customersss

SELECT Customerid,email,phonenumber FROM Customersss

SELECT Customerid,ISNULL(email,'Email NA'),ISNULL(phonenumber,'Ph No NA') FROM Customersss

SELECT Customerid,COALESCE(email,phonenumber,'Contact NA') [Coalesce Function] FROM Customersss
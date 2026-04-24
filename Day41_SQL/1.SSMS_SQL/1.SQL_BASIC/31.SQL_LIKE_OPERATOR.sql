-- Create Employees_us table
CREATE TABLE Employees_US (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees_us (EmployeeID, FirstName, LastName, Department) VALUES
(1, 'Alice', 'Smith', 'Finance'),
(2, 'Bob', 'Johnson', 'Engineering'),
(3, 'Charlie', 'Williams', 'Marketing'),
(4, 'Diana', 'Brown', 'Finance'),
(5, 'Edward', 'Jones', 'Engineering'),
(6, 'Fiona', 'Garcia', 'Marketing'),
(7, 'George', 'Miller', 'Finance'),
(8, 'Hannah', 'Wilson', 'Engineering');



-- Practice


SELECT * FROM Employees_US


-----https://www.w3schools.com/sql/sql_wildcards.asp


-- 1. Find the employee name whose last name start with 'S'

SELECT * FROM Employees_US WHERE LastName LIKE 'S%'


-- 2. Find the employee whose first name end with 'a'

SELECT * FROM Employees_US WHERE FirstName LIKE '%a'


-- 3. Find Employees whose Department contains 'Eng'.

SELECT * FROM Employees_US WHERE Department LIKE '%Eng%'


-- 4. Find Employees whose Last Name is exactly 5 characters long.

SELECT * FROM Employees_US WHERE LastName LIKE '_____'


--5. Find Employees whose First Name starts with 'C' or 'D'.

SELECT * FROM Employees_US WHERE FirstName LIKE '[CD]%'


--6. Find Employees whose Last Name contains 'son'.

SELECT * FROM Employees_US WHERE LastName LIKE '%son%'


--7. Find Employees whose First Name contains the letter 'i' as the second character.

SELECT * FROM Employees_US WHERE FirstName LIKE '_i%'


--8. Find Employees whose Last Name starts with any letter between 'A' and 'L'.

SELECT * FROM Employees_US WHERE LastName LIKE '[A-L]%'


--9. Find Employees whose First Name does not contain 'o'.

SELECT * FROM Employees_US WHERE FirstName NOT LIKE '%O%'


-- 10. Find Employees whose Last Name ends with 'a' and is exactly 5 characters long.

SELECT * FROM Employees_US WHERE LastName LIKE '%____a%'


--11. Find Employees whose Department starts with 'Mar' and ends with 'ing'.

SELECT * FROM Employees_US WHERE Department LIKE 'Mar%ing'


--12. Find Employees whose First Name has an 'a' in the third position.

SELECT * FROM Employees_US WHERE FirstName LIKE '__a%'


--13. Find Employees whose Last Name starts with 'Br' or 'Bl'.

SELECT * FROM Employees_US WHERE LastName LIKE 'Br%' OR LastName LIKE 'Bl%'


--14. Find Employees whose First Name starts with a vowel.

SELECT * FROM Employees_US WHERE FirstName LIKE '[aeiou]%'


--15. Find Employees whose First Name does not start with a consonant. 

SELECT * FROM Employees_US WHERE FirstName NOT LIKE '[^aeiou]%'


--16. Find Employees whose First Name starts with a consonant.

SELECT * FROM Employees_US WHERE Firstname LIKE '[^aeiou]%'
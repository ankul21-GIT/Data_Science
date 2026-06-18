-- VIEW

/*
Views
- A View in MySQL/SQL is a virtual table based on the result of a SELECT query. It does not store data physically, 
but presents data from one or more tables in a structured way.

View ?

- View is a Database Object.
- View is created over an SQL Query.
- View does NOT store any data.
- View is like a virtual table.

Use cases:
- Simplify complex queries.
- Abstract sensitive data (security).
- Provide different perspectives to different users.

*/

USE rough;

SELECT * FROM customers;


CREATE VIEW view2 AS
SELECT * FROM customers;

SELECT * FROM view2;

SELECT * FROM view2
WHERE custID = 334;


-- How to find how many views in my databases.

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';



USE rough;

SELECT * FROM employee;

DELIMITER $$

CREATE PROCEDURE PrintEmployeeNames()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE emp_name VARCHAR(50);

    -- Cursor declaration
    DECLARE empName CURSOR FOR SELECT name FROM Employees;

    -- Declare continue handler
    DECLARE CONTINUE HANDLER 
    FOR NOT FOUND 
    SET done = 1;

    -- Open cursor
    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO emp_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Action
        SELECT emp_name;
    END LOOP;

    CLOSE emp_cursor;
END$$

DELIMITER ;



-- CALL ApplySmartDiscountToCategory(3);


DELIMITER $$

CREATE PROCEDURE ApplySmartDiscountToCategory(IN cat_id INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE prod_id INT;
    DECLARE current_price DECIMAL(10,2);
    DECLARE discount_price DECIMAL(10,2);

    -- Cursor for active products in given category
    DECLARE cur CURSOR FOR
        SELECT product_id, price
        FROM Products
        WHERE category_id = cat_id AND is_active = 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO prod_id, current_price;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Apply discount based on price range
        IF current_price < 500 THEN
            SET discount_price = current_price - (current_price * 0.30);
        ELSEIF current_price BETWEEN 500 AND 2000 THEN
            SET discount_price = current_price - (current_price * 0.50);
        ELSE
            SET discount_price = current_price - (current_price * 0.70);
        END IF;

        -- Update product price
        UPDATE Products
        SET price = discount_price
        WHERE product_id = prod_id;

    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;



-- LOOP EXAMPLE 

DELIMITER $$

CREATE PROCEDURE DiscountLowStockProducts()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE prod_id INT;
    DECLARE curr_stock INT;

    DECLARE cur CURSOR FOR 
        SELECT product_id, stock FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO prod_id, curr_stock;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF curr_stock < 10 THEN
            -- Apply 10% discount
            UPDATE products
            SET price = price * 0.9
            WHERE product_id = prod_id;
        END IF;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;






-- WHILE EXAMPLE 

DELIMITER $$

CREATE PROCEDURE WhileExample()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE total INT DEFAULT 0;

    WHILE counter <= 5 DO
        SET total = total + counter;
        SET counter = counter + 1;
    END WHILE;

    SELECT CONCAT('Total Sum = ', total);
END$$

DELIMITER ;





-- REPEAT

DELIMITER $$

CREATE PROCEDURE RepeatExample()
BEGIN
    DECLARE counter INT DEFAULT 2;

    REPEAT
        SELECT CONCAT('Even Number = ', counter);
        SET counter = counter + 2;
    UNTIL counter > 10
    END REPEAT;
END$$

DELIMITER ;





-- Real World Example 

DELIMITER $$

CREATE PROCEDURE PrintProducts()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE prod_name VARCHAR(100);
    
    DECLARE cur CURSOR FOR SELECT name FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO prod_name;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Do something with prod_name
        SELECT CONCAT('Product: ', prod_name);
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;




-- All in One 

DELIMITER $$

CREATE PROCEDURE DiscountLowStockProducts()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE prod_id INT;
    DECLARE curr_stock INT;

    DECLARE cur CURSOR FOR 
        SELECT product_id, stock FROM products;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO prod_id, curr_stock;
        IF done THEN
            LEAVE read_loop;
        END IF;

        IF curr_stock < 10 THEN
            -- Apply 10% discount
            UPDATE products
            SET price = price * 0.9
            WHERE product_id = prod_id;
        END IF;
    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;














-- Use Case: ProcessOrder

-- Suppose we have:

-- orders table: order_id, customer_id, status
-- order_items table: order_id, product_id, quantity
-- products table: product_id, stock
-- order_logs table: log_id, order_id, message, log_time


-- We want to:

-- Check stock for each item.

-- If all items are in stock, reduce stock and mark order as 'Processed'.

-- If not enough stock, mark order as 'Failed'.

-- Log the actions.



DELIMITER $$

CREATE PROCEDURE ProcessOrder(IN in_order_id INT)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE prod_id INT;
    DECLARE qty INT;
    DECLARE curr_stock INT;
    DECLARE insufficient_stock INT DEFAULT 0;

    -- Cursor for order items
    DECLARE item_cursor CURSOR FOR
        SELECT product_id, quantity FROM order_items WHERE order_id = in_order_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open cursor and start loop
    OPEN item_cursor;

    read_loop: LOOP
        FETCH item_cursor INTO prod_id, qty;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check current stock
        SELECT stock INTO curr_stock FROM products WHERE product_id = prod_id;

        IF curr_stock < qty THEN
            SET insufficient_stock = 1;
            -- Log insufficient stock
            INSERT INTO order_logs (order_id, message, log_time)
            VALUES (in_order_id, CONCAT('Insufficient stock for product ', prod_id), NOW());
        END IF;
    END LOOP;

    CLOSE item_cursor;

    -- If any item had insufficient stock, mark order as failed
    IF insufficient_stock = 1 THEN
        UPDATE orders SET status = 'Failed' WHERE order_id = in_order_id;
        INSERT INTO order_logs (order_id, message, log_time)
        VALUES (in_order_id, 'Order processing failed due to low stock', NOW());
    ELSE
        -- Process the order: Deduct stock
        OPEN item_cursor;
        SET done = FALSE;

        read_loop_2: LOOP
            FETCH item_cursor INTO prod_id, qty;
            IF done THEN
                LEAVE read_loop_2;
            END IF;

            UPDATE products
            SET stock = stock - qty
            WHERE product_id = prod_id;

            INSERT INTO order_logs (order_id, message, log_time)
            VALUES (in_order_id, CONCAT('Stock reduced for product ', prod_id), NOW());
        END LOOP;

        CLOSE item_cursor;

        UPDATE orders SET status = 'Processed' WHERE order_id = in_order_id;
        INSERT INTO order_logs (order_id, message, log_time)
        VALUES (in_order_id, 'Order processed successfully', NOW());
    END IF;
END$$

DELIMITER ;

/*

-- Interview Tips: SQL Stored Procedures

The following list outlines common interview topics categorized by difficulty level.

-- Basic-Level

What is a stored procedure in MySQL?
What are the different types of parameters supported in stored procedures?
How do you create and execute a stored procedure?
What is the role of the DELIMITER command in MySQL?
How do you drop a stored procedure?

-- Intermediate-Level

What is the difference between a stored procedure and a stored function?
How do you handle exceptions in a stored procedure?
What is a cursor, and how is it used in stored procedures?
How can you use IF, CASE, and WHILE in a stored procedure?
Can a stored procedure return multiple result sets?

-- Advanced-Level

Can a stored procedure call another stored procedure?
How are transactions implemented inside stored procedures?
How do you handle rollback on error within a stored procedure?
Can stored procedures be recursive in MySQL?
What are the limitations or disadvantages of using stored procedures?

*/


/*
Basic-Level Interview Answers

1. What is a stored procedure in MySQL? 

It is a prepared SQL code segment that you can save in the database so the code can be reused over and over again.
--
2. What are the different types of parameters supported in stored procedures? 

MySQL supports three types of parameters: IN (passes a value into a procedure), OUT (returns a value from a procedure), 
and INOUT (passes a value in and can be modified to return a value back).
--
3. How do you create and execute a stored procedure? 

You create one using the CREATE PROCEDURE statement and execute it using the CALL keyword followed by the procedure name, 
such as CALL ProcedureName().
--
4. What is the role of the DELIMITER command in MySQL? 

The DELIMITER command is used to change the standard semicolon (;) to another character (like $$) so that the database 
engine can distinguish between the individual statements within the procedure and the end of the procedure definition 
itself.

5. How do you drop a stored procedure?
 
You use the DROP PROCEDURE command followed by the name of the procedure, 
for example: DROP PROCEDURE IF EXISTS ProcedureName;.


Intermediate-Level Solutions

1. What is the difference between a stored procedure and a stored function?
- Return Value: Functions must return a single value using the RETURN keyword, while procedures do not require a 
return value but can return data via OUT parameters.

- Usage: Functions can be used inside SQL statements (like SELECT func_name(col) FROM table), whereas procedures must be invoked using the CALL statement.

- DML Operations: Procedures are generally used for data manipulation (INSERT, UPDATE, DELETE), while functions are 
typically used for calculations.

------------------------------------------------------------------------------------------
2. How do you handle exceptions in a stored procedure?

- Exceptions are handled using a HANDLER. You can define a CONTINUE or EXIT handler for specific conditions
like SQLEXCEPTION, SQLWARNING, or NOT FOUND.

- Example from your image: DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;.
-----------------------------------------------------------------------------------------------------------------

3. What is a cursor, and how is it used in stored procedures?

- A cursor is a database object used to retrieve and manipulate data from a result set one row at a time.

- The Lifecycle: You must DECLARE the cursor for a specific SELECT statement, OPEN it to execute the query, FETCH rows into variables, and finally CLOSE it.
---------------------------------------------------------------------------------------------------------------------
4. How can you use IF, CASE, and WHILE in a stored procedure?

- IF: Used for simple conditional branching (e.g., IF condition THEN ... END IF;).

- CASE: Used for multiple branching conditions, as seen in your code: CASE WHEN price < 500 THEN ... END.

- WHILE: A loop that executes as long as a specific condition is true.
----------------------------------------------------------------------------------------------------------------------
5. Can a stored procedure return multiple result sets?

Yes, MySQL stored procedures can return multiple result sets simply by including multiple SELECT statements within 
the BEGIN...END block. When the procedure is called, each SELECT produces its own output grid.



-- Advanced-Level Solutions.

1. Can a stored procedure call another stored procedure? 

- Yes, a stored procedure can invoke another procedure using the CALL statement within its body. This is often used to 
modularize complex logic into smaller, reusable components.
---------------------------------------------------------------------------------------------------------

2. How are transactions implemented inside stored procedures? 

- Transactions are managed using START TRANSACTION, COMMIT, and ROLLBACK commands. You can wrap multiple DML statements 
(like INSERT or UPDATE) in a transaction to ensure that either all changes are saved or none are, maintaining data 
integrity.
-------------------------------------------------------------------------------------------------------------------

3. How do you handle rollback on error within a stored procedure? 

- You can use an EXIT HANDLER for SQLEXCEPTION. Inside this handler, you execute a ROLLBACK command to undo any changes 
made during the current transaction if an error occurs.
--------------------------------------------------------------------------------------------------------

4. Can stored procedures be recursive in MySQL? 

- Yes, but recursion is disabled by default. To use it, you must set the max_sp_recursion_depth system variable to a 
value greater than 0. However, recursion should be used cautiously as it can be memory-intensive.

5. What are the limitations or disadvantages of using stored procedures? 

- Portability: Procedure syntax varies significantly between database systems (e.g., MySQL vs. SQL Server), making it 
hard to switch platforms.

- Testing and Debugging: Debugging tools for stored procedures are often less robust than those for standard application 
code.

- Resource Usage: Heavy logic inside procedures can increase the CPU and memory load on the database server rather than 
the application server.


*/
/*
-- Key Database Properties: ACID

A transaction in a database must adhere to these four fundamental properties to ensure reliability.

Atomicity: All operations in a transaction succeed, or none of them do.

Consistency: The database must remain in a valid state both before and after the transaction occurs.

Isolation: Transactions occur independently of one another without interference.

Durability: Once a transaction is committed, the changes are permanent, even in the event of a system failure.

*/

/*
Transaction Control Commands (TCL)

- How to manage transactions in MySQL:

BEGIN / START TRANSACTION: Initiates a new transaction.

COMMIT: Saves all changes made during the transaction permanently.

ROLLBACK: Undoes all changes made since the transaction started.

SAVEPOINT: Sets a specific point within a transaction to which you can roll back later.

*/


/*

- Transaction States

A transaction in a DBMS moves through five specific states:

- Active: The initial state of every transaction in a database . This state mean that the transaction is being 
executed and cna perform read and write operations.

- Partially Committed: A transaction entere this state after performing its final operation/query.

- Committed: A transaction is in these state if has performed all its operation successfully the effect of 
the transaction are now permanent in database system.

- Failed: A transaction enter these state if any transaction fails or if the transaction is aborted before 
completing . A failed transaction cannot proceed further.

- Terminated: It is the final state of each transaction. It mean that the transaction is finished either 
successfully or not.

*/



-- Sender
UPDATE bank_accounts SET balance = balance - 1000 WHERE account_number = 'SB100001';

-- Receiver
UPDATE bank_accounts SET balance = balance + 1000 WHERE account_number = 'SB100002';

rollback;

-- without transaction & autocommit;

-- AMIT - 12,500
-- Priya - 13,000

USE rough;

DROP TABLE bank_accounts;

CREATE TABLE bank_accounts (
    Account_ID INT PRIMARY KEY,
    Account_Number VARCHAR(20) NOT NULL UNIQUE,
    Customer_Name VARCHAR(50) NOT NULL,
    Account_Type ENUM('Savings', 'Current', 'Salary', 'Fixed') NOT NULL,
    Balance DECIMAL(10,2) NOT NULL,
    Branch_Code VARCHAR(10) NOT NULL,
    Created DATE NOT NULL
);


INSERT INTO bank_accounts (Account_ID, Account_Number, Customer_Name, Account_Type, Balance, Branch_Code, Created) VALUES
(1, 'SBI100001', 'AMIT Sharma', 'Savings', 12500, 'BR001', '2025-07-22'),
(2, 'SBI100002', 'Priya Verma', 'Current', 10000, 'BR002', '2025-07-22'),
(3, 'SBI100003', 'Rahul Mehta', 'salary', 22000, 'BR001', '2025-07-22'),
(4, 'SBI100004', 'Sneha Patil', 'Fixed', 500000, 'BR003', '2025-07-22'),
(5, 'SBI100005', 'Karan Malhotra', 'Saving', 3200, 'BR002', '2025-07-22'),
(6, 'SBI100006', 'Neha Reddy', 'Current', 12000, 'BR001', '2025-07-22'),
(7, 'SBI100007', 'Vikram Joshi', 'Salary', 18500, 'BR002', '2025-07-22'),
(8, 'SBI100008', 'Anjali Nair', 'Savings', 9800, 'BR003', '2025-07-22'),
(9, 'SBI100009', 'Rohit Kulkarni', 'Current', 4500, 'BR001', '2025-07-22'),
(10,'SBI100010', 'Divya Sinha', 'Fixed', 75000, 'BR003', '2025-07-22');

INSERT INTO bank_accounts 
(Account_ID, Account_Number, Customer_Name, Account_Type, Balance, Branch_Code, Created)
VALUES
(1, 'SBI100001', 'AMIT Sharma', 'Savings', 12500, 'BR001', '2025-07-22'),
(2, 'SBI100002', 'Priya Verma', 'Current', 10000, 'BR002', '2025-07-22'),
(3, 'SBI100003', 'Rahul Mehta', 'Salary', 22000, 'BR001', '2025-07-22'),
(4, 'SBI100004', 'Sneha Patil', 'Fixed', 500000, 'BR003', '2025-07-22'),
(5, 'SBI100005', 'Karan Malhotra', 'Savings', 3200, 'BR002', '2025-07-22'),
(6, 'SBI100006', 'Neha Reddy', 'Current', 12000, 'BR001', '2025-07-22'),
(7, 'SBI100007', 'Vikram Joshi', 'Salary', 18500, 'BR002', '2025-07-22'),
(8, 'SBI100008', 'Anjali Nair', 'Savings', 9800, 'BR003', '2025-07-22'),
(9, 'SBI100009', 'Rohit Kulkarni', 'Current', 4500, 'BR001', '2025-07-22'),
(10,'SBI100010', 'Divya Sinha', 'Fixed', 75000, 'BR003', '2025-07-22');


select * from bank_account;

SET SQL_SAFE_UPDATES = 0;

START TRANSACTION;

-- Sender
UPDATE Bank_Account SET Balance = Balance - 1000 WHERE Account_Number = '500001';
-- Receiver
UPDATE Bank_Account SET Balance = Balance + 1000 WHERE Account_Number = '500002';

SELECT * FROM bank_account;

ROLLBACK;



-- 1. Auto-Commit Mode

SET autocommit = 1;  -- Enables auto-commit (default)

SET autocommit = 0;  -- Disable auto-commit 



-- 2. Implicit Commit

-- Examples of Implicit Commit Statements:
-- DDL operations like CREATE, ALTER, DROP, TRUNCATE

-- Some LOCK TABLE, UNLOCK TABLE, and admin-level statements
-- Important: These statements will cause an implicit COMMIT before and after execution, breaking the current transaction.

START TRANSACTION;

insert into stock_log(product_id,old_stock,new_stock) values(116,10,50);
UPDATE products SET salePrice = salePrice * 0.9 where productId = 1;
ALTER TABLE products ADD COLUMN discount INT;

-- The ALTER TABLE causes an implicit commit!



-- 3. Manual Commit (Explicit Commit Mode)

START TRANSACTION;

COMMIT;

ROLLBACK;



-- Real-Life Use Case: Bank Transfer

SET autocommit = 0;

START TRANSACTION;

UPDATE bank_accounts SET balance = balance - 1000 WHERE account_id = 1;
UPDATE bank_accounts SET balance = balance + 1000 WHERE account_id = 2;

COMMIT;




-- Real Life Bank Transfer Success & Failed Case 

-- Declare a transaction
START TRANSACTION;

-- Step 1: Check balance of Account A
SELECT balance INTO @sender_balance FROM bank_accounts WHERE account_id = 1;

-- Step 2: Condition to check for insufficient funds
IF @sender_balance < 500 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Insufficient balance for transfer';
END IF;

-- Step 3: Deduct amount from Account A
UPDATE bank_accounts SET balance = balance - 500 WHERE id = 1;

-- Step 4: Add amount to Account B
UPDATE bank_accounts SET balance = balance + 500 WHERE id = 2;

-- Step 5: Commit transaction
COMMIT;
5


DELIMITER $$




select * from bank_accounts;
    
DELIMITER $$

CREATE PROCEDURE transfer_amount_to_account(IN from_acc VARCHAR(25), IN to_acc VARCHAR(25), IN amount DECIMAL(10,2))
BEGIN
    DECLARE sender_balance DECIMAL(10,2);

    -- Step 1: Start transaction
    START TRANSACTION;

    insert into transaction_log(from_acc,sender_acc,amount,log_time) values()
    -- Step 2: Get sender's balance
    SELECT balance INTO sender_balance FROM bank_accounts WHERE account_number = from_acc;

 -- Step 4: Deduct from sender
    UPDATE bank_accounts SET balance = balance - amount WHERE account_number = from_acc;

    -- Step 3: If not enough balance, throw custom error
    IF 1 < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Server Crash';
    END IF;

    
    -- Step 5: Credit to receiver
    UPDATE bank_accounts SET balance = balance + amount WHERE account_number = to_acc;

    -- Step 6: Commit transaction
    COMMIT;
END $$

DELIMITER ;

select * from bank_accounts;-- 

CALL transfer_amount_to_account('SB100003', 'SB100004', 5000);


-- Using Savepoints

select * from products where productId =1;
select * from orders where orderId =10100;


SELECT * from order_log;
SELECT * from products where productId = 1;
SELECT * from orders where orderId = 10100;



START TRANSACTION;

insert into order_log(order_id,order_status) values('10100','Placed');
savepoint s1;
UPDATE products SET stock = stock - 1 WHERE productId = 1;

UPDATE orders SET status = 'Placed' WHERE orderId = 10100;
ROLLBACK to s1;

COMMIT;




-- Multi Table Transaciton 

START TRANSACTION;

UPDATE bank_accounts SET balance = balance - 100 WHERE id = 1;

INSERT INTO transaction_log (from_account, to_account, amount, txn_date)
VALUES (1, 2, 100, NOW());

UPDATE bank_accounts SET balance = balance + 100 WHERE id = 2;

COMMIT;




-- Shopping Cart Checkout

START TRANSACTION;

-- Step 1: Check if all items are in stock
SELECT c.product_id, p.stock, c.quantity
FROM cart_items c
JOIN products p ON c.product_id = p.id
WHERE c.user_id = 101;

-- If OK, continue:

-- Step 2: Create order
INSERT INTO orders (user_id, order_date) VALUES (101, NOW());
SET @orderId = LAST_INSERT_ID();

-- Step 3: For each cart item, insert into order_items & update stock
INSERT INTO order_items (order_id, product_id, quantity)
SELECT @orderId, product_id, quantity FROM cart_items WHERE user_id = 101;

UPDATE products p
JOIN cart_items c ON p.id = c.product_id
SET p.stock = p.stock - c.quantity
WHERE c.user_id = 101;

-- Step 4: Clear cart
DELETE FROM cart_items WHERE user_id = 101;

COMMIT;





-- BOOK MY SHOW 

-- Start the transaction 
START TRANSACTION;

-- Step 1: Check seat availability and lock for update
SELECT * FROM seats
WHERE show_id = 101 AND seat_no IN ('A1', 'A2') AND status = 'available'
FOR UPDATE;

-- Optional: Check row count to ensure seats are really available
-- (Assume they are for this example)

-- Step 2: Temporarily lock seats
UPDATE seats
SET status = 'locked'
WHERE show_id = 101 AND seat_no IN ('A1', 'A2');

-- Step 3: Create a PENDING booking record
INSERT INTO bookings (user_id, show_id, seat_no, status)
VALUES 
  (1001, 101, 'A1', 'PENDING'),
  (1001, 101, 'A2', 'PENDING');

-- Step 4: Simulate payment
-- CASE 1: PAYMENT FAILED (simulate failure with IF FALSE)
SET @payment_status := 'SUCCESS';

-- If payment failed, rollback
IF @payment_status = 'FAILED' THEN
  -- Rollback the transaction to undo all changes
  ROLLBACK;
  SELECT '❌ Payment failed. Booking cancelled. Seats released.' AS message;
ELSE
  -- CASE 2: PAYMENT SUCCESS

  -- Step 5: Confirm booking
  UPDATE seats
  SET status = 'booked'
  WHERE show_id = 101 AND seat_no IN ('A1', 'A2');

  UPDATE bookings
  SET status = 'CONFIRMED'
  WHERE user_id = 1001 AND show_id = 101 AND seat_no IN ('A1', 'A2');

  -- Finalize the transaction
  COMMIT;
  SELECT '✅ Booking successful. Seats confirmed.' AS message;
END IF;

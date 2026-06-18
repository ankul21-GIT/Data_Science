USE rough;

DELIMITER //

CREATE TRIGGER after_user_insert
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
	INSERT INTO customer_audit(id, name, email)
    VALUES(NEW.custID, NEW.customerName, NEW.custEamil);
END;
//
DELIMITER ;


# Example - 2

-- Maintain a Stock Log
-- Automatically log stock changes after an update.

SELECT * FROM product;

DELIMITER //

CREATE TRIGGER after_stock_update
AFTER UPDATE ON product
FOR EACH ROW
BEGIN
    INSERT INTO stock_logs (product_id, old_stock, new_stock)
    VALUES (OLD.productCode, OLD.stock, NEW.stock);
END;
//
-- DELIMITER;

USE rough;

CREATE TABLE stock_log (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  old_stock INT,
  new_stock INT,
  changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


# Example - 3

-- Cascading Delete or Soft Delete
-- When deleting a user, store a copy in an archive table.

CREATE TABLE customers_archive LIKE customers;

CREATE TRIGGER before_customer_delete
BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO customers_archive
    SELECT * FROM customers WHERE custId = OLD.custId;
END;


# Example - 4

-- Inventory Management
-- Automatically decrease stock quantity when an order is placed

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = NEW.product_id;
END;


-- Prevent negative stock
-- Disallow order placement if not enough stock is available

CREATE TRIGGER before_order_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;

    SELECT stock INTO current_stock
    FROM products
    WHERE id = NEW.product_id;

    IF current_stock < NEW.quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for this order';
    END IF;
END;


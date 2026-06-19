USE rough;

SELECT * FROM orderss;
SELECT * FROM customers;


DELIMITER $$

CREATE PROCEDURE GetOrdersByCustomer(IN customerId INT)
BEGIN
    SELECT * FROM orderss WHERE custId = customerId;
END$$

DELIMITER ;


CALL GetOrdersByCustomer(128);






-- EX - 2 
-- Insert New Product (with auto logging)

DELIMITER $$

CREATE PROCEDURE AddProduct(
    IN p_name VARCHAR(100),
    IN p_price DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO products (name, price, stock)
    VALUES (p_name, p_price, p_stock);

    INSERT INTO product_logs (product_name, action, created_at)
    VALUES (p_name, 'INSERT', NOW());
END$$

DELIMITER ;



-- Ex-I
-- Auto Apply Discounts Based on Total Amount

DELIMITER $$

CREATE PROCEDURE ApplyDiscount(IN custId INT)
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(amount) INTO total 
    FROM orders 
    WHERE customer_id = custId;

    IF total > 10000 THEN
        UPDATE customers SET discount = 15 WHERE id = custId;
    ELSEIF total > 5000 THEN
        UPDATE customers SET discount = 10 WHERE id = custId;
    ELSE
        UPDATE customers SET discount = 5 WHERE id = custId;
    END IF;
END$$

DELIMITER ;



# Ex-4
-- Generate Monthly Sales Report

DELIMITER $$

CREATE PROCEDURE MonthlySalesReport(IN reportMonth INT, IN reportYear INT)
BEGIN
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(total_amount) AS total_sales
    FROM orderss
    WHERE MONTH(order_date) = reportMonth 
      AND YEAR(order_date) = reportYear
    GROUP BY month;
END$$

DELIMITER ;

CALL MonthlySalesReport(6, 2025);


-- Ex-5
-- Delete Inactive Customers (Last Order > 1 Year)

DELIMITER $$

CREATE PROCEDURE DeleteInactiveCustomers()
BEGIN
    DELETE FROM customers
    WHERE id NOT IN (
        SELECT DISTINCT customer_id FROM orders
        WHERE order_date > NOW() - INTERVAL 1 YEAR
    );
END$$

DELIMITER ;



#Ex-5
-- Delete Inactive Customers (Last Order > 1 Year)

DELIMITER $$

CREATE PROCEDURE DeleteInactiveCustomers()
BEGIN
    DELETE FROM customers
    WHERE id NOT IN (
        SELECT DISTINCT customer_id FROM orders
        WHERE order_date > NOW() - INTERVAL 1 YEAR
    );
END$$

DELIMITER ;



-- Stored Procedure: ApplySmartDiscountToCategory

DELIMITER $$

CREATE PROCEDURE ApplySmartDiscountToCategory(IN cat_id INT)
BEGIN
    UPDATE Products
    SET price = 
        CASE 
            WHEN price < 500 THEN price - (price * 0.30)
            WHEN price BETWEEN 500 AND 2000 THEN price - (price * 0.50)
            WHEN price > 2000 THEN price - (price * 0.70)
        END
    WHERE category_id = cat_id;
END $$

DELIMITER ;


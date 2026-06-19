CREATE DATABASE rough;
USE rough;

DROP DATABASE rough;

CREATE TABLE order_archive LIKE orderss;

SELECT * FROM order_archive;


CREATE EVENT archive_old_orders
ON SCHEDULE EVERY 1 MINUTE
DO
INSERT INTO order_archive
SELECT * FROM orderss
WHERE orderDate < NOW() - INTERVAL 6 MONTH;

SHOW events;

SELECT * FROM order_archive;

DROP event archive_old_orders;


CREATE TABLE coupons (
    coupon_id INT PRIMARY KEY,
    code VARCHAR(50) NOT NULL,
    discount_type VARCHAR(20) NOT NULL,
    discount_value INT NOT NULL,
    expiry_date DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL
);


INSERT INTO coupons VALUES
(1, 'WELCOME10', 'percentage', 10, '2025-06-30 23:59:59', 'active'),
(2, 'FLAT100', 'fixed', 100, '2025-07-15 23:59:59', 'active'),
(3, 'SUMMER5', 'percentage', 5, '2025-07-10 23:59:59', 'active'),
(4, 'SAVE50', 'fixed', 50, '2025-07-20 23:59:59', 'active'),
(5, 'NEWUSER20', 'percentage', 20, '2025-09-01 23:59:59', 'active');


SELECT * FROM coupons;


CREATE EVENT expire_coupons 
ON SCHEDULE EVERY 1 MINUTE
DO 
	UPDATE coupons SET status = 'expired' WHERE expiry_date < NOW();
    
SHOW events;

DROP EVENT expire_coupons;



-- Example - 3
-- Daily Sales Summary
-- Store daily sales total in a reporting table at midnight.

CREATE EVENT daily_sales_summary
ON SCHEDULE EVERY 1 DAY
STARTS TIMESTAMP(CURRENT_DATE + INTERVAL 1 DAY)
DO
INSERT INTO sales_report (report_date, total_sales)
SELECT CURDATE(), SUM(amount) FROM orders WHERE order_date = CURDATE();


-- Example - 4
-- Mark Inactive customers
-- Mark users as inactive if they haven't logged in for 30 days.


CREATE EVENT mark_inactive_users
ON SCHEDULE EVERY 1 DAY
DO
UPDATE users SET status = 'inactive'
WHERE last_login < NOW() - INTERVAL 30 DAY;


-- Example - 5
-- Clean Up Temp Data
-- Delete temporary rows older than 1 day from temp_sessions.

CREATE EVENT cleanup_temp_sessions
ON SCHEDULE EVERY 6 HOUR
DO
DELETE FROM temp_sessions
WHERE created_at < NOW() - INTERVAL 1 DAY;



-- Example - 6
-- Limited-Time Offers
-- Enable and disable offers automatically.

-- Activate offer

CREATE EVENT activate_offer
ON SCHEDULE AT '2025-07-05 00:00:00'
DO
UPDATE offers SET active = 1 WHERE id = 101;


-- Deactivate offer

CREATE EVENT deactivate_offer
ON SCHEDULE AT '2025-07-10 23:59:59'
DO
UPDATE offers SET active = 0 WHERE id = 101;


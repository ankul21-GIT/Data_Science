CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- Users Table
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer', 'Cash on Delivery') NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed', 'Refunded') DEFAULT 'Pending',
    transaction_id VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

-- Shipments Table
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    tracking_number VARCHAR(50) UNIQUE,
    shipping_status ENUM('Pending', 'Dispatched', 'In Transit', 'Delivered') DEFAULT 'Pending',
    estimated_delivery DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

-- Insert Users
INSERT INTO users (name, email, password, phone, address) VALUES
('John Doe', 'john@example.com', 'password123', '1234567890', '123 Main St, NY'),
('Jane Smith', 'jane@example.com', 'password123', '0987654321', '456 Elm St, CA'),
('Alice Johnson', 'alice@example.com', 'password123', '9876543210', '789 Oak St, TX');

-- Insert Categories
INSERT INTO categories (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Men and Women clothing'),
('Books', 'Various kinds of books');

-- Insert Products
INSERT INTO products (name, description, price, stock, category_id) VALUES
('Laptop', 'High performance laptop', 899.99, 10, 1),
('Smartphone', 'Latest model smartphone', 499.99, 20, 1),
('T-shirt', '100% Cotton T-shirt', 19.99, 50, 2),
('Novel', 'Bestselling fiction novel', 9.99, 100, 3);

-- Insert Orders
INSERT INTO orders (user_id, total_price, status) VALUES
(1, 519.98, 'Processing'),
(2, 899.99, 'Pending'),
(3, 19.99, 'Shipped');

-- Insert Order Items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 2, 1, 499.99),
(1, 3, 1, 19.99),
(2, 1, 1, 899.99),
(3, 3, 1, 19.99);

-- Insert Payments
INSERT INTO payments (order_id, payment_method, payment_status, transaction_id) VALUES
(1, 'Credit Card', 'Completed', 'TXN123456'),
(2, 'PayPal', 'Pending', 'TXN123457'),
(3, 'Cash on Delivery', 'Completed', NULL);

-- Insert Shipments
INSERT INTO shipments (order_id, tracking_number, shipping_status, estimated_delivery) VALUES
(1, 'TRACK123456', 'Dispatched', '2025-02-20'),
(2, 'TRACK123457', 'Pending', '2025-02-25'),
(3, 'TRACK123458', 'In Transit', '2025-02-18');


SELECT * FROM products;

SELECT product_id, name FROM products;


-- DISTINCT and ALIAS - The Distinct command in SQL is used to retrieve Unique data from a table.


SELECT * FROM users,products;

SELECT * FROM users;

SELECT name FROM users;

SELECT DISTINCT name FROM users;

SELECT name as n, email as e , phone FROM users u;


-- ORDER BY - The ORDER BY keyword is used to sort the result-set in ascending or descending order.

SELECT * FROM users ORDER BY user_id DESC;

SELECT * FROM products ORDER BY price;

SELECT * FROM products ORDER BY price DESC;



/*
Limit & Offset - The LIMIT clause is used to set an upper limit on the number of tuples returned by

SYNTAX

SELECT DISTINCT column1, column2, ...
FROM table_name LIMIT 5;

SELECT DISTINCT column1, column2, ...
FROM table_name LIMIT 5 OFFSET 10;
*/

SELECT * FROM users LIMIT 3;


-- OFFSET

SELECT * FROM users LIMIT 2,1;





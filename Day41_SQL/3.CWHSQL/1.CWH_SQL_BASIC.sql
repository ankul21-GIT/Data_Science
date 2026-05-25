CREATE DATABASE startersql;

USE startersql;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM users;

SELECT id, email FROM users;

-- How to rename the table.

RENAME TABLE users TO programmers;

RENAME TABLE programmers TO users;


-- How to add a new column in existing column.

ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

SELECT * FROM users;

-- How to drop a column

ALTER TABLE users DROP COLUMN is_active;


-- How to modify a column

ALTER TABLE users MODIFY COLUMN name VARCHAR(50);

-- How to modify column like email after id

ALTER TABLE users MODIFY COLUMN email VARCHAR(100) AFTER id;

SELECT * FROM users;

DROP DATABASE startersql;

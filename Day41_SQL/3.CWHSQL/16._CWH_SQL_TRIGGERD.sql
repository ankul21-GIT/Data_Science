CREATE DATABASE startersql;

USE startersql; 

CREATE TABLE user_log (
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
name VARCHAR(100),
created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO user_log (user_id, name)
    VALUES (NEW.id, NEW.name);
END $$

DELIMITER ;

INSERT INTO users (name, email, gender, date_of_birth, salary)
VALUES ('Rohan', 'rohan@rohan.com', 'Male', '2007-04-04', 56000);

SELECT * FROM user_log;

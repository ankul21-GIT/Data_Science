-- DATE TIME FUNCTION
/*
NOW()	 ------>  Returns current date and time (YYYY-MM-DD HH:MM:SS)
CURDATE()	----> Returns current date (YYYY-MM-DD)
CURTIME() ----->  Returns current time (HH:MM:SS)
SYSDATE()	--->  Returns the time at which the function executes
UTC_DATE()	--->  Returns current UTC date
UTC_TIME()	----> Returns current UTC time
UTC_TIMESTAMP()-> Returns current UTC date and time
LOCALTIME()	-->   Synonym for NOW()
LOCALTIMESTAMP()-> Synonym for NOW()
*/

USE  rough;

SELECT NOW();

SELECT CURDATE();

SELECT SYSDATE();

SELECT UTC_TIMESTAMP();

SELECT YEAR('2025-06-06');

SELECT * FROM orderss WHERE YEAR(orderDate) = '2004';

SELECT * FROM orderss WHERE DAY(orderDate) = '8';

SELECT * FROM orderss WHERE DAYNAME(orderDate) = 'Friday';

SELECT * FROM orderss WHERE DAYNAME(orderDate) = 'Monday' AND YEAR(orderDate) = '2004';

SELECT * FROM orderss WHERE orderDate BETWEEN '2004-01-01' AND ADDDATE('2004-01-01',15);

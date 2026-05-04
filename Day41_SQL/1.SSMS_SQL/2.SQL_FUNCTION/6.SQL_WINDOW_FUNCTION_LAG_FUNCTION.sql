CREATE  TABLE ProfitData (
    MonthNumber INT,
    MonthName VARCHAR(3),
    Product VARCHAR(50),
    Profit INT
);

-- Insert data into the ProfitData table

INSERT INTO ProfitData (MonthNumber, MonthName, Product, Profit) VALUES
(1, 'Jan', 'Product A', 1000),
(2, 'Feb', 'Product A', 1500),
(3, 'Mar', 'Product A', 1200),
(4, 'Apr', 'Product A', 1700),
(5, 'May', 'Product A', 1300),
(6, 'Jun', 'Product A', 1600),
(1, 'Jan', 'Product B', 2000),
(2, 'Feb', 'Product B', 2500),
(3, 'Mar', 'Product B', 2200),
(4, 'Apr', 'Product B', 2700),
(5, 'May', 'Product B', 2300),
(6, 'Jun', 'Product B', 2600);


SELECT * FROM ProfitData

--To add a new column that shows previous month's profit for each product
SELECT *,
LAG(Profit) OVER(PARTITION BY product ORDER BY monthnumber) [Lag Function]
FROM ProfitData

--We don't want product column inthe output but we want each month's total profit to be show by monthnumber & monthname,Also a 
--new column should be added to show previous month's total profit

SELECT MonthNumber,MonthName,sum(profit) AS [Total Profit for Month],
LAG(SUM(profit)) OVER(ORDER BY monthnumber) [Previous Month's Total Profit]
FROM ProfitData
GROUP BY MonthNumber,MonthName
ORDER BY MonthNumber
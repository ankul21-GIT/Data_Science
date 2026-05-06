
--Index

SELECT * FROM dbo.Employees

CREATE INDEX IX_1 ON dbo.employees(salary DESC)

CREATE INDEX IX_2 ON dbo.employees(firstname,lastname)

DROP INDEX dbo.employees.IX_1
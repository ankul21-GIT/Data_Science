
--Copying Data From existing table to the New table

--Case 1 : The New table simply doesn't exist
--Case 2: The New table structure/New Table exists

--CASE 1 :

SELECT * FROM dbo.Sales 

--All columns were copied from existing table
--This statement will result in the creation of New_Table_1 which will be having structure & records both
--same as that of dbo.sales table

SELECT * INTO New_Table_1 FROM dbo.Sales

-------------------Certain Columns to be copied
DROP TABLE New_Table_1

SELECT productid,quantity INTO new_table_1 FROM dbo.Sales

SELECT * FROM new_table_1


--CASE 2 : New table structure/table already exists

SELECT TOP 0 * INTO new_table_2 FROM dbo.Sales    --****************************

SELECT * FROM new_table_2

INSERT INTO new_table_2 SELECT * FROM dbo.Sales 

------Copying Certain Columns

SELECT * INTO new_table_3 FROM dbo.Sales WHERE 1=0  ---****************************

SELECT * FROM new_table_3

INSERT INTO new_table_3 (ProductID,SaleDate) SELECT productid,saledate FROM dbo.Sales


--Copying Data From existing table to the New table

--Case 1 : The New table simply doesn't exist
--Case 2: The New table structure/New Table exists

--CASE 1 :

SELECT * FROM dbo.Sales 

--All columns were copied from existing table
--This statement will result in the creation of New_Table_1 which will be having structure & records both
--same as that of dbo.sales table

SELECT * INTO new_table_1 FROM dbo.Sales

-------------------Certain Columns to be copied
DROP TABLE New_Table_1

SELECT productid,quantity INTO new_table_1 FROM dbo.Sales

SELECT * FROM new_table_1


--CASE 2 : New table structure/table already exists

SELECT TOP 0  * INTO new_table_2 FROM dbo.Sales  --****************************

SELECT * FROM new_table_2

INSERT INTO new_table_2 SELECT * FROM dbo.Sales 

------Copying Certain Columns

SELECT * INTO new_table_3 FROM dbo.Sales WHERE 1=0  ---****************************

SELECT * FROM new_table_3

INSERT INTO new_table_3 (ProductID,SaleDate) SELECT productid,saledate FROM dbo.Sales

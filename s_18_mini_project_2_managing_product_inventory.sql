-- Session 18 - Mini Project 2 - Managing Product Inventory

SHOW DATABASES;

CREATE DATABASE mini_project_2;

-- DROP DATABASE mini_project_2;

USE mini_project_02;

CREATE TABLE product (
	Product_Id INT,
     Product_Name VARCHAR (100),
	Price INT,
     Quantity INT,
     DOP DATE,
     Profit INT,
     Discount INT
);

DESC product;

INSERT INTO product (Product_Id, Product_Name, Price, Quantity, DOP, Profit, Discount)
VALUES
(1, "Keyboard", 730, 15, "2020-07-19", 20, 10),
(2, "Mouse", 550, 20, "2019-06-20", 15, 5),
(3, "RAM", 2250, 11, "2017-05-14", 10, 5),
(4, "Monitor", 4500, 25, "2018-05-03", 18, 8),
(5, "CPU", 5000, 10, "2019-06-06", NULL, 10);

SELECT * FROM product;

-- Write queries for the following
-- 01. Display details of all products
SELECT * FROM product;

-- 02. Display Product id, Product name and DOP of all products.
SELECT Product_Id, Product_Name, DOP FROM product;

-- 03. Display details of all products whose Price is less than 3000.
SELECT * FROM product WHERE Price < 3000;

-- 04. Display the details of all products whose DOP(Date of Purchase) is before 01-01-2019
SELECT * FROM product WHERE DOP < '2019-01-01';

-- 05. Display Profit and Discount of products whose DOP is after 25-06-2018.
SELECT Profit, Discount FROM product WHERE DOP > '2018-06-25';

-- 06. Display the detail of all products whose Profit is NULL.
SELECT * FROM product WHERE Profit IS NULL;

-- 07. Display the Product id, Product Name of all products whose Profit is not NULL.
SELECT Product_Id, Product_Name FROM product WHERE Profit IS NOT NULL;

-- 08. Display the Price of various products. A Price should appear only once.
SELECT DISTINCT Price FROM product;

-- 09. Display the detail of all products whose Profit is more than 10 and Discount is less than 10
SELECT * FROM product WHERE Profit > 10 AND Discount < 10;

-- 10. Display Product name and Price whose Product id is not 3.
SELECT Product_Name, Price FROM product WHERE Product_Id != 3;

-- 11. Display Product name, Quantity of all those product whose Price is not equal to 3000 or Profit is 10.
SELECT Product_Name, Quantity FROM product WHERE Price != 3000 OR Profit = 10;

-- 12. Display the detail of all products which are purchased in 2018.
SELECT * FROM product WHERE year(DOP) = 2018;

-- 13. Display the details of all products whose Price is more than 2000 and less than 4000.
SELECT * FROM Product WHERE Price > 2000 AND Price < 4000;

-- 14. Display Product id, Product Name and Quantity of all those product whose Quantity is between 10 and 20 (including both).
SELECT Product_id, Product_name, Quantity FROM Product WHERE Quantity BETWEEN 10 AND 20;

-- 15. Display the detail of Keyboard, Mouse and RAM.
SELECT * FROM Product WHERE Product_name IN ('Keyboard', 'Mouse', 'RAM');

-- 16. Display Product Name and Quantity of product whose Price is 730 or 550.
SELECT * FROM Product WHERE Product_name IN ('Keyboard', 'Mouse', 'RAM');

-- 17. Display Profit, Date of Purchase of products whose name ends with ‘d’.
SELECT Profit, DOP FROM Product WHERE Product_name LIKE '%d';

-- 18. Display details of all those products whose Price is more than 2000 and name contains ‘a’ alphabet.
SELECT * FROM Product WHERE Price > 2000 AND Product_name LIKE '%a%';

-- 19. Display Product name, Profit and Discount of all those product whose name does not contain ‘e’ as Second alphabet.
SELECT Product_name, Profit, Discount FROM Product WHERE Product_name NOT LIKE '_e%';

-- 20. Display detail of all products in ascending order of Price.
SELECT * FROM Product ORDER BY Price ASC;

-- 21. Increase the Price by 2 of all products whose Profit is less than 10.
UPDATE Product SET Price = Price + 2 WHERE Profit < 10;

-- 22. Display the total amount (Price * Quantity) for all products.
SELECT SUM(Price * Quantity) AS Total_Amount FROM Product;

-- 23. Delete all the products which are purchased in year 2018.
DELETE FROM Product WHERE YEAR(DOP) = 2018;

-- 24. Delete all products which are purchased after January 2018 and Profit is less than 1.
DELETE FROM Product WHERE DOP > '2018-01-31' AND Profit < 1;

-- 25. Delete the record of product Keyboard and Mouse.
DELETE FROM Product WHERE Product_name IN ('Keyboard', 'Mouse');

-- 26. Delete all the records from table Product.
DELETE FROM Product;

-- 27. Display the structure of table.
DESCRIBE Product;

-- 28. Add column Tax of type integer(2) in table Product.
ALTER TABLE Product ADD COLUMN Tax INT(2);

-- 29. Delete the column Tax from Product table.
ALTER TABLE Product DROP COLUMN Tax;

-- 30. Display the total of Price column from Product table.
SELECT SUM(Price) AS Total_Price FROM Product;

-- 31. Count the product whose Price is more than 1000.
SELECT COUNT(*) AS Count_Above_1000 FROM Product WHERE Price > 1000;

-- 32. Display the detail of costliest product.
SELECT * FROM Product WHERE Price = (SELECT MAX(Price) FROM Product);

-- 33. Display the detail of cheapest product.
SELECT * FROM Product WHERE Price = (SELECT MIN(Price) FROM Product);

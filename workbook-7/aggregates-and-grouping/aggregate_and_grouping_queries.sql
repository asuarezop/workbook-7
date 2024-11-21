SELECT * FROM Suppliers;

-- Querying for all products from supplier Tokyo Traders
SELECT ProductID, ProductName, UnitPrice, SupplierID FROM Products
WHERE SupplierID = 4;

SELECT SUM(Salary) FROM Employees;

-- Querying for product with the minimum, max unit price, and the average unit price for products
SELECT MIN(UnitPrice) FROM Products;

SELECT AVG(UnitPrice) FROM Products;

SELECT MAX(UnitPrice) FROM Products;

-- Querying for number of products sold for each supplier
SELECT SUM(UnitsInStock) FROM Products
GROUP BY SupplierID;
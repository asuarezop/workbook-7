-- Exercise 5

-- Querying for all products with ProductID, ProductName, UnitPrice, and CategoryName joining with Categories table
SELECT ProductID, ProductName, UnitPrice, CategoryName FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY CategoryName, ProductName;

-- Querying for products that have a unit price greater than $75, joined with Suppliers to view CompanyName
SELECT ProductID, ProductName, UnitPrice, CompanyName FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE UnitPrice > 75 
ORDER BY ProductName;

-- Querying for products with multiple properties from 3 different tables (Products, Suppliers, and Categories)
SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY ProductName;




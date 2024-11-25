-- Exercise 5

-- Querying for all products with ProductID, ProductName, UnitPrice, and CategoryName joining with Categories table
SELECT ProductID, ProductName, UnitPrice, CategoryName FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
ORDER BY CategoryName, ProductName;


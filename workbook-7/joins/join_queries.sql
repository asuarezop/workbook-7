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

-- Querying for the most expensive product from all categories
SELECT ProductName, CategoryName, UnitPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products
GROUP BY CategoryName
);

-- Alternate SOLUTION
-- Select CategoryID,ProductName,UnitPrice
-- from Products AS p1
-- where UnitPrice = (select  MAX(UnitPrice) from Products AS p2
-- 					where p1.CategoryID = p2.CategoryID
-- 					)
-- order by UnitPrice desc;

-- Querying for all the most expensive products from each category
SELECT Products.ProductName, CategoryName, MAX(UnitPrice) AS MaximumPrice
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE Products.UnitPrice = (SELECT MAX(UnitPrice) FROM Products
WHERE Products.CategoryID = (SELECT Categories.CategoryID ))
GROUP BY CategoryName, Products.ProductName;

-- Querying for all the orders that have shipped from Germany
SELECT OrderID, ShipName, ShipAddress, ShipCountry, CompanyName FROM Shippers
LEFT JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
WHERE ShipCountry = 'Germany';

-- Querying for all the orders that contain product 'Sasquatch Ale'
SELECT Orders.OrderID, OrderDate, ShipName, ShipAddress, `Order Details`.ProductID, Products.ProductName 
FROM Orders
JOIN `Order Details` ON `Order Details`.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = `Order Details`.ProductID 
WHERE Products.ProductName = 'Sasquatch Ale';
    
-- Alternative implementation to find all orders with product 'Sasquatch Ale' using Nested queries    
SELECT Orders.OrderID, OrderDate, ShipName
FROM Orders
WHERE Orders.OrderID IN 
  (SELECT OrderID FROM `Order Details`
  WHERE ProductID = 
    (SELECT ProductID 
     FROM Products
     WHERE ProductName = 'Sasquatch Ale'));

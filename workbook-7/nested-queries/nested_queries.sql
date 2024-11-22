-- Exercise 4
SELECT ProductID, ProductName, UnitPrice FROM Products;

-- Finding the product with the highest unit price for products
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

SELECT OrderID, ShipName, ShipAddress, ShipVia FROM Orders;
SELECT ShipperID, CompanyName FROM Shippers;

-- Querying for all orders that shipped from Federal Shipping inside Orders
SELECT OrderID, ShipName, ShipAddress, ShipVia FROM Orders
WHERE ShipVia = (SELECT ShipperID FROM Shippers
WHERE CompanyName = 'Federal Shipping'
);

SELECT OrderID, ProductID FROM `Order Details`;
SELECT ProductID, ProductName FROM Products;
  
-- Querying for all order ids on orders that requested for Sasquatch Ale product
SELECT OrderID, ProductID FROM `Order Details`
WHERE ProductID = (SELECT ProductID FROM Products
WHERE ProductName = 'Sasquatch Ale');

-- Querying for employee who sold order 10266
SELECT EmployeeID, LastName, FirstName, Title FROM Employees
WHERE EmployeeID = (SELECT EmployeeID FROM Orders
WHERE OrderID = '10266');

-- Querying for customer who bought order 10266
SELECT CustomerID, ContactName, ContactTitle FROM Customers
WHERE CustomerID = (SELECT CustomerID FROM Orders
WHERE OrderID = '10266');
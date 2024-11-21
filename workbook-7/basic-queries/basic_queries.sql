-- Exercise 2 (Querying for product ID, product name, and unit price from products table)
SELECT ProductId, ProductName, UnitPrice FROM products;

-- Querying for product ID, product name, and unit price from products table, order by Price in ASCENDING 
SELECT ProductId, ProductName, UnitPrice FROM products
ORDER BY UnitPrice ASC;

-- Querying for products with UnitPrice less than 7.50 
SELECT ProductID, ProductName, UnitPrice FROM Products
WHERE UnitPrice < 7.50;

-- Querying for products greater than 100 and order by UnitPrice in DESC order
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC;

-- Querying for products where units in stock is 0 and units on order is at least 1
SELECT ProductID, ProductName, UnitPrice, UnitsInStock FROM Products
WHERE UnitsInStock = 0 && UnitsOnOrder >= 1
ORDER BY ProductName;

SELECT * FROM Categories;

-- Querying for all products from seafood category
SELECT ProductID, ProductName, UnitPrice, CategoryID FROM Products
WHERE CategoryID = 8;

SELECT EmployeeID, LastName, FirstName FROM Employees;

-- Querying for all employees with manager in their title
SELECT EmployeeID, LastName, FirstName, Title FROM Employees
WHERE Title LIKE '%Manager';

SELECT DISTINCT Title FROM Employees;

-- Querying for all employees that have a salary between 2000 and 2500
SELECT EmployeeID, LastName, FirstName, Title FROM Employees
WHERE Salary BETWEEN 2000 AND 2500;
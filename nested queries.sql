use northwind;
-- 1. Most expensive product(s)
SELECT ProductName
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- 2. Orders shipped via Federal Shipping
SELECT OrderID, ShipName, ShipAddress
FROM Orders
WHERE ShipperID = (SELECT ShipperID FROM Shippers WHERE ShipperName = 'Federal Shipping');

-- 3. Orders that contain Sasquatch Ale
SELECT DISTINCT od.OrderID
FROM `Order Details` od
WHERE od.ProductID = (SELECT ProductID FROM Products WHERE ProductName = 'Sasquatch Ale');

-- 4. Employee who sold order 10266
SELECT CONCAT(FirstName, ' ', LastName) AS EmployeeName
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
WHERE o.OrderID = 10248;

-- 5. Customer who bought order 10266
SELECT ContactName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID = 10248;
-- Total Revenue
SELECT SUM(TotalAmount) AS Total_Revenue
FROM Sales;

-- Total Orders
SELECT COUNT(OrderID) AS Total_Orders
FROM Orders;

-- Total Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM Orders;

-- Revenue by Category
SELECT p.Category,
       SUM(s.TotalAmount) AS Revenue
FROM Sales s
JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- Top Selling Products
SELECT p.ProductName,
       SUM(s.Quantity) AS Total_Quantity
FROM Sales s
JOIN Products p
ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Total_Quantity DESC;

-- Revenue by City
SELECT c.City,
       SUM(s.TotalAmount) AS Revenue
FROM Sales s
JOIN Orders o
ON s.OrderID = o.OrderID
JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY Revenue DESC;

-- Top 10 Customers by Revenue
SELECT c.CustomerName,
       SUM(s.TotalAmount) AS Revenue
FROM Sales s
JOIN Orders o
ON s.OrderID = o.OrderID
JOIN Customers c
ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY Revenue DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT MONTH(o.OrderDate) AS Month,
       SUM(s.TotalAmount) AS Revenue
FROM Sales s
JOIN Orders o
ON s.OrderID = o.OrderID
GROUP BY MONTH(o.OrderDate)
ORDER BY Month;
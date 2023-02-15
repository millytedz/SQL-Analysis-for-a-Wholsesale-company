--- number of total products
SELECT count(DISTINCT(ProductName))
FROM products;

--- top 10 most ordered product
SELECT p.ProductID, ProductName, SUM(Quantity) AS 'Quantity ordered'
FROM products p
JOIN wholesale_store.order o USING (ProductID)
GROUP BY ProductName
ORDER BY SUM(Quantity) desc
LIMIT 10;

--- Products generating the highest revenue
SELECT p.ProductID, ProductName, ROUND(SUM(Linetotal), 2) AS 'Revenue($)'
FROM products p
JOIN wholesale_store.order o USING (ProductID)
GROUP BY ProductName
ORDER BY SUM(Linetotal) DESC;

--- cities generating high revenues and accompanied orders
SELECT ShipCountry,ShipCity,SUM(Quantity) AS 'Quantity ordered', ROUND (SUM(Linetotal)) AS 'Revenue($)'
FROM products p
JOIN wholesale_store.order o USING (ProductID)
GROUP BY ShipCity
ORDER BY SUM(Linetotal) DESC



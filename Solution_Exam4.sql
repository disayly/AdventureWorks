SELECT c.CustomerID, st.TerritoryID, st.Name, DATE(soh.OrderDate) as order_date
FROM salesorderheader soh
LEFT JOIN customer c ON soh.CustomerID = c.CustomerID
LEFT JOIN salesterritory st ON st.TerritoryID = c.TerritoryID
WHERE soh.OrderDate >= '2001-09-01' - interval 30 day
GROUP BY st.TerritoryID, c.CustomerID
ORDER BY st.TerritoryID, c.CustomerID
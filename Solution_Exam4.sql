SELECT 
c.CustomerID,  st.TerritoryID, st.Name
FROM customer c
LEFT JOIN salesterritory st ON c.TerritoryID =  st.TerritoryID
WHERE c.CustomerID NOT IN (SELECT CustomerID FROM salesorderheader
WHERE OrderDate BETWEEN '2002-07-16' AND '2002-08-16')
GROUP BY st.TerritoryID, c.CustomerID
ORDER BY st.TerritoryID, c.CustomerID
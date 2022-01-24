SELECT 
st.TerritoryID,
st.Name,
SUM(sod.OrderQty * sod.UnitPrice) as Sales,
MONTHNAME(soh.ShipDate) as Month,
YEAR(soh.ShipDate) as Year
FROM salesorderdetail sod
LEFT JOIN salesorderheader soh ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN salesterritory st ON st.TerritoryID = soh.TerritoryID
WHERE MONTHNAME(soh.ShipDate) = 'July'
GROUP BY Year, MONTH(soh.ShipDate), st.TerritoryID
ORDER BY Year, Sales DESC
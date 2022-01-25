SELECT 
st.TerritoryID,
st.Name,
SUM(sod.OrderQty * sod.UnitPrice) as Sales,
MONTHNAME(soh.ShipDate) as Month,
YEAR(soh.ShipDate) as Year
FROM salesorderdetail sod
LEFT JOIN salesorderheader soh ON sod.SalesOrderID = soh.SalesOrderID 
LEFT JOIN salesterritory st ON soh.TerritoryID = st.TerritoryID
WHERE MONTHNAME(soh.ShipDate) = 'July'
GROUP BY Year, MONTH(soh.ShipDate), st.TerritoryID
ORDER BY Year, Sales DESC
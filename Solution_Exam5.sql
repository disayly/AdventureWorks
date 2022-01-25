SELECT 
st.TerritoryID,
st.Name,
SUM(sod.OrderQty * sod.UnitPrice) as Sales,
MONTHNAME(soh.ShipDate) as Month,
Year(soh.ShipDate) as Year
FROM salesterritory st
LEFT JOIN salesorderheader soh ON st.TerritoryID = soh.TerritoryID 
LEFT JOIN salesorderdetail sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.shipDate > '2001-07-16' - interval 7 day
GROUP BY Year(soh.ShipDate), Month(soh.ShipDate), st.TerritoryID
ORDER BY Year(soh.ShipDate), Month(soh.ShipDate) ASC
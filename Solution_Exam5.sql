SELECT 
st.TerritoryID,
st.Name,
SUM(sod.OrderQty * sod.UnitPrice) as Sales,
MONTHNAME(soh.ShipDate) as Month,
Year(soh.ShipDate) as Year,
soh.ShipDate
FROM salesterritory st
LEFT JOIN salesorderheader soh ON soh.TerritoryID = st.TerritoryID
LEFT JOIN salesorderdetail sod ON sod.SalesOrderID = soh.SalesOrderID
WHERE soh.shipDate >= '2001-07-15 00:00:00' - interval 7 day
#WHERE soh.TerritoryID = 5
GROUP BY st.TerritoryID, Year, Month
ORDER BY  Year, Month, st.TerritoryID,  Sales DESC
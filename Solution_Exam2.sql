SELECT * FROM (SELECT 
soh.SalesPersonID,
SUM(sod.OrderQty * sod.UnitPrice) as Sales,
st.TerritoryID,
st.name,
MONTHNAME(soh.ShipDate) AS Month,
YEAR(soh.ShipDate) AS Year
FROM salesorderdetail sod
LEFT JOIN salesorderheader soh ON soh.SalesOrderID = sod.SalesOrderID
LEFT JOIN salesterritory st ON st.TerritoryID = soh.TerritoryID
WHERE soh.SalesPersonID !="" 
GROUP BY  soh.TerritoryID, Year, MONTH(soh.shipDate), soh.SalesPersonID
ORDER BY Year,  MONTH(soh.shipDate), soh.TerritoryID,  Sales DESC) as A
GROUP BY TerritoryID, Month



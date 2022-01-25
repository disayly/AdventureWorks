SELECT * FROM (SELECT
MONTHNAME(soh.ShipDate) as Month,
YEAR(soh.ShipDate) as Year,
prc.ProductCategoryID,
prc.Name as Category,
pr.ProductSubcategoryID,
prsc.name as SubCatergory,
SUM(sod.OrderQty) as order_qty,
pr.ProductID
from salesorderdetail sod
LEFT JOIN product pr ON sod.ProductID = pr.ProductID
LEFT JOIN  productsubcategory prsc ON pr.ProductSubcategoryID = prsc.ProductSubcategoryID
LEFT JOIN  productcategory prc ON prsc.ProductCategoryID = prc.ProductCategoryID
LEFT JOIN  salesorderheader soh ON sod.SalesOrderID = soh.SalesOrderID
GROUP BY YEAR(soh.ShipDate), MONTH(soh.ShipDate),  pr.ProductSubcategoryID, sod.ProductID
ORDER BY YEAR(soh.ShipDate), MONTH(soh.ShipDate), prc.ProductCategoryID, pr.ProductSubcategoryID,  order_qty DESC) AS A
GROUP BY ProductSubcategoryID
SELECT
MONTHNAME(soh.ShipDate) as Month,
prc.ProductCategoryID,
prc.Name,
sum(sod.OrderQty) as order_qty,
prc.ProductCategoryID
from salesorderdetail sod
LEFT JOIN product pr ON sod.ProductID = pr.ProductID
LEFT JOIN  productsubcategory prsc ON prsc.ProductSubcategoryID = pr.ProductSubcategoryID
LEFT JOIN  productcategory prc ON prc.ProductCategoryID = prsc.ProductCategoryID
LEFT JOIN  salesorderheader soh ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY MONTH(soh.ShipDate), prc.ProductCategoryID
ORDER BY MONTH(soh.ShipDate), prc.ProductCategoryID, order_qty DESC
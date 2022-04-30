//Show OrdeQty, the Name and the ListPrice of the order made by CustomerID 635
SELECT sod.OrderQty, p.Name, p.ListPrice
FROM SalesOrderHeader soh 
INNER JOIN SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Product p on p.ProductID = sod.ProductID
WHERE soh.CustomerID = 635;

//Show all the addresses listed for 'Modular Cycle Systems'
SELECT CompanyName,AddressType,AddressLine1 FROM Customer 
INNER JOIN CustomerAddress ON Customer.CustomerID=CustomerAddress.CustomerID
INNER JOIN Address ON CustomerAddress.AddressID=Address.AddressID
WHERE CompanyName='Modular Cycle Systems'


//For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.
SELECT 
MAX(CASE WHEN ca.AddressType = 'Main Office' THEN a.AddressLine1 ELSE NULL END) as MainOffice,
MAX(CASE WHEN ca.AddressType = 'Shipping' THEN a.AddressLine1 ELSE NULL END) as Shipping, MAX(a.City) as City
FROM customer c
INNER JOIN CustomerAddress ca ON ca.CustomerID = c.CustomerID
INNER JOIN Address a ON a.AddressID = ca.AddressID
WHERE a.City = 'Dallas'
GROUP BY c.CustomerID


//For each order show the SalesOrderID and SubTotal calculated three ways:
//A) From the SalesOrderHeader
//B) Sum of OrderQty*UnitPrice
//C) Sum of OrderQty*ListPrice

SELECT soh.SalesOrderID, soh.SubTotal, sum(sod.OrderQty*sod.UnitPrice) as SumOfUnitPrice,
sum(sod.OrderQty*p.ListPrice) as SumOfListPrice
FROM SalesOrderHeader soh
INNER JOIN SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Product p ON p.ProductID = sod.ProductID
group by soh.salesOrderId,soh.SubTotal;

//Show the best selling item by value.


SELECT p.Name, SUM(sod.OrderQty * sod.UnitPrice) as OrderQty
FROM Product p
INNER JOIN SalesOrderDetail sod
ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY OrderQty 
DESC;

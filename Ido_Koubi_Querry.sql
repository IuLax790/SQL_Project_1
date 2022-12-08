use Company

SELECT * from Products
SELECT orders.OrderID ,orders.ProductID,Customers.CustomerId,Customers.FirstName,
Customers.LastName,
Products.ProductName,  cast(Products.UnitPrice as varchar)+'$' as 'Price per unit'  ,cast(Freight as varchar)+'$' as Shipping_cost,ShipAddress,ShipCity,ShipCountry from orders join Products ON orders.ProductID = Products.ProductID 
join Customers on orders.CustomerID= Customers.CustomerID

SELECT Shippers.OrderID, orders.ShipCity,orders.ShipCountry,orders.ShipAddress,Shippers.ShippingTime,shippers.TrackingNumber 
from Shippers 
join orders on Shippers.OrderID = orders.OrderID
----select productName, categoryName from Products, Categories
----where products.CategoryID=categories.CategoryID

----select productName, categoryName from Products
----inner join Categories on Products.CategoryID = Categories.CategoryID;

----select CompanyName, ProductName from Suppliers, Products	
----where Suppliers.SupplierID=Products.SupplierID			zle



----select ProductName, CompanyName from Products p
----inner join Suppliers s on p.SupplierID=s.SupplierID;				dobrze

----select 
----ProductName, CategoryName, CompanyName
----from Categories c 
----inner join Products p on c. CategoryID=p.CategoryID
----inner join Suppliers s on p.SupplierID=s.SupplierID;

----select
----d.UnitPrice, Quantity, Discount, OrderDate, RequiredDate, ShippedDate, CompanyName, ProductName
----from Products p
----inner join [Order Details] d on p.ProductID=d.ProductID
----inner join Orders o on d.OrderID=o.OrderID
----inner join Customers c on o.CustomerID=c.CustomerID;

----select
----count(d.OrderID) as ile, ProductName
----from Products p
----inner join [Order Details] d on p.ProductID=d.ProductID
----inner join Orders o on d.OrderID=o.OrderID
----inner join Customers c on o.CustomerID=c.CustomerID
----group by ProductName order by ile desc;

----select
----count(d.OrderID) as ile, CategoryName
----from Products p
----inner join [Order Details] d on p.ProductID=d.ProductID
----inner join Orders o on d.OrderID=o.OrderID
----inner join Categories n on p.CategoryID=n.CategoryID
----group by CategoryName order by ile desc;

----select productName, CategoryName from products p
----right join Categories c on p.CategoryID=c.CategoryID;

----select productName, CategoryName from products p
----right join Categories c on p.CategoryID=c.CategoryID
----where ProductName is not null;

----select o.OrderID, c.CustomerID from Customers c
----left join Orders o on c.CustomerID=o.CustomerID
----where o.OrderID is null;

----select
----d.UnitPrice, Quantity, Discount, OrderDate, RequiredDate, ShippedDate, CompanyName, ProductName
----from Products p
----left join [Order Details] d on p.ProductID=d.ProductID
----left join Orders o on d.OrderID=o.OrderID
----left join Customers c on o.CustomerID=c.CustomerID;

--select
--e.LastName, e.FirstName, p.LastName, p.FirstName
--from Employees e
--right join Employees p on e.EmployeeID=p.ReportsTo
__________________
--select avg(UnitPrice) from Products;

--select ProductName, UnitPrice, (select avg(UnitPrice) from Products) as srednia from Products
--where UnitPrice > (select avg(28.87) from Products);



--select ProductName, opis from(

--select ProductName, UnitPrice,
--case 
--when UnitPrice <= 30 then 'Tanie'
--when UnitPrice between 31 and 60 then 'Srednie'
--when UnitPrice between 61 and 100 then 'Drogie'
--when UnitPrice > 100 then 'Bardzo drogie'
--else 'inne'
--end as opis
--from Products) as abc
--where opis like 'Drogie';

--select * from(
--select count(OrderID) as ile, CompanyName from Customers c
--inner join Orders o on c.CustomerID=o.CustomerID
--group by CompanyName) as ab
--where ile = 5;

--select ProductName from Products
--where SupplierID in(select SupplierID from Suppliers where Country like 'USA' or Country like 'UK');

--select ProductName from Products
--where SupplierID in(select SupplierID from Suppliers where Country in('USA','UK'));

--select ProductName from Products
--where exists (select SupplierID from Suppliers where Country like 'France');


--select ProductName from Products
--where UnitPrice = any(select UnitPrice from [Order Details] where Quantity=100)

--select ProductName from Products
--where UnitPrice > all(select UnitPrice from [Order Details] where Quantity=100)


select OrderID, round(sum(wart),2) as wartosc from (
select OrderID, UnitPrice*Quantity*(1-Discount) as wart
from [Order Details] 
) as ab
group by OrderID
having sum(wart) < (select avg(UnitPrice*Quantity*(1-Discount)) from [Order Details]);

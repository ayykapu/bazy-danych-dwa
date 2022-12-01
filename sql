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

Use Northwind;
Select * from Customers;
Select * from Orders;
Select * from Order_Details;
Select * from Products where productname='';
Select * from Categories;
Select * from Shippers;
Select * from Suppliers;
Select * from Employees;
Select * from EmployeeTerritories;
Select * from Territories;
Select * from region;
Select * from DailyLoad$;
Select * from Categories;
Select * from CustomerCustomerDemo;
select * from mps;
select * from CustomerCustomerDemo ;
1.
Select * 
	from Customers C
	join Orders O
	on C.CustomerID=O.CustomerID
	where OrderDate between '1996-07-01' and '1997-07-01';

2.
Select Emp.EmployeeID,Emp.FirstName,Emp.LastName,Ter.TerritoryDescription,reg.RegionDescription
	from 	Employees Emp
	join EmployeeTerritories Emp_ter
	on  Emp.Employeeid=Emp_ter.Employeeid
	join Territories Ter
	on Emp_ter.TerritoryID=Ter.TerritoryID
	join region reg
	on Ter.RegionID=reg.RegionID
	where reg.RegionDescription='Eastern' and Ter.TerritoryDescription='Cambridge';

3.
Select Cus.CustomerID,Cus.contactname,Ord.OrderId,productname,ShipName
	from Customers Cus
	join Orders Ord
	on Cus.CustomerID=Ord.CustomerID
	join Order_Details Ord_det
	on Ord_det.OrderID=Ord.OrderID
	join Products Pro
	on Pro.ProductID=Ord_det.ProductID;

4.
Select Ord_det.Orderid,ProductName,Ord_det.Unitprice,Quantity,New_Discount=
	Case
		when Ord_det.Discount=0 THEN (Pro.unitprice/100)*2
		when Ord_det.Discount > 0.1 THEN (Pro.unitprice/100)*3
		when Ord_det.Discount < 0.1 THEN(Pro.unitprice/100)*4
	END
	from Order_Details Ord_det
	join Products Pro
	on Pro.ProductID=Ord_det.ProductID;

5.
Select PRO.Unitprice,Quantity,
	Case
		when Ord_det.Discount=0 THEN (Pro.unitprice/100)*2
		when Ord_det.Discount > 0.1 THEN (Pro.unitprice/100)*3
		when Ord_det.Discount < 0.1 THEN (Pro.unitprice/100)*4
		else (Pro.unitprice/100)*6
	END as New_Discount,(Pro.Unitprice-Case
		when Ord_det.Discount=0 THEN (Pro.unitprice/100)*2
		when Ord_det.Discount > 0.1 THEN (Pro.unitprice/100)*3
		when Ord_det.Discount < 0.1 THEN (Pro.unitprice/100)*4
		else (Pro.unitprice/100)*6
	END) *Quantity as cost
	from Order_Details Ord_det
	join Products Pro
	on Pro.ProductID=Ord_det.ProductID;
6.
Select Cus.CustomerID,ContactName,CompanyName
	from Customers Cus
	left join Orders Ord
	on Cus.CustomerId=Ord.CustomerId
	where Ord.CustomerId is null;

7.
Select Productname,CategoryID,Unitprice,Unitsinstock,unitsonorder,reorderlevel,Supplier_Existence=
	case
		when Discontinued=0 THEN 'Supplier Exists'
		when Discontinued>0 THEN 'Not Exists'
	End,CompanyName as supplier, contactname as Supplier_Name, Address as Supplier_Address, Phone AS Supplier_Phone
	from  Products Pro
	join Suppliers sup
	on Pro.supplierID=sup.supplierID;
8.

Select * from Products;
Select * from Categories;
Select Supplier_Existence=
	case
		when Discontinued=0 THEN 'Supplier Exists'
		when Discontinued>0 THEN 'Not Exists'
	End,Cat.CategoryName
	from  Products Pro
	join Suppliers sup
	on Pro.supplierID=sup.supplierID
	join Categories Cat
	on Pro.categoryID=Cat.categoryID
	where Pro.discontinued=0 and Cat.CategoryName in('Dairy Products' ,'Confections') ;

9.
Select * from Employees;

10.
Select * from Employees where title not like '%Manager%';

11.
Select * 
	from Customers Cus
	join Orders Ord
	on Cus.CustomerID=Ord.CustomerID
	join Employees Emp
	on Emp.EmployeeID=Ord.EmployeeID
	where Cus.Contacttitle='Sales Representative' and 
	Ord.orderdate between  '1996-10-03' and '1997-09-30' and
	Ord.shippeddate between  '1996-10-03' and '1997-09-30';

12.
Select Shipname,Shipaddress,Shipcity,shipRegion,Shippeddate,ShipPostalCode,ShipCountry
	from Customers Cus
	join Orders Ord
	on Cus.CustomerID=Ord.CustomerID
	join Employees Emp
	on Emp.EmployeeID=Ord.EmployeeID
	where Cus.Contacttitle='Sales Representative' and 
	Ord.orderdate between  '1996-10-03' and '1997-09-30' and
	Ord.shippeddate between  '1996-10-03' and '1997-09-30';
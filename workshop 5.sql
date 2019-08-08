
use Northwind;
SELECT Table_Name, Column_Name 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_CATALOG = 'Northwind'
AND COLUMN_NAME LIKE '%Shipper%'
select * from products;
select * from suppliers;
select * from shippers;
select * from Categories;
1.
select Productname,companyname 
from products p
join suppliers s
on p.supplierid=s.supplierid;

2.
select * from products;
select * from shippers;
select * from Categories;
select Productname,CategoryName ,Companyname
from products p
join suppliers s
on p.supplierid=s.supplierid
join Categories c
on p.CategoryID=c.CategoryID;
3.
select * from orders;
select * from Customers;
select * from order_details;
select * from products;
Select O.OrderID,ContactName ,sum(OD.Quantity) as Num_Products
from Customers C
join Orders O
on C.CustomerID=O.CustomerID
join order_details OD
on OD.OrderID=O.OrderID 
Group by o.OrderID,ContactName
4.
select * from orders;
select * from Customers;
select * from shippers;
Select O.OrderID,ContactName,s.CompanyName
from Customers C
join Orders O
on C.CustomerID=O.CustomerID
join shippers S
on S.ShipperID=O.ShipVia
where O.Shipcountry='Brazil' ;
5.
select * from orders;
select * from order_details;
select * from Customers;
select * from Employees;
select * from order_details;
Select O.OrderID,ContactName,concat(FirstName,lastName) as name,
case
when Discount=0 then UnitPrice*Quantity
when Discount!=0 then (UnitPrice-(UnitPrice*Discount))*Quantity
end Amount
from Customers C
join Orders O
on C.CustomerID=O.CustomerID
join Employees E
on E.EmployeeID=O.EmployeeID
join order_details OD
on OD.OrderID=O.OrderID 
where e.Title like'%sale%';
6.
select * from orders;
select * from order_details;
select * from Customers;
select * from Employees;
select * from products;
Select Productname
from products P
join order_details OD
on p.ProductId=od.ProductId
join orders O
on OD.OrderID=O.OrderID
join Employees E
on E.EmployeeID=O.EmployeeID
where Title='Sales Manager';

7.
select * from suppliers;
select * from products;
select * from suppliers;
Select p.Productid,S.SupplierID,ProductName,country,city,region=case
when region is null then upper(concat(left(country,1),left(city,1)))
else region end 
from suppliers S
join products P
on S.SupplierID=P.SupplierID;
8.
select * from suppliers;
select * from products;
Select companyName,ContactName,ProductName,UnitPrice,S.SupplierID,Contacttitle,address,City,region=case
when region is null then upper(concat(left(country,1),left(city,1)))
else region end,Postalcode,country,Phone,
Fax=case
when Fax is null then 'xxxxx'
else Fax end,
Homepage=case
when Homepage is null then 'xxxxx'
else Homepage end
from suppliers S
join products P
on s.SupplierID=P.SupplierID;
9.
select * from orders;
select * from order_details;
select * from Territories;
select * from EmployeeTerritories;
Select CustomerId,Shipname,ShipCity,T.TerritoryDescription, unitprice,Discount=
case 
when Discount=0 then 0.06*unitprice 
else Discount end,T.territoryID
from orders O
join order_details OD
on O.OrderId=OD.OrderId
join EmployeeTerritories ET
on ET.employeeId=O.employeeId
join Territories T
on T.territoryID=ET.territoryID  
where  (T.territoryID<=9999 and shipvia in(1,2) );
10.
select * from orders;
select * from order_details;
Select O.OrderId,CustomerId,UnitPrice,Quantity 
from orders O
join order_details OD
on O.OrderId=OD.OrderId
where Discount>0;
11.
select *from categories;
select * from products;
Select c.CategoryId,CategoryName,c.Description,Productname,Supplierid,Unitprice
from categories c
join products P
on C.CategoryId=p.CategoryId 
Select len(cast(Description as varchar(255)))-len(replace((cast(Description as varchar(255))),',','')) from categories ; 
Select len(cast(Description as varchar)) from categories ; 
Select len(cast(Description as varchar))-len(replace((cast(Description as varchar(255))),',','')) from categories ; 
Select case 
when 2<=len(cast(Description as varchar)) then 'fdsadf' end from categories; 
12.
select * from suppliers;
CREATE FUNCTION firstletter1 ( @str NVARCHAR(4000) )
RETURNS NVARCHAR(2000)
AS
BEGIN
    DECLARE @retval NVARCHAR(2000);

    SET @str=RTRIM(LTRIM(@str));
	SET @retval=LEFT(@str,1);
	WHILE CHARINDEX(' ',@str)>0 BEGIN
        SET @str=LTRIM(RIGHT(@str,LEN(@str)-CHARINDEX(' ',@str,1)));
		SET @retval+=LEFT(@str,1);
    END

    RETURN upper(@retval);
END
GO

select  [T5_Chandhra].[dbo].[firstletter](companyname) as sad from suppliers;
select left(companyname,1)from suppliers;
select upper(concat(left(companyname,1),left(substring(companyname,charindex(' ',companyname)+1,Len(companyname)),1))) as letter_each_words from suppliers;
select upper(concat(left(companyname,1),left(substring(companyname,charindex(' ',companyname)+1,Len(companyname)),1)
,left(substring(companyname,charindex(' ',(substring(companyname,charindex(' ',companyname)+1,Len(companyname))+1,Len(companyname)),1)))) as letter_each_words from suppliers;
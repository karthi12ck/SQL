Use Adventureworks;
SELECT table_name,COLUMN_NAME
FROM
  	INFORMATION_SCHEMA.COLUMNS
WHERE
	lower(column_name) like ('%store%');

select *from [Sales].[SalesPerson];
select *from [HumanResources].[vEmployee];
select *from [HumanResources].[Employee];
select *from [Sales].[SalesTerritory];
select *from [Sales].[SalesTerritoryHistory];
select *from [HumanResources].[EmployeeAddress];
select *from [Sales].[Store];
select *from [Sales].[Customer];

1. Write a query to display employee numbers and employee name (first name, last name) of all the sales employees who received an amount of 2000 in bonus.
Select  hum_empl.EmployeeID,Concat(hum_vempl.Firstname,hum_vempl.lastname) as name
	from [HumanResources].[Employee] hum_empl
	left join [HumanResources].[vEmployee] hum_vempl
	on hum_empl.EmployeeID=hum_vempl.employeeID
	left join  [Sales].[SalesPerson] sal_per
	on hum_empl.EmployeeID=sal_per.salespersonId
	where sal_per.bonus>2000;

2.
fetch address details of employees belonging to the state CA. If address is null, provide default value N/A.
select *from [Sales].[SalesPerson];
select *from [Sales].[SalesTerritory];
Select  concat(addressline1,addressline2) as address
	from [HumanResources].[vEmployee] hum_vemp
	left join [Sales].[SalesPerson] sal_per
	on hum_vemp.EmployeeID=sal_per.salespersonid
	join [Sales].[SalesTerritory] sal_ter
	on sal_ter.territoryID=sal_per.territoryID
	where CountryRegionCode='CA';

3. Write a query that displays all the products along with the SalesOrderID even if an order has never been placed for that product.
select product_pro.ProductID,sal_ord_details.ProductID
	from  [Production].[Product] product_pro
	left join  [Sales].[SalesOrderDetail] sal_ord_details
	on  product_pro.ProductID=sal_ord_details.ProductID;

4. Find the subcategories that have at least two different prices less than $15.
Select * from [Production].[Product];
Select * from [Production].[ProductSubcategory];
select * from [Production].[ProductCategory];


5.A.Write a query to display employees and their manager details. Fetch employee id,   employee first name, and manager id, manager name.
Select * from [HumanResources].[vEmployee];
Select * from [HumanResources].[Employee];
Select hum_vemp.employeeid,firstname,managerid 
	From  [HumanResources].[vEmployee] hum_vemp
	join [HumanResources].[Employee] hum_emp
	on hum_vemp.EmployeeID=hum_emp.EmployeeID;

5.BDisplay the employee id and employee name of employees who do not have manager.
Select * from [HumanResources].[vEmployee];
Select * from [HumanResources].[Employee];
Select hum_vemp.employeeid,firstname
	From  [HumanResources].[vEmployee] hum_vemp
	join [HumanResources].[Employee] hum_emp
	on hum_vemp.EmployeeID=hum_emp.EmployeeID
	where managerid is null;

7. Find all the customers who do not belong to any store.
select *from [Sales].[Store];
select *from [Sales].[Customer];
select*from [Sales].[Store];
select*from [Sales].[StoreContact];
select*from [Sales].[vIndividualCustomer]
Select hum_vemp.employeeid,firstname
	From  [HumanResources].[vEmployee] hum_vemp
	join [HumanResources].[Employee] hum_emp
	on hum_vemp.EmployeeID=hum_emp.EmployeeID
	where managerid is null;

9.
Display product number, description and sales of each product in the year 2001.
 select *from [Sales].[SalesOrderHeader];
 select *from [Sales].[SalesOrderDetail];
 select *from [Production].[Product];
select *from [Production].[ProductDescription];

 Select productNumber,(Orderqty*unitprice) as sales 
	from [Sales].[SalesOrderHeader] sal_ord_hea
	join  [Sales].[SalesOrderDetail] sal_ord_det
	on sal_ord_hea.salesorderid= sal_ord_det.salesorderid
	join [Production].[Product] Pro_product
	on Pro_product.productid=sal_ord_det.productid
	where year(sal_ord_det.modifieddate)=2001;

10.
select productnumber,max(sales_1) as '2001',max(sales_2) as '2002',max(sales_3) as '2003' from(
select productnumber,case when year(s.modifieddate) in (2001) then (orderqty * unitprice) end as sales_1,
case when year(s.modifieddate) in (2002) then (orderqty * unitprice) end as sales_2,
case when year(s.modifieddate) in (2003) then (orderqty * unitprice) end as sales_3,
from [sales].[salesorderheader] as 



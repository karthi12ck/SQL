CREATE Table Dept(
	Dept_id int PRIMARY KEY,
	Dept_Desc varchar(25)
);
CREATE Table Items_Sub(
    Items_id int PRIMARY KEY,
	Items_sub_desc varchar(25) NOT NULL,
	Item_expiry_Date date,
	Item_creation_date date,
	Amount int,check(amount>0)
);
CREATE TABLE Maker(
    Maker_id int PRIMARY KEY,
	Maker_Name varchar(25) NOT NULL,
	Maker_city varchar(25),
	Maker_address varchar(25),
	Maker_pincode int,
	Maker_Phone int
);
select * from maker;
CREATE TABLE Items(
    Items_id int PRIMARY KEY,
   	Items_desc varchar(25) NOT NULL,
    Items_sub_id int FOREIGN KEY REFERENCES Items_sub(Items_id),
    Quantity int,
    Items_Code varchar(25) UNIQUE,
    Items_dept_id int FOREIGN KEY REFERENCES Dept(Dept_id),
    Items_Maker_id int FOREIGN KEY REFERENCES Maker(Maker_id) ,
    Booked_Date date
);
INSERT INTO Dept
	VALUES (1000,'Toileteries'),
				(1001,'Eateries');

INSERT INTO Items_Sub
	VALUES  (50,'Cif','01/01/13','01/01/12',100),
			    (51,'Kele','01/01/13','01/01/12',50),
			    (60,'Borbon','12/01/14','12/01/11',200),
				(61,'Milk Biscuits','12/01/13','11/01/11',200),
				(70,'Pepsi','01/01/14','01/01/10',50);

INSERT INTO Maker
	VALUES  (1,'Roda','Mumbai','57,North Road',600057,37620927),
			    (2,'Marie','Chennai','23,East Road',600025,43392028),
			    (3,'PepsiCo','Delhi','12,1st Cross St',600021,91-9962567999),
				(4,'Dove','Delhi','13,North Road',2738,Null),
				(5,'Roda_A','Simla','787,West',13454,Null);

ALTER TABLE Maker ALTER COLUMN Maker_Phone VARCHAR(255);

UPDATE Maker SET Maker_Phone ='91-9962567999' WHERE Maker_id=3 ;
                              
INSERT INTO Items
	VALUES  (100,'Soap Liquids',50,2,'PRO100',1000,1,'01/01/12');

INSERT INTO Items (Items_id,Items_desc,Items_sub_id,Quantity,Items_Code,Items_dept_id,Items_Maker_id,Booked_Date)
	VALUES  (101,'Biscuits',60,1,'PRO101',1001,2,'12/01/11');

INSERT INTO Items
	VALUES  (102,'Drinks',70,4,'102DR',1001,3,'10/01/11'),
				(103,'Soap Liquids',51,1,'PRO103',1000,4,'04/01/12'),
				(104,'Biscuits',61,2,'PRO104',1001,2,'03/01/09');

UPDATE Items SET Items_Code= 'PRO102' WHERE Items_id=102;

SELECT Items_id,Items_desc,Items_Maker_id FROM Items;

SELECT Items_id,Items_desc FROM Items where Quantity>2;

SELECT Quantity+5 as New_quantity from items order by Quantity DESC;

SELECT SUM (Quantity +5) AS Monthly_Cross From Items Group by month(Booked_Date);

SELECT * from items where year(Booked_Date)=(2009);

SELECT * from Items where Booked_Date BETWEEN '01/06/11' AND '01/12/12';

SELECT * from Items where Items_Maker_id=2 AND Booked_Date BETWEEN  '01/01/2010' AND '01/12/2011';

SELECT Items_id,Items_desc from items order by Booked_Date DESC;

SELECT * into items_dup from items;
	DELETE FROM items_dup WHERE Items_Maker_id=2;
	DELETE FROM items_dup WHERE year(Booked_Date)=2012;
	DELETE FROM items_dup;
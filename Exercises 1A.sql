Use T5_Chandhra;
CREATE TABLE Discounts_mp(
    discounttype varchar(255),
    stor_id int FOREIGN KEY REFERENCES Stores_mp(stor_id),
    lowqty int,
    highqty int,
    discount float 
);

CREATE TABLE Stores_mp (
    stor_id int NOT NULL PRIMARY KEY,
    stor_name varchar(255),
    stor_address varchar(255),
    city varchar(255),
    Stores_state varchar(255),
	Zip int
);
CREATE TABLE Sales(
    stor_id int FOREIGN KEY REFERENCES Stores_mp(stor_id),
    ord_num varchar(255),
	ord_date datetime,
    qty int,
    payterms varchar(255),
    title_id varchar(255),
);
select * from Sales;
Drop table Sales;
CREATE TABLE Authors_mp(
    au_id varchar(255) NOT NULL PRIMARY KEY,
    au_lname  varchar(255),
	au_fname  varchar(255),
    phone varchar(255),
    address  varchar(255),
    city varchar(255),
	au_state varchar(255),
	Zip int,
	au_contract int
);
select * from Authors_mp;
Drop table Authors_mp;
Select * from Authors_mp;
CREATE TABLE Titles_mp(
    title_id  varchar(255)  NOT NULL PRIMARY KEY,
    title varchar(255),
	au_type varchar(255),
    pub_id  int,
    price float,
    advance varchar(255),
	royalty  varchar(255),
	ytd_sales int,
	notes varchar(255),
	pubdate  datetime
);
select * from Titles_mp;
Drop table Titles_mp;
CREATE TABLE TitleAuthors(
    au_id  varchar(255),
    title_id varchar(255),
	au_ord int,
    royaltyper int,
);
Select * from TitleAuthors;
drop table TitleAuthors;
CREATE TABLE Royshed(
    title_id  varchar(255),
    lorange int,
	hirange int,
    royalty int,
);
select *from Royshed;
drop table Royshed;
CREATE TABLE Publishers_mp(
    pub_id  int NOT NULL PRIMARY KEY,
    pub_name varchar(255),
	city  varchar(255),
    pub_state varchar(255),
	country varchar(255),
);
select *from Publishers_mp;
drop table Publishers_mp;
CREATE TABLE Pub_Info(
    pub_id  int REFERENCES Publishers_mp(pub_id),
    logo varchar(255),
	pr_info varchar(255),
);
select *from Pub_Info;
drop table Pub_Info;
CREATE TABLE Employee(
    emp_id varchar(255)  NOT NULL PRIMARY KEY,
    fname varchar(255),
	minit varchar(255),
	lname varchar(255),
    job_id int FOREIGN KEY REFERENCES jobs_mp(job_id),
	job_lvl_6 int,
	pub_id_7 int,
	hire_date_8 datetime
);
select *from Employee;
drop table Employee;
CREATE TABLE jobs_mp(
    job_id int  NOT NULL PRIMARY KEY,
    job_desc varchar(255),
	min_lvl int,
	max_lvl int,
    Job_Code int
);
select *from jobs_mp;
drop table jobs_mp;
2. Stores_mp Table_Name
INSERT INTO Stores_mp
				  VALUES (6380, 'Eric the Read Books', '788 Catamaugus Ave.','Seattle','WA',98056);

INSERT INTO Stores_mp (stor_id,stor_name,stor_address,city,Stores_state,zip)
				  VALUES (7066,'Barnum''s', '567 Pasadena Ave.','Tustin','CA',92789);
INSERT INTO Stores_mp
				  VALUES (7067, 'News & Brews', '577 First St.','Los Gatos','CA',96745),
				  (7131, 'Doc-U-Mat: Quality Laundry and Books', '24-A Avrogado Way','Remulade','WA',98014),
				  (7896, 'Fricative Bookshop', '89 Madison St.','Fremont','CA',90019),
				  (8042, 'Bookbeat', '679 Carson St.','Portland','OR',89076);

INSERT INTO Discounts_mp
				  VALUES ('Initial Customer',	6380,	110,	NULL,	10.5),
							 ('Volume Discount',	7131,	100,	1000,	6.7),
							 ('Customer Discount',	8042,	23,	NULL,	5);

INSERT INTO sales
VALUES(6380,	'6871','Sep 14 1994 12:00AM',5,'Net 60',	'BU1032'),
	(6380,	'722a',	'Sep 13 1994 12:00AM',	3,'Net 60',	'PS2091'),
	(7066,	'A2976',	'May 24 1993 12:00AM',	50,'Net 30',	'PC8888'),
	(7066,	'QA7442.3',	'Sep 13 1994 12:00AM',	75,'ON invoice','PS2091'),
	(7067,   'D4482',	'Sep 14 1994 12:00AM',	10,	'Net 60',	'PS2091'),
	(7067,	'P2121',	'Jun 15 1992 12:00AM',	40,	'Net 30',	'TC3218'),
	(7067,	'P2121',	'Jun 15 1992 12:00AM',	20,	'Net 30',	'TC4203'),
	(7067,	'P2121',	'Jun 15 1992 12:00AM',	20,	'Net 30',	'TC7777'),
	(7131,	'N914008','Sep 14 1994 12:00AM',	20,'Net 30','	PS2091'),
	(7131,	'N914014',	'Sep 14 1994 12:00AM'	,	25,	'Net 30'	,		'MC3021'	),
	(7131,	'P3087a',		'May 29 1993 12:00AM'	,	20,	'Net 60'	,		'PS1372'	)	,
	(7131,	'P3087a',		'May 29 1993 12:00AM'	,	25,	'Net 60'	,		'PS2106'	),
	(7131,	'P3087a',		'May 29 1993 12:00AM'	,	15,	'Net 60'	,		'PS3333'	),
	(7131,	'P3087a',		'May 29 1993 12:00AM'	,	25,	'Net 60'	,		'PS7777'	),
	(7896,	'QQ2299',	'Oct 28 1993 12:00AM'	,	15,	'Net 60'	,		'BU7832'	),
	(7896,	'TQ456',		'Dec 12 1993 12:00AM'	,	10,	'Net 60'	,		'MC2222'	),
	(7896,	'X999',		'Feb 21 1993 12:00AM'	,	35,	'ON invoice'	,	'BU2075'	),
	(8042,	'423LL922',	'Sep 14 1994 12:00AM'	,	15,	'ON invoice' ,	'MC3021'	),
	(8042,	'423LL930',	'Sep 14 1994 12:00AM'	,	10,	'ON invoice'	,	'BU1032'	),
	(8042,	'P723',		'Mar 11 1993 12:00AM'	,	25,	'Net 30'		,	'BU1111'	),
	(8042,	'QA879.1',	'May 22 1993 12:00AM'	,	30,	'Net 30'		,	'PC1035'	);

INSERT INTO Authors_mp
	values																										   
('172-32-1176'	,	'White	'	,	'Johnson	',	'408 496-7223',		'10932 Bigge Rd.		',	'Menlo Park'	 ,  'CA',	94025,	1	),
('213-46-8915'	,	'Green	'	,	'Marjorie	',	'415 986-7020',		'309 63rd St. #411	',	'Oakland		',	'CA',	94618,	1	),
('238-95-7766'	,	'Carson	'	,	'Cheryl	',	'415 548-7723',		'589 Darwin Ln.		',	'Berkeley		',	'CA',	94705,	1	),
('267-41-2394'	,	'O''Leary	'	,	'Michael	',	'408 286-2428',		'22 Cleveland Av. #14',	'San Jose	',	'CA',	95128,	1	),
('274-80-9391'	,	'Straight	'	,	'Dean		',	'415 834-2919',		'5420 College Av.		',	'Oakland		',	'CA',	94609,	1	),
('341-22-1782'	,	'Smith	'	,	'Meander	',	'913 843-0462',		'10 Mississippi Dr.		',	'Lawrence	',	'KS',	66044,	0	),
('409-56-7008'	,	'Bennet	'	,	'Abraham',	'415 658-9932',		'6223 Bateman St.	',	'Berkeley		',	'CA',	94705,	1	),
('427-17-2319'	,	'Dull		'	,	'Ann		',	'415 836-7128',		'3410 Blonde St.		',	'Palo Alto	',	'CA',	94301,	1	),
('472-27-2349'	,	'Gringlesby'	,	'Burt		',	'707 938-6445',		'PO Box 792				',	'Covelo		',	'CA',	95428,	1	),
('486-29-1786'	,	'Locksley'	,	'Charlene',	'415 585-4620',		'18 Broadway Av.	San',	'Francisco	',	'CA',	94130,	1	);
INSERT INTO titles_mp
	values('BU1032	',	'The Busy Executive''s Database Guide										',	'business			',	1389		,19.99,		'"5000.00"		',10			,4095		,		'An overview of available database systems ','Jun 12 1991 12:00AM'	),
('BU1111	',	'Cooking with Computers: Surreptitious Balance Sheets				',	'business			',	1389		,11.95,		'"5000.00"		',10			,3876		,		'Helpful hints on how to use your electronic resources to the best advantage.																','1991-06-09 00:00'),
('BU2075	',	'You Can Combat Computer Stress!											',	'business			',	736		,2.99	,		'"10125.00"		',24			,18722	,		'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.		','1991-06-30 00:00'	),
('BU7832	',	'Straight Talk About Computers												',	'business			',	1389		,19.99,		'"5000.00"		',10			,4095		,		'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.											','1991-06-22 00:00'	),
('MC2222',	'Silicon Valley Gastronomic Treats											',	'mod_cook		',	877		,19.99,		'"0122032"		',NULL		,NULL		,		'Favorite recipes for quick	 easy	 and elegant meals.																								','1991-06-09 00:00  ' ),
('MC3021',	'The Gourmet Microwave														',	'mod_cook		',	877		,2.99	,		'"15000.00"		',24			,22246	,		'Traditional French gourmet recipes adapted for modern microwave cooking.																','1991-06-18 00:00'	),
('MC3026',	'The Psychology of Computer Cooking										',	'UNDECIDED		',	877		,NULL	,		NULL				 ,NULL		,NULL		,		NULL																																								,'1995-04-28 00:00'	),	
('PC1035	',	'But Is It User Friendly?															',	'popular_comp	',	1389		,22.95,		'"7000.00"		',16			,8780		,		'A survey of software for the naive user	 focusing on the ""friendliness"" of each."														','1991-06-30 00:00' ),
('PC8888	',	'Secrets of Silicon Valley														',	'popular_comp	',	1389		,20	,		'"8000.00"		',10			,4095		,		'Muckraking reporting on the world''s largest computer hardware and software manufacturers.										','1994-06-12 00:00'	),
('PC9999	',	'Net Etiquette																		',	'popular_comp	',	1389		,NULL	,		'NULL				',NULL		,NULL		,		'A must-read for computer conferencing.																												','1995-04-28 00:00'	),	
('PS1372	',	'Computer Phobic and Non-Phobic Individuals: Behavior Variations'	,	'psychology		',	877		,21.59,		'"7000.00"		',10			,375		,		'A must for the specialist examining the difference between those who hate and fear computers and those who don''t."		','1991-10-21 00:00' );
INSERT INTO Titleauthors
	values('172-32-1176',	'PS3333',	1,	100),
('213-46-8915',	'BU1032'	,2,	40	),
('213-46-8915',	'BU2075'	,1,	100),
('238-95-7766',	'PC1035'	,1,	100),
('267-41-2394',	'BU1111'	,2,	40	),
('267-41-2394',	'TC7777'	,2,	30	),
('274-80-9391',	'BU7832'	,1,	100),
('409-56-7008',	'BU1032'	,1,	60	),
('427-17-2319',	'PC8888'	,1,	50	),
('472-27-2349',	'TC7777'	,3,	30	),
('486-29-1786',	'PC9999'	,1,	100),
('486-29-1786',	'PS7777'	,1,	100),
('648-92-1872',	'TC4203'	,1,	100),
('672-71-3249',	'TC7777'	,1,	40	),
('712-45-1867',	'MC2222'	,1,	10),
('722-51-5454',	'MC3021'	,1,	75	);
INSERT INTO Royshed
	values ('BU1032',	0		,	5000	,		10),
('BU1032',	5001	,	50000	,	12				  )	 ,
('PC1035',	0		,	2000		,	10				  )	 ,
('PC1035',	2001	,	3000		,	12				  )	 ,
('PC1035',	3001	,	4000		,	14				  )	 ,
('PC1035',	4001	,	10000	,	16				  )	 ,
('PC1035',	1000,	50000	,	18				  )	 ,
('BU2075',	0		,	1000		,	10				  )	 ,
('BU2075',	1001	,	3000		,	12				  )	 ,
('BU2075',	3001	,	5000		,	14				  )	 ,
('BU2075',	5001	,	7000		,	16				  )	 ,
('BU2075',	7001	,	10000	,	18				  )	 ,
('BU2075',	1000,	12000	,	20				  )	 ,
('BU2075',	1200,	14000	,	22				  )	 ,
('BU2075',	1400,	50000	,	24				  )	 ,
('PS2091',	0		,	1000		,	10				  )	 ,
('PS2091',	1001	,	5000		,	12				  )	 ,
('PS2091',	5001	,	10000	,	14				  )	 ,
('PS2091',	1000,	50000	,	16				  )	 ,
('PS2106',	0		,	2000		,	10				  )	 ,
('PS2106',	2001	,	5000		,	12				  )	 ,
('PS2106',	5001	,	10000	,	14				  )	 ,
('PS2106',	1000,	50000	,	16				  )	 ,
('MC3021',	0		,	1000		,	10				  )	 ,
('MC3021',	1001	,	2000		,	12				  )	 ,
('MC3021',	2001	,	4000		,	14				  )	 ,
('MC3021'	,4001	,	6000		,	16				  )	 ,
('MC3021',	6001	,	8000		,	18				  )	 ,
('MC3021',	8001	,	10000	,	20				  )	 ,
('MC3021',	10001,	12000	,	22				  )	 ,
('MC3021',	12001,	50000	,	24				  )	 ,
('TC3218',	0		,	2000		,	10				  )	 ,
('TC3218',	2001	,	4000		,	12				  )	 ,
('TC3218',	4001	,	6000		,	14				  )	 ,
('TC3218',	6001	,	8000		,	16				  )	 ,
('TC3218',	8001	,	10000	,	18				  )	 ,
('TC3218',	10001	,12000	,	20				  )	 ,
('TC3218',	12001	,14000	,	22				  )	 ,
('TC3218',	14001	,50000	,	24				  )	 ,
('PC8888',	0			,5000	,		10				  )	 ,
('PC8888',	5001		,10000	,	12				  )	 ,
('PC8888',	10001	,15000	,	14				  )	 ,
('PC8888',	15001	,50000	,	16				  )	 ,
('PS7777',	0			,5000	,		10				  )	 ,
('PS7777',	5001		,50000	,	12				  )	 ,
('PS3333',	0			,5000	,		10				  )	 ,
('PS3333',	5001		,10000	,	12				  )	 ,
('PS3333',	10001	,15000	,	14				  )	 ,
('PS3333',	15001	,50000	,	16				  )	 ,
('BU1111',	0			,4000	,		10				  )	 ,
('BU1111',	4001		,8000	,		12				  )	 ,
('BU1111',	8001		,10000	,	14				  )	 ,
('BU1111',	12001	,16000	,	16				  )	 ,
('BU1111',	16001	,20000	,	18				  )	 ,
('BU1111',	20001	,24000	,	20				  )	 ,
('BU1111',	24001	,28000	,	22				  )	 ,
('BU1111',	28001	,50000	,	24				  )	 ,
('MC2222',	0			,2000	,		10				  )	 ,
('MC2222'	,2001		,4000	,		12				  )	 ,
('MC2222'	,4001		,8000	,		14				  )	 ,
('MC2222'	,8001		,12000	,	16				  )	 ,
('MC2222'	,12001	,20000	,	18				  )	 ,
('MC2222'	,20001	,50000	,	20				  )	 ,
('TC7777',	0			,5000	,		10				  )	 ,
('TC7777',	5001		,15000	,	12				  )	 ,
('TC7777',	15001	,50000	,	14				  )	 ,
('TC4203',	0			,2000	,		10				  )	 ,
('TC4203',	2001		,8000	,		12				  )	 ,
('TC4203',	8001		,16000	,	14				  )	 ,
('TC4203',	16001	,24000	,	16				  )	 ,
('TC4203',	24001	,32000	,	18				  )	 ,
('TC4203',	32001	,40000	,	20				  )	 ,
('TC4203',	40001	,50000	,	22				  )	 ,
('BU7832',	0			,5000	,		10				  )	 ,
('BU7832',	5001		,10000	,	12				  )	 ,
('BU7832',	10001	,15000	,14					  )	 ,
('BU7832',	15001	,20000	,16					  )	 ,
('BU7832',	20001	,25000	,18					  )	 ,
('BU7832',	25001	,30000	,20					  )	 ,
('BU7832',	30001	,35000	,22					  )	 ,
('BU7832',	35001	,50000	,24					  )	 ,
('PS1372',	0			,10000	,10					  )	 ,
('PS1372',	10001	,20000	,12					  )	 ,
('PS1372',	20001	,30000	,14					  )	 ,
('PS1372',	30001	,40000	,16					  )	 ,
('PS1372',	40001	,50000	,18					  )	 ;

INSERT INTO Publishers_mp
	values
(736	,		'New Moon Books			','Boston			','MA	','USA        '),
(877	,		'Binnet & Hardley			','Washington		','DC	','USA		 '	 ),
(1389,		'Algodata Infosystems		','Berkeley			','CA	'	,'USA		 '	 ),
(1622,		'Five Lakes Publishing		','Chicago			','IL	'	,'USA		 '	 ),
(1756,		'Ramona Publishers			','Dallas				','TX	'	,'USA		 '	 ),
(9901,		'GGG&G							','München			',NULL	,'Germany' ),
(9952,		'Scootney Books				','New York		','NY'		,'USA		 '	 ),
(9999,		'Lucerne Publishing			','Paris				',NULL	,'France	'	 );
INSERT INTO Pub_Info
	values
(736		,'Newmoon.bmp		','"This is sample text data for New Moon Books	 publisher 0736 in the pubs database. New Moon Books is located in Boston	 Massachusetts."                '        ),
(877		,'Binnet.bmp			','"This is sample text data for Binnet & Hardley	 publisher 0877 in the pubs database. Binnet & Hardley is located in Washington	 D.C."							 '		 ),
(1389	,'	Algodata.bmp		','	"This is sample text data for Algodata Infosystems	 publisher 1389 in the pubs database. Algodata Infosystems is located in Berkeley	 California."		'		 ),
(1622	,'	5lakes.bmp		','	"This is sample text data for Five Lakes Publishing	 publisher 1622 in the pubs database. Five Lakes Publishing is located in Chicago	 Illinois."				  '		 ),
(1756	,'	Ramona.bmp		','	"This is sample text data for Ramona Publishers	 publisher 1756 in the pubs database. Ramona Publishers is located in Dallas	 Texas."						'	 		 ),
(9901	,'	Gggg.bmp			','	"This is sample text data for GGG&G	 publisher 9901 in the pubs database. GGG&G is located in München	 Germany."												 '		 ),
(9952	,'	Scootney.bmp	','	"This is sample text data for Scootney Books	 publisher 9952 in the pubs database. Scootney Books is located in New York City	 New York."				  '		 ),
(9999	,'	Lucerne.bmp		','	"This is sample text data for Lucerne Publishing	 publisher 9999 in the pubs database. Lucerne Publishing is located in Paris	 France."						'		 );
INSERT INTO Employee
	values
('PMA42628M		',	'Paolo			',	'M			','Accorti			',		13		,	35		,		877		,' 1992-04-27 00:00   '	 ),
('PSA89086M',	'Pedro',	'S	','	Alfonso',14	,89,1389,' 1990-12-24 00:00'),
('VPA30890F','Victoria	','P','	Ashworth',	6,140,877,' 1990-09-13 00:00 '),
('H-B39728F',	'Helen',NULL	,'Bennett',12	,35,877,' 1989-09-21 00:00 '	),
('L-B31947F',	'Lesley',	NULL,'Brown',	7	,120	,877,' 1991-02-13 00:00'),
('F-C16315M','Francisco',NULL,'Chang',4,	227,9952,'1990-11-03 00:00 '),
('PTC11962M','Philip',	'T	','Cramer',	2,	215,	9952	,' 1989-11-11 00:00 '),
('A-C71970F',	'Aria',NULL	,'Cruz',10,87,1389,' 1991-10-26 00:00'),
('AMD15433F','Ann	','M','	Devon',	3,	200,9952,' 1991-06-16 00:00 '),
('ARD36773F','Anabela',	'R	','Domingues',8,100,877,' 1993-01-27 00:00 '),
('PHF38899M','Peter',	'H	','Franken',	10	,75,877	,' 1992-05-17 00:00'),
('PXH22250M	','Paul','X','	Henriot',5,159,877,' 1993-08-19 00:00 '),
('PDI47470M','Palle	','D','	Ibsen	',7	,195,	736,' 1993-05-09 00:00'),
('KJJ92907F',	'Karla','J','Jablonski	',9	,170,	9999	,'1994-05-11 00:00'),
('KFJ64308F',	'Karin','F','Josephs',14	,100	,736	,' 1992-10-17 00:00');

INSERT INTO jobs_mp
	values 
(1		,'New Hire - Job not specified	',		10		,10	,	1120	),
(2		,'Chief Executive Officer			',		200	,250	,1122	),
(3		,'Business Operations Manager',		175	,225	,1125	),
(4		,'Chief Financial Officer			',		175	,250	,1126	),
(5		,'Publisher								',		150	,250	,1145	),
(6		,'Managing Editor					',		140	,225	,1102	),
(7		,'Marketing Manager				',		120	,200	,1245	),
(8		,'Public Relations Manager		',		100	,175	,1458	),
(9		,'Acquisitions Manager			',		75		,175	,1265	),
(10	,'	Productions Manager			',		75		,165	,1258	),
(11	,'	Operations Manager			',		75		,150	,4789	),
(12	,'	Editor								',		25		,100	,1258	),
(13	,'	Sales Representative			',		25		,100	,2033	),
(14	,'	Designer							',		25		,100	,1025	);

																																																																																																						
4.
UPDATE Royshed
SET lorange = 100
WHERE lorange = 0;

5.
UPDATE TitleAuthors
SET au_ord = 1
WHERE au_ord = 2;
6. 
select * from Discounts_mp;
ALTER TABLE Discounts_mp ALTER COLUMN discount float NOT NULL;
insert into Discounts_mp
	values('Initial Customer' ,6380,110,2000,null);
7.
select * from  Discounts_mp;
select * from  Stores_mp;
select * from  Authors_mp;
select * from  Publishers_mp;
select * from  Royshed;
select * from  Employee;
8.
select *into job_Dup from jobs_mp;
select *from job_Dup;
delete from job_Dup where min_lvl=175;
delete from job_Dup where job_desc in ( 'Publisher','Editor');
delete from job_Dup;

9.
Select fname,lname,hire_date_8 from Employee where year(hire_date_8)>1992;
10.
Select title 
	from titles_mp where pubdate between '1990-06-01' and '1994-06-01' ;

SELECT C.N,COUNT(*) FROM T.B GROUP BY C.N HAVING COUNT(*)>1
	
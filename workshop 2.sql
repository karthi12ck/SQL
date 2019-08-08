use T5_chandhra;
CREATE TABLE [dbo].[Flights](
	[flno] [varchar](25) ,
	[frm] [varchar](70) ,
	[arr_to] [varchar](70) ,
	[distance] [int] ,
	[departs] [datetime],
	[arrives] [datetime] ,
	[price] [int] 
)

CREATE TABLE [dbo].[Aircraft](
	[aid] [int] ,
	[aname] [varchar](50) ,
	[cruisingrange] [int] 
)

CREATE TABLE [dbo].[Certified](
	[eid] [int] ,
	[aid] [int] 
)

CREATE TABLE [dbo].[Employees](
	[eid] [int] NULL,
	[ename] [varchar](60) ,
	[salary] [int] 
)


insert into Aircraft values( 1,'Trans Anguilla Air',456689)

insert into Aircraft values( 5,'REDjet',8756689)

insert into Aircraft values( 8,'Fly BVI',56689)

insert into Aircraft values( 11,'International AirLink',9089)

insert into Aircraft values( 3,'M&N Aviation',432109)
-----------------------------------------------------------------------------
insert into Employees values(101, 'CHRISTOPHER',57000)

insert into Employees values(335, 'EDWARD',115000 )

insert into Employees values(670, 'MATTHEW',115000 )

insert into Employees values(120,'ERIC', 10000)

insert into Employees values(225, 'DOUGLAS', 23000)

------------------------------------------------------------------------------
insert into Certified values (101,5)

insert into Certified values(335,11)

insert into Certified values(670,5)

insert into Certified values (120,11)

insert into Certified values(225,5)

------------------------------------------------------------
insert into Flights values('RUS 1727','Los Angeles','Honolulu',180, '14:30','16:30',2000) 

insert into Flights values('LH 4234', 'New York' , 'Madison', 190,'11:38','14:33',1888) 

insert into Flights values('TP 559', 'Madison' , 'New York',230,'10:23','14:39',2500) 

insert into Flights values('LH 1704', 'Los Angeles', 'NewYork', 145,'9:30','12:54', 3020) 

insert into Flights values('UA 882', 'Utah' ,'Seattle',87,'13:20','15:40',1200) 

insert into FLights values('AI 512', 'Seattle', 'Chicago',123,'12:35','16:30',2500) 

insert into Flights values('TAA 432','Washington', 'Sans Fransisco',230,'8:44','12:00',3200) 

insert into Flights values('LH 4234', 'Detriot', 'Los angeles',156,'11:56','15:40',2200) 

insert into Flights values('RJ 1235','Sans Fransisco','Detriot',102,'11:30','16:30',900) 

insert into Flights values('LH 4234','Chicago','NewYork',169,'02:33','05:30',1400) 

insert into Flights values('LH 4234','Sans Fransisco','Chicago',83,'15:20','18:40',900) 

insert into Flights values('LH 4234','Washington','Detriot',78,'5:30','10:23',1300)

--------------------------------------------------------------------------------------------
CREATE TABLE junctions (
[JuncNo] INTEGER,
[TrafficLight] INTEGER,
[JuncName] varchar(50));


---Roads table structure: 
CREATE TABLE roads (
[link_id] INTEGER,
[FJunc] INTEGER,
[TJunc] INTEGER,
[roadname] varchar(60),
[link_len] decimal(10,3),
[cityname] varchar(60),
[zipcode] varchar(12));


insert into roads
(link_id,fjunc,tjunc,roadname,link_len,cityname,zipcode)
values
(112,18,8 ,'Archibald St' ,29.39 ,'Hatsfield','56349')
,(113,8,19 ,'Archibald St' ,34.56 ,'Hatsfield','56349')
,(119,30,12 ,'Factory Yard' ,157.48 ,'Hatsfield','56349')
,(122,7,8 ,'High Amplitude Avenue',31.30 ,'Hatsfield','56349')
,(117,18,20, 'Archibald St' ,51.34,'Hatsfield','56349')
,(120,20,6, 'South west st.' ,94.45,'Hatsfield','56349')
,(116,16,11, 'Morington Avenue' ,12.42,'Hatsfield','56349')
,(111,11,13, 'Morington Avenue' ,10.23,'Hatsfield','56349')
,(190,13,23, 'Morington Avenue' ,23.67,'Hatsfield','56349')
,(191,11,12, 'Factory Yard' ,11.23,'Hatsfield','56349')
,(194,14,12, 'Clinton street' ,31.23,'Hatsfield','56349')
,(144,20,23, 'Mossern street' ,31.23,'Hatsfield','56349')
,(145,26,23, 'Walker Avenue' ,22.53,'Hatsfield','56349')


insert into junctions
(JuncNo,TrafficLight,JuncName)
values
(8,1,'JN001')
,(10,0,'JN008')
,(11,0,'JN089')
,(12,0,'JN034')

---------------------------------------------------------------------------------
Select * from Flights;
Select * from Aircraft;
Select * from Certified;
Select * from Employees;
1.
Select * from Flights;
Select F.departs
from Flights F
WHERE F.flno IN ( ( Select flno
from Flights 
WHERE frm = 'Madison' AND arr_to = 'New York'
AND arrives < '18:00' ) );
2.
Select DISTINCT frm, arr_to
from Flights WHERE NOT EXISTS ( Select *
from Employees 
WHERE salary > 100000);
3.
Select aname
from Aircraft a
join Certified C
on a.aid=c.aid
join Employees E
on E.eid=C.eid
where salary>80000
4.
SELECT Temp.name, Temp.AvgSalary
FROM ( SELECT A.aid, A.aname AS name, AVG (E.salary) AS AvgSalary
FROM Aircraft A, Certified C, Employees E
WHERE A.aid = C.aid AND C.eid = E.eid AND A.cruisingrange > 1000
GROUP BY A.aid, A.aname ) AS Temp

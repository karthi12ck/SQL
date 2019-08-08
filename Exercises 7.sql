create table dates(
	emp_id int,
	Hire_Date date,
	[resignation_date] date
)
select *from dates;
insert into dates values (1,'2000/01/01','2013/10/07'),
(2,'2003/12/24','2017/08/03'),
(3,'2012/09/22','2015/06/21'),
(4,'2015/04/13',NULL),
(5,'2016/06/03',NULL),
(6,'2017/08/08',NULL),
(7,'2000/11/13',NULL);
 select * from dates;
1.
select 
case 
when resignation_date is not null then datediff(day,Hire_Date,resignation_date)/365
when resignation_date is null then datediff(day,Hire_Date,getdate())/365  
end as 'years' ,
case 
when resignation_date is not null then datediff(day,Hire_Date,resignation_date)%365/30
when resignation_date is null then datediff(day,Hire_Date,getdate())%365/30  
end as 'months',
case 
when month(resignation_date) > month(hire_date )then day(resignation_date)-day(hire_date)
else  (case when month(resignation_date) in ( 1,7,10,12) then (day(resignation_date)-day(hire_date))+ 30 
when month(resignation_date)=4 then day(resignation_date)-day(hire_date) +28
else (day(resignation_date)-day(hire_date) )+31 end) end from dates;

2.
select convert(varchar,hire_date,101) as hire_date, coalesce(convert(varchar,resignation_date,7),'DEC, 01th 1900 ') as resignation_date from dates;
Select format(hire_date,'dd/mm/yyyy') from dates;
3.
select concat(datediff(year,hire_date,getdate()),'years',(datediff(month,hire_date,getdate()))%12,'month') from dates;
4.
select datediff(day,dateadd(month,-3,getdate()),getdate()) as days
Select datediff(day,dateadd(quarter,datediff(quarter,0,getdate())-1,0), dateadd(qq,1,dateadd(quarter,datediff(quarter,0,getdate())-1,0))) as days

5.
select dateadd(week,1,dateadd(quarter,datediff(quarter,0,getdate())-1,0))

6.
Select dateadd(qq,0,0)
select dateadd(week,15,dateadd(qq,datediff(qq,dateadd(qq,1,0),getdate())+1,0))
7.
use airport;
select * from [dbo].[Passenger]
select * from [dbo].[Pass_in_trip]
select * from [dbo].[Company]
select * from [dbo].[sysdiagrams]
select * from [dbo].[Trip]

8.
Select datediff(day,min(date),max(date)) as days,ID_psg from [dbo].[Pass_in_trip] group by ID_psg 
Select max(date),min(date) from [dbo].[Pass_in_trip] group by ID_psg 
9.
Select datediff(MINUTE,time_out,time_in)as 'minute' ,datediff(SECOND,time_out,time_in) 'seconds' from[dbo].[Trip] where town_from='Rostov' and  town_to='Moscow'



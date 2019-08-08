use hr;
select * from employees;
SELECT * from departments;
SELECT * from jobs;
SELECT * from locations;
SELECT * from countries;
SELECT * from job_history;
1.
Select last_name,hire_date from employees where  department_id =  ( select department_id from departments where department_name = 'sales');
2.
select * from employees;
SELECT * from departments;
Select employee_id as employee_number,last_name from employees where salary>(select avg(salary) from employees);

3.
Select employee_id as employee_number,last_name ,department_id
	from employees where last_name in (select last_name from employees e join departments d on e.department_id=d.department_id where last_name like '%u%');

Select * from employees
where department_id in ( select department_id from departments where last_name like '%u%');

SELECt employee_id, last_name from employees where employee_id in ( select employee_id from employees where last_name like '%u%')

4.

select * from employees;

SELECT * from locations;
Select last_name,department_id as department_number,job_id from employees where job_id in 
	(select job_id from employees e 
	 join departments d on e.department_id=d.department_id 
	join locations l on l.location_id = d.location_id  where city = 'ALTANTA') 

5.
select * from employees;
SELECT  last_name,salary from employees where manager_id in (
select m.manager_id
from employees e join employees m on e.manager_id = m.employee_id where m.last_name = 'FLIMMORE')

6.
select * from employees;
SELECT * from departments;
Select department_id as department_number,last_name,job_id 
from employees where department_id in 
(select department_id from  departments where department_name='Operations');

7.
Select employee_id as employee_Number,last_name,salary 
from employees where department_id in 
(select department_id from  departments where  department_name='Operations'  and last_name like '%u%' ) and salary>(select avg(salary) from employees) ;

8.
select * from employees;
SELECT * from departments;
SELECT * from jobs;
select concat (first_name, ' ',last_name) as name from employees where job_id in
(select e.job_id from jobs j
 join employees e
 on j.job_id =e. job_id 
 join departments d
 on d.department_id=e.department_id where d.department_name='sales');

 9.
 select employee_id ,case
	when department_id =10  Then '5%'
	when department_id =20  Then '10%'
	when department_id =30  Then '5%'
	when department_id =40  Then '15%'
	when department_id =50  Then '15%'
	when department_id =60  Then '0%'
	end as raise_percentage ,case 
	when department_id =10  Then (salary*5/100)+salary
	when department_id =20  Then (salary*10/100)+salary
	when department_id =30  Then (salary*5/100)+salary
	when department_id =40  Then (salary*15/100)+salary
	when department_id =50  Then (salary*15/100)+salary
	when department_id =60  Then salary
	end salary from employees where department_id in(10,20,30,40,50,60);
			
 10.
 SELECT top 3  last_name,salary from employees where salary in  (select salary from employees ) order by salary desc ;

 11.
 select concat (first_name, ' ',last_name) as name,salary,commission_pct=(select  case 
 when commission_pct is null then 0
 else commission_pct 
 end as ads) from employees 
 12.
 SELECT * from employees;
 SELECT * from departments;
 SELECT top 3  salary,manager_id from employees where department_id in  (select department_id from departments ) order by salary desc ;
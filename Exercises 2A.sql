use hr;
select * from employees;
SELECT * from jobs;
SELECT * from departments;
SELECT * from locations;
SELECT * from countries;
SELECT * from job_history;

1.
select job_title, case 
	when job_title like '%Accounting%' then 'A'
	when job_title like '%Research%' then 'B'
	when job_title like '%sales%' then 'C'
	when job_title like '%operations%' then 'D'  
	else 	'0' end as Grade
from employees e
join jobs j
on e.job_id=j.job_id;

2.
select concat (first_name, ' ',last_name) as name,job_title,salary,salary+(case 
	when job_title like '%clerk%' then salary*0.1
		else salary*0.07 end) as raise_salary 
from employees e
join jobs j
on e.job_id=j.job_id;

3.
select concat (first_name, ' ',last_name) as name,salary,commission=
case when commission_pct is null then '0'
else  commission_pct end   from employees;

4. 
select concat (first_name, ' ',last_name) as name,salary+(salary *
case when commission_pct is null then '0'
else commission_pct end) as total_salry,salary  from  employees;


select concat (first_name, ' ',last_name) as name,salary+(salary * coalesce(commission_pct,0)) as salary
from  employees;

5.
select concat (first_name, ' ',last_name) as name,salary+(salary *
case when commission_pct is null then '0'
else commission_pct end) as total_salry,salary,commission_pct  from  employees order by(salary+(salary *
case when commission_pct is null then '0'
else commission_pct end )) desc;

6.
select top 3 m.salary, concat(m.first_name,m.last_name) name,d.department_name
from employees e
join employees m
on e.employee_id =m.manager_id 
join departments d
on d.department_id=m.department_id order by m.salary desc

7.
Select concat(first_name,last_name) as name,job_title
from employees e
join jobs j
on e.job_id=j.job_id where job_title like '%sales%'
group by first_name,last_name,job_title;

8.
select * from employees;
SELECT * from jobs;
SELECT * from departments;
Select concat(first_name,last_name) as name
from employees e
join departments d
on d.department_id=e.department_id where department_name like '%analyst%'
group by first_name,last_name,job_title;



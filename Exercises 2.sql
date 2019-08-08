use hr;
select * from employees;
1.
select max(salary) as max_salary,
		 min(salary) as min_salary,
		 avg(salary) as avg_salary,
		 max(commission_pct) as max_commission_pct,
		 min(commission_pct) as min_commission_pct,
		 avg(commission_pct) as avg_commission_pct from employees;
2.
select * from employees;
select * from departments;
select e.department_id as department_name,sum(salary) as total_salary,sum(commission_pct) as total_commission
from employees e 
join departments d
on e.department_id=d.department_id group by(e.department_id) 

3.
select e.department_id as department_name,count(employee_id) as number_of_employees
from employees e 
join departments d
on e.department_id=d.department_id group by(e.department_id);

4.
select * from employees;
select * from departments;
select e.department_id as department_name,sum(salary) as total_salary
from employees e 
join departments d
on e.department_id=d.department_id group by(e.department_id);


5.
select concat(first_name,' ',last_name) as name from employees where commission_pct is null order by 1;

6.
Select concat(first_name,' ',last_name) as name,department_id,commission_pct,
case  when commission_pct is null then 'No commission'
else cast(commission_pct as nvarchar(50))
end as commission from employees;

7.
Select concat(first_name,' ',last_name) as name,salary,commission_pct *2,
case  when commission_pct is null then 'No commission'
else cast(commission_pct as nvarchar(50))
end as commission from employees;
8.
select * from employees;
select * from departments;
Select first_name as name,department_id 
from employees  
group by first_name,department_id having count (first_name)>1;

9.
select sum(salary) as sum_of_salary,manager_id as manager_id from employees group by(manager_id);

10.
select * from employees;
select * from departments;
Select Manager_id,department_id,count(employee_id) as No_of_employes from employees group by manager_id,department_id;

11.

Select e.first_name,e.last_name,e.department_id,e.salary
from employees e
inner join  employees m
on e.manager_id=m.employee_id
join (select m1.first_name from employees e1 join employees m1 on e1.employee_id=m1.manager_id  group by m1.first_name) e1 on e1.first_name=e.first_name
where e.last_name like '_a%';

12.
select department_id,avg(salary) from employees group by department_id order by department_id;

select department_id,avg(sum_salary) from 
(select department_id,sum(salary) as sum_salary from employees group by department_id,salary) e1 group by department_id order by department_id;

13.
select department_id,max(salary) as max_salary from employees group by (department_id);

14.
Select case 
when commission_pct is null then (salary*10/100) 
else commission_pct end as commission from employees



select department_id,avg(salary) from employees group by department_id order by department_id;
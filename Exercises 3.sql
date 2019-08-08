Use hr;
Select *from locations;
1.

Select concat(upper(substring(last_name,2,1)),Lower(substring(last_name,3,3))) as last_name from employees;
2.
Select concat(first_name,'-',Last_name) as Name,month(hire_date) as Month_of_hire from employees;
3.
Select Last_name,Case 
when salary>10000 then salary+(salary*0.1)+1500
when salary<10000 then salary+(salary*0.115)+1500
end salary from employees;
4.
Select concat(left(e.employee_id,2),'00',right(e.employee_id,1))+'-E' as employee_id,replace(upper(m.First_name+' '+m.Last_name),'Z','$')  manager_name 
from employees e
join employees m
on e.manager_id=m.employee_id;
5.
Select concat(upper(substring(last_name,1,1)),Lower(substring(last_name,2,len(last_name)))) as last_name,len(last_name) as len_name  
from employees where left(last_name,1) in ('J%','M%','A%');
Select concat(upper(substring(last_name,1,1)),Lower(substring(last_name,2,len(last_name)))) as last_name,
case 
when (concat(First_name,Last_name)) like 'J%' Then len(concat(First_name,Last_name))
when (concat(First_name,Last_name)) like 'M%' Then len(concat(First_name,Last_name))
when (concat(First_name,Last_name)) like 'A%' Then len(concat(First_name,Last_name))
else len(concat(First_name,Last_name))
End  len_name  from employees   order by last_name;
6.
Select Last_name,concat(replicate('$',15-len(salary)),salary)as salary from employees;
7.
select (concat(First_name,Last_name)) as name from employees where reverse(concat(First_name,Last_name))=(concat(First_name,Last_name));
8.
Select concat(upper(substring(first_name,1,1)),Lower(substring(first_name,2,len(first_name))))from employees;
9.
Select left(substring(street_address,
charindex(' ',street_address)+1,len(street_address)),
charindex(' ',substring(street_address, charindex(' ',street_address)+2,len(street_address)))) as address from locations;

10.
select (lower((substring(first_name,1,1))+last_name+'@systechusa.com')) as email_address from employees
11.
Select *from employees;
Select * from jobs;
Select (concat(First_name,Last_name)) as name,job_title 
from employees e
join jobs j
on e.job_id=j.job_id
where job_title= (Select job_title 
from employees e
join jobs j
on e.job_id=j.job_id where
First_name='Trenna')
12.
Select (concat(First_name,Last_name)) as name,d.department_name
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id
where city= (Select city 
from employees e
join departments d
on e.department_id=d.department_id
join locations l
on d.location_id=l.location_id where
First_name='Trenna')

13.
Select top 1 (concat(First_name,Last_name)) as name from employees  order by salary
14
Select (concat(First_name,Last_name)) as name from employees where salary not in (Select min (salary) from employees);

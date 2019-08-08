Use hr;
select * from [dbo].[countries];
select * from [dbo].[departments];
select * from [dbo].[employees];
select * from [dbo].[job_history];
select * from [dbo].[jobs];
select * from[dbo].[locations];
select * from [dbo].[regions];

Write a query to display the last name, department number, department name for all employees
select * from [dbo].[departments];
select * from [dbo].[employees];

1.
select  last_name,emp.department_id,department_name
	from employees emp
	left join departments dep
	on emp.department_id=dep.department_id;
2.
Select job_title,Country_name
   from employees emp
   join jobs job
   on emp.job_id=job.job_id
   join departments dep
   on emp.department_id=dep.department_id
   join locations loc
   on dep.location_id=loc.location_id
   join countries cou
   on cou.country_id=loc.country_id
   where dep.department_id=40;

3.

Select emp.last_name,department_name,loc.location_id,loc.city
   from employees emp
   left join jobs job
   on emp.job_id=job.job_id
   left join departments dep
   on emp.department_id=dep.department_id
   left join locations loc
   on dep.location_id=loc.location_id
   where commission_pct is not null;

4.
Select last_name,department_name
   from employees emp
   left join departments dep
   on emp.department_id=dep.department_id
   where emp.last_name like('%a%');

5.
Select last_name,job_title,dep.department_id,dep.department_name
   from employees emp
   left join jobs job
   on emp.job_id=job.job_id
   left join departments dep
   on emp.department_id=dep.department_id
   left join locations loc
   on dep.location_id=loc.location_id
   where city='ATLANTA';

6.Display the employee last name and employee number along with their managers last name and manager number.

select emp.last_name,emp.employee_id,man.last_name as man_last_name,man.manager_id man_manager_id from employees emp
join employees man
on emp.employee_id=man.employee_id where man.manager_id is not null;

7.Display the employee last name and employee number along with their managers last name and manager number (including the employees who have no manager ) .

select emp.last_name,emp.employee_id,man.last_name as man_last_name,man.manager_id man_manager_id from employees emp
join employees man
on emp.employee_id=man.employee_id

8.Create a query that displays employees last name ,department number,and all the employees who work in the same department as a given employee.
Select last_name,emp.department_id
   from employees emp
   left join departments dep
   on emp.department_id=dep.department_id;

9.
Select concat(first_name,last_name) as name ,job_title,department_name,salary,grade=
   case
		when salary>=50000 then 'A'
		when salary>=30000 then 'B'
		when salary<30000 then 'C'
	end
   from employees emp
   left join departments dep
   on emp.department_id=dep.department_id
   join jobs job
   on job.job_id=emp.job_id;
 
10.
Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date.
Label the columns as Employee name , emp_hire_date,manager name,man_hire_date

Select concat(man.first_name,man.last_name) as manager_name,man.hire_date as man_hire_date,concat(emp.first_name,emp.last_name) as Employee_name,emp.hire_date as emp_hire_date
   from employees man 
    join employees emp
   on emp.employee_id=man.manager_id
   where man.hire_date>emp.hire_date;
   
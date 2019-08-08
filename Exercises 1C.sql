USE HR;
1.
Select * from employees,departments;
2.
Select concat(first_name,' ',last_name) as employe_name,hire_date from employees;
3.
Select concat(first_name,' ',last_name)+', '+' '+job_id as Employee_title from employees;
4.
Select hire_date,concat(first_name,' ',last_name) as employe_name,department_id from employees where job_id like('%clerk%');
5.
Select concat(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,commission_pct,manager_id,department_id) from employees;
6.
Select concat(first_name,' ',last_name) as employe_name from employees where salary>2000;
7.
Select concat(first_name,' ',last_name) as Name,hire_date as "Start Date" from employees;
8.
Select concat(first_name,' ',last_name) as Name,hire_date from employees order by hire_date;
9.
Select concat(first_name,' ',last_name) as Name,salary from employees order by salary desc;
10.
Select concat(first_name,' ',last_name) as Name,department_id,REVERSE(salary) as salary from employees where commission_pct is not null;
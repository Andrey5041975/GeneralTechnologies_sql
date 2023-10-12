-- 1.Вывести job_id тех сотрудников, которые зарабатывают больше своего менеджера(прием SELF join)
use hr;
select * from employees;
select * from salary;

select 
t1.employee_id,
t1.job_id, 
t1.first_name,
t1.last_name,
t1.salary,
t1.manager_id,
t2.salary 
from employees t1
join  employees t2
on t1.manager_id = t2.employee_id   
where t1.salary > t2.salary;

select * from locations; 
select * from departments; 

-- 2.Вывести имя, фамилию и город сотрудников, которые работают в Seattle или Toronto (участвуют три таблицы)
select 
t1.employee_id,
t1.first_name,
t1.last_name,
t2.department_id,
t3.city
from employees t1
join departments t2 
		on t1.department_id = t2.department_id
		join locations t3
				on t2.location_id = t3.location_id
where t3.city in ('Seattle', 'Toronto');


-- 3.Вывести имя, фамилию, название департамента и название должности сотрудника(участвуют три таблицы)

select * from jobs;
select 
t1.first_name,
t1.last_name,
t2.department_name,
t3.job_title
from employees t1
join departments t2 
		on t1.department_id = t2.department_id
		join jobs t3
				on t1.job_id = t3.job_id;


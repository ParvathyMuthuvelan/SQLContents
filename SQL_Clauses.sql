select count(employee_id) from employees;
select sum(salary) from employees;
-- Find the no. of employees in each dept.
select department_id,
count(employee_id) from employees
group by department_id;
select department_id,
count(employee_id) No_of_Employees,
sum(salary) Sum_of_salary from employees
group by department_id;
-- not valid
select first_name,department_id,
count(employee_id) No_of_Employees,
sum(salary) Sum_of_salary from employees
group by department_id;
-- Find the no. of employees in each dept where
-- department is not null.
select department_id,
count(employee_id),min(salary) from employees
where department_id is not null
group by department_id;
select first_name,job_id,department_id
from employees ;
select * from department;
/* Find the number of employees under each
job in each department*/
select department_id,job_id,
count(employee_id) from employees
where department_id is not null
group by department_id,job_id;
/* Display the departments and emp.count
 with number of employees greater than 50 */
select department_id,
count(employee_id) from employees
where department_id is not null
group by department_id 
having count(employee_id)>=2
order by department_id desc;

set sql_mode=only_full_group_by;
select department_id,
max(salary) from employees
where department_id is not null
group by department_id 
having max(salary)>40000;

select department_id,
max(salary) from employees
where department_id is not null
group by department_id 
having max(salary)>40000 
order by department_id desc;
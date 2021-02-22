create view emp_view 
as select first_name,salary,department_id 
from employees;
desc emp_view;
select * from emp_view;
create view dept_emp_view 
as select emp.first_name,emp.salary,dep.deptname 
from department dep join employees emp 
on dep.deptno=emp.department_id;
select * from dept_emp_view;

set sql_mode=only_full_group_by;
-- Inline views
-- defining a select query in the from

-- Find the department with maximum no. of employees
select department_id from employees
group by department_id 
having count(employee_id)=
(select max(empcount) from
(select count(employee_id) empcount
from employees group by department_id)temp);

/* Find the employees whose salary is greater
than the average salary of their own department*/
select first_name,salary,department_id from
employees;

select department_id,avg(salary) avgsal
from employees group by department_id;

select first_name,salary,temp.department_id,
temp.avgsal 
from employees emp,
(select department_id,avg(salary) avgsal
from employees group by department_id)temp
where emp.department_id=temp.department_id
and emp.salary > temp.avgsal;

create index name_idx on employees(first_name);
desc employees;
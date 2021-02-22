-- Find the employee who earns the maximum salary

-- select first_name,max(salary) from employees;
select first_name,salary from
employees where salary=(
select max(salary) from employees);
select employee_id,job_id from employees
where employee_id=100;
-- '100', 'AD_PRES'
select job_id from employees 
where employee_id=102;
-- 'AD_VP'
-- error
update employees set job_id=
(select job_id from employees 
where employee_id=102) 
where employee_id=100;
select job_id from employees where employee_id=100;
select job_id from employees where employee_id=102;
update employees set department_id=
(select deptno from department 
where deptname='Accounting') 
where employee_id=106;
select department_id from employees
where employee_id=106;

-- List all employees whose salary is 
-- greater than Lex. 
select first_name,salary from employees
where salary >
(select salary from employees where 
first_name='lex');

/*List all employees who has same designation 
as Diana and who has salary greater than Jones.*/

select first_name,salary,job_id from employees
where salary >
(select salary from employees where 
first_name='Ernst')
or job_id=(select job_id from employees where 
first_name='diana') 
and first_name!='diana';
-- List the employee having the minimum salary
select first_name,salary from
employees where salary=(
select min(salary) from employees);
/*List minimum salary of each department,where 
minimum salary is greater than the minimum 
salary of department 10.*/
select department_id,min(salary) from 
employees group by department_id
having min(salary)>
(select min(salary) from employees
where department_id=10);

/* Find minimum salary of each department,where 
minimum salary is greater than the minimum 
salary of department 10.Display dept.name
and minimum salary*/
select dep.deptname,min(emp.salary) 
from department dep join employees emp
on dep.deptno=emp.department_id
group by dep.deptname
having min(emp.salary)>
(select min(salary) from employees
where department_id=10);
-- Single row subquery operators
-- =,<,>,<=,>=,!=
-- Subquery returning multiple rows
-- multiple row subquery operators
-- in(=),any,all(relational operators)
-- error
SELECT employee_id, first_name
FROM   employees
WHERE  salary =
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id);
SELECT employee_id, first_name,salary
FROM   employees
WHERE  salary in
                (SELECT   MIN(salary)
                 FROM     employees
                 GROUP BY department_id
);
-- List employees whose salary is less 
-- than any employees with job_id AD_PRES.
select first_name,salary from employees
where salary < any
(select salary from 
employees where job_id='AD_PRES');

-- List employees whose salary is less 
-- than all AD_PRES.
select first_name,salary from employees
where salary <= all
(select salary from 
employees where job_id='AD_PRES');

-- Find the department with maximum 
-- number of employees
-- error 
select 
max(count(employee_id)) from
employees group by department_id;

select department_id,count(employee_id) 
from employees
group by department_id
having count(employee_id) >=all
(select count(employee_id) from employees
group by department_id);

-- Find the dept. with minimum employee count
select department_id,count(employee_id) 
from employees
group by department_id
having count(employee_id) <=all
(select count(employee_id) from employees
group by department_id);

select s.student_id,s.first_name,
count(sc.course_code)
from student_info s join student_course sc
on s.student_id=sc.student_id join 
course_fees cf
on cf.course_code=sc.course_code
where cf.base_fees<1500
group by s.student_id,s.first_name
having count(sc.course_code)>=1;

-- Correlated subqueries
/* Find the employees whose salary is greater
than the average salary of their own department*/
-- Jones 45000 10 ->avg(salary) of dept 10
-- A 50000 20 ->avg(salary) of dept 20
select e1.first_name,e1.salary,e1.department_id
from employees e1 where e1.salary >
(select avg(e2.salary) from employees e2 where 
e1.department_id= e2.department_id);
select first_name,salary from employees
order by salary desc limit 1;

-- true/false
Select emp.first_name, 
emp.department_id, emp.Salary 
from employees emp
Where EXISTS (select dep.deptno 
From department dep 
Where dep.deptno = emp.department_id);

-- Find the employee who earns nth maximum salary



select e1.first_name,e1.salary,e1.department_id,e2.avgsal
from employees e1 ,
(select department_id ,avg(salary) avgsal
from employees group by department_id) e2 
where e1.department_id =e2.department_id and
e1.salary > e2.avgsal;
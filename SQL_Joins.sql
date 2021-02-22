insert into department values(20,'Marketing');

select employee_id,department_id from employees;
select deptno,deptname from department;
-- Joins
-- Inner Join
-- Display employee id,name,deptid and deptname.
-- ANSI style
select employee_id,first_name,department_id,
deptname
from department inner join employees
on department.deptno=employees.department_id;

-- using clause with join(only if primary,foreign key 
-- column names are same.

select employee_id,first_name,department_id,
deptname
from department join employees
using(department_id);

select employees.employee_id,
employees.first_name,department.deptno,
department.deptname
from department join employees
on department.deptno=employees.department_id;

-- using alais name
select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep join employees emp
on dep.deptno=emp.department_id;

select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep join employees emp 
on dep.deptno=emp.department_id 
where dep.deptno in(20,30);

-- Theta style

select emp.employee_id,emp.first_name,
dep.deptno,deptname
from department dep,employees emp
where dep.deptno=emp.department_id
and dep.deptno in(20,30);

-- Outer Join
-- left outer
-- retrieves matching rows from both tables,and 
-- unmatched rows from left table
select emp.employee_id,emp.first_name,
dep.deptno,dep.deptname
from department dep left join employees emp
on dep.deptno=emp.department_id;
-- right outer
-- retrieves matching rows from both tables,and 
-- unmatched rows from right table
select emp.employee_id,emp.first_name,
dep.deptno,dep.deptname
from department dep right join employees emp
on dep.deptno=emp.department_id;
-- full outer
-- retrieves matching rows from both tables,and 
-- unmatched rows from left and right table
select emp.employee_id,emp.first_name,
dep.deptno,dep.deptname
from department dep left join employees emp
on dep.deptno=emp.department_id
union
select emp.employee_id,emp.first_name,
dep.deptno,dep.deptname
from department dep right join employees emp
on dep.deptno=emp.department_id;

-- Cross join
select first_name,department_id,deptname
from department cross join employees;
-- Natural join
select first_name,department_id,deptname
from department natural join employees;

-- Self join
select employee_id,first_name,manager_id 
from employees;


-- Display employee names and their manager names
select emp.first_name Employee,
mgr.first_name Manager
from employees emp join employees mgr
on emp.manager_id=mgr.employee_id;

select emp.first_name Employee,emp.hire_date,
mgr.first_name Manager,mgr.hire_date
from employees emp join employees mgr
on emp.manager_id=mgr.employee_id
where emp.hire_date<mgr.hire_date;

-- Non Equii join
-- For every employee display the salary grade
create table job_grades
(
grade_level varchar(3),
lowest_sal int,
highest_sal int);
insert into job_grades values('A',5000,29999);
insert into job_grades values('B',30000,49999);
insert into job_grades values('C',50000,99999);
insert into job_grades values('D',100000,500000);
select emp.first_name,emp.salary,grd.grade_level
from employees emp join job_grades grd
on emp.salary between grd.lowest_sal and
grd.highest_sal;

select grd.grade_level,sum(emp.salary) 
from employees emp join job_grades grd
on emp.salary between grd.lowest_sal and
grd.highest_sal group by grd.grade_level;
-- where grd.grade_level='A';

-- Joins and group by
/*Display department name and the number of 
employees in each department*/
select dep.deptname,
count(emp.employee_id) 
from department dep join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;
/*Display department name and the number of 
employees in each department including department 
with no employees*/
select dep.deptname,
count(emp.employee_id) 
from department dep left join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;

set sql_mode=only_full_group_by;
select first_name,count(employee_id) 
from employees;
-- display number of employees in each department 
-- and dept.name
select dep.deptname,
count(emp.employee_id) 
from department dep join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;

select dep.deptname,
count(emp.employee_id) 
from department dep left join employees emp
on dep.deptno=emp.department_id
group by dep.deptname;

select first_name from employees where
year(hire_date)=1991 and
job_id=
(select job_id from employees
where hire_date=
(select min(hire_date) from employees
where year(hire_date)=1991));




CREATE TABLE JOB_HISTORY(
EMPLOYEE_ID int NOT NULL,
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
JOB_ID VARCHAR(20) NOT NULL,
DEPARTMENT_ID int);


INSERT INTO JOB_HISTORY VALUES(102,'1993-01-13','98-07-24','IT_PROG',60);
INSERT INTO JOB_HISTORY VALUES(101,'89-09-21','93-10-27','AC_ACCOUNT',110);
INSERT INTO JOB_HISTORY VALUES(101,'93-10-21','97-03-15','AC_MGR',110);
INSERT INTO JOB_HISTORY VALUES(201,'96-02-17','99-12-19','MK_REP',20);
INSERT INTO JOB_HISTORY VALUES(114,'98-03-24','99-12-31','ST_CLERK',50);
INSERT INTO JOB_HISTORY VALUES(122,’99-01-01’,’99-12-31’,’ST_CLERK’,50);
INSERT INTO JOB_HISTORY VALUES(200,’87-09-17’,’93-01-17’,’AD_ASST’,90);
INSERT INTO JOB_HISTORY VALUES(176,’98-03-24’,’98-12-31’,’SA_REP’,80);
INSERT INTO JOB_HISTORY VALUES(176,’99-01-01’,’99-12-31’,’SA_MAN’,80);
INSERT INTO JOB_HISTORY VALUES(200,’94-07-01’,’98-12-31’,’AC_ACCOUNT’,90);


select employee_id,sum(round(datediff(end_date,START_DATE)/365,2)) 
from job_history group by employee_id;




select table1.employees from
(select e.employee_id as employees,
 m.employee_id as managers from employees e
 join employees m on e.manager_id=m.employee_id) 
 table1 ,
 
 
(select employee_id,sum(round(datediff(end_date,START_DATE)/365,2)) 
from job_history group by employee_id)table2;
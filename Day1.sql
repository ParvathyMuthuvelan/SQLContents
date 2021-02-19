create database ems;
use ems; 

create table employee
(empid int,empname varchar(30),job varchar(30),
salary double);
desc employee;
select * from employee;
insert into employee values
(1001,"abc",'SE',45000,'2010-02-15');
delete from employee where hiredate=
'2013-01-01';

alter table employee add primary key(empid);
ALTER TABLE employee RENAME COLUMN 
hire_date TO join_date;
desc employee;

-- insert into employee values("aaa",1002,'SE',45000); error
insert into employee (empname,empid,job,salary) 
values("aaa",1002,'SE',45000);

-- insert into employee values(1003,'bbb','SE'); error

insert into employee (empname,empid,job) 
values("ccc",1002,'HR');

INSERT into employee values
(1004,"minu",'SSE',55000),
(1005,"ddd",'PM',75000),
(1006,"kavi",'SE',45000);
select * from employee;
update employee set salary=salary+5000;
set sql_safe_updates=0;
update employee set salary=40000 
where salary is null;
update employee set salary=salary+5000 
where job='se';
update employee set empid=1003,job='PM'
where empname='eee';
delete from employee where empid=1005;
-- change table structure
alter table employee add column hiredate date;
alter table employee add column testcol int;
alter table employee modify testcol varchar(30);
alter table employee drop column testcol;
desc employee;
select sysdate() ;
update employee set hiredate='2013-01-01' 
where empid=1001;
desc emp;
alter table test.emp rename to ems.employee;
select * from employee;
select empid,salary from employee;
select empid,salary from employee 
where salary>45000;
select empid,salary from employee 
where salary<45000;
-- and ,or,not
select empid,salary from employee 
where salary >=40000 and salary<=60000;

select empid,salary,job from employee 
where salary >=40000 or job='sse';
create table employee_copy
(empid int,empname varchar(30),job varchar(30),
salary double,hiredate date);
insert into employee_copy
select * from employee;

select * from employee_copy;

-- Transaction
set sql_safe_updates=0;
start transaction;
insert into employee values
(1008,"minu",'TL',55000,'2009-01-05');
update employee set hiredate='2015-03-04'
where empid=1002;
savepoint s1;
delete from employee where empid=1003;
savepoint s2;
rollback to s1;
commit;
create table test(id int primary key,
uname varchar(20));
drop table test;

/*create table test(id1 int primary key,
id2 int primary key,
uname varchar(20)); error*/

create table test(id1 int,
id2 int,
uname varchar(20),
primary key(id1,id2));

insert into test(id1,uname) 
values (1,'a');
desc test;
alter table employee add primary key(empid);
insert into employee (empname,job) 
values("ccc",'HR');
-- primary key
-- composite key - table level constraint
-- check constraint
create table course(courseid int,
coursename varchar(30),
start_date date check(start_date > sysdate()),
end_date date);

create table course(courseid int,
coursename varchar(30),
start_date date, 
end_date date,
check(start_date < end_date));


create table employees(
employee_id int ,
first_name varchar(20)not null,
last_name varchar(25) not null,
email varchar(25) unique,
phone_number varchar(20) ,
hire_date date,
job_id varchar(10) not null,
salary double check (salary>0),
commission_pct double,
manager_id int,
department_id int ,
constraint emp_pk primary key(employee_id));

desc employees;
desc employees;
insert into employees
(employee_id,first_name,last_name,
email,phone_number,hire_date,
job_id,salary,department_id)
 values(134,'Steven','St','Sking',
 '515.123.4567',
'1987-06-17','AD_PRES',24000,90);

create table department(deptno int primary key,
deptname varchar(30));
insert into department 
values
(10,'IT'),(20,'Admin'),(30,'Sales');

alter table employees 
add constraint dep_emp_deptno_fk
foreign key(department_id) 
references department(deptno)
on delete set null;

select employee_id,department_id from employees;
select *from department;
insert into department 
values
(90,'Marketing');
delete from department where deptno=90;

/* cascade rule
on delete cascade
on delete set null
on delete set default
on delete no action -default */
select * from employee;
alter table employee add column 
deptno int;
alter table employee
add constraint dep_empl_deptno_fk
foreign key(deptno) 
references department(deptno);

update employee set deptno=10 where
empid=1001;
update employee set deptno=10 where
empid=1002;
desc employee;
delete from department where deptno=20;
insert into department values(20,'Admin');
insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values
(152,'Lex','De Haan','LDEHAAN','515.123.4569',
'1993-01-13','AD_VP',17000,100,50);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values
(103,'Alexander','AHUNOLD','A','590.423.4567',
'1990-01-03','IT_PROG',9000,102,30);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values
(104,'Bruce','Ernst','BERNST','590.423.4568',
'1991-05-21','IT_PROG',6000,103,30);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values
(107,'Diana','Lorentz','DLORENTZ','590.423.5567',
'1999-02-07','IT_PROG',4200,103,20);

-- SQL Operators
-- Arithmetic Operators
select employee_id,first_name,salary,
salary*12 from employees;

select employee_id,first_name as Name,salary,
salary*12 as 'Annual Salary' from employees;

select count(*) from employees;
select count(*) 'No of Employees' 
from employees;

-- Relational operators
select first_name,salary from employees
where salary > 130000;
select first_name,salary from employees
where salary <=30000;
select first_name,salary from employees
where salary >= 30000 and salary <=50000;
select first_name,salary from employees
where salary between 30000 and 50000;
select first_name,salary from employees
where salary not between 30000 and 50000;
select first_name,salary from employees
where first_name between 'A' and 'F';
select first_name,hire_date from employees
where hire_date between '1990-01-01' 
and '2000-01-01';
select first_name,department_id from
employees where department_id=10 or
department_id=30 or department_id=20;

select first_name,department_id from
employees where department_id in(10,20,30);
select first_name,department_id from
employees where department_id not in(10);

select first_name,salary,department_id from
employees where department_id=10 and 
salary >30000;

select first_name,salary,department_id from
employees where department_id=30 and 
salary >30000;

select first_name,salary,department_id from
employees where department_id=10 or 
salary >30000;

select first_name,commission_pct from 
employees
where commission_pct =null ;
select first_name,commission_pct from employees
 where commission_pct is null;
 select first_name,commission_pct from employees
 where commission_pct is not null;
 select first_name from employees
 where first_name like 'A%';
  select first_name from employees
 where first_name like '%a';
 select first_name from employees
 where first_name like '%a%';
 
 select first_name from employees
 where first_name like 'a_%';
 select first_name from employees
 where first_name like '_e%';
 -- Set operators
 select empid,empname from
 employee
 union
 select employee_id,first_name from
 employees;
 /* select empid,empname from
 employee
 intersect
 select employee_id,first_name from
 employees;*/
 select empid,empname from
 employee
 union all
 select employee_id,first_name from
 employees;
 
insert into employee values
(102,"Lex",'SE',45000,'2010-02-15',10);
 /*select empid,empname,job from
 employee
 union
 select employee_id,first_name from
 employees; --error*/
 create table course_fees(course_code varchar(10),
 base_fees int ,
 special_fees int,
 discount int check(discount >=5 and discount<=15),
 constraint course_chk_fees 
 check(base_fees >15000 and base_fees>special_fees)
 );
 
 select first_name,length(first_name) from employees;
 select sysdate() from dual;
 
 select length('hello') from dual;
 select count(employee_id) from employees;
 
 update employees set email=null,phone_number=null where 
 employee_id=107;
 insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id,department_id) values
(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07','AC_ACCOUNT',8300,205,10);

insert into employees(employee_id,first_name,last_name,email,phone_number,hire_date,
job_id,salary,manager_id) values(106,'Bruce','Ernst','BERNST@gmail.com','590.423.4568',
'1991-05-21','IT_PROG',9000,103);

select job_id from employees where department_id=20;
select job_id from employees where department_id=10;

alter table employee rename column deptno to department_id;


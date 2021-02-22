-- Aggregate Functions
select count(employee_id) from employees;
select count(employee_id) 'No of employees' 
from employees;
select count(employee_id) Employee_count 
from employees;
select avg(salary) from employees;
select department_id,
avg(salary) from employees group by
department_id;
select min(20,10,30);
select min(salary),max(salary),sum(salary) 
from employees;
select count(commission_pct) from employees;
select count(*) from employees;
select count(department_id) from employees;
select count(distinct department_id) 
from employees;
-- this is not a valid query
select first_name from employees;
set sql_mode=only_full_group_by;
select first_name,max(salary) from employees;
select first_name from employees where salary=
(select max(salary) from employees);
select min(hire_date),max(hire_date) 
from employees;
select min(first_name),
max(first_name) from employees;
select department_id,count(employee_id) from employees 
group by department_id;

-- Scalar Functions
-- Built-in functions
select current_date() from dual;
select session_user();
select current_user();
select current_time();
select current_timestamp();
-- Number functions
select ceil(78.9);
select ceil(78.4);
select floor(78.9);
select floor(78.4);
select round (78.9453,2);
select round (78.9443,2);
select truncate (78.9453,2);
select truncate (78.9443,2);
select round (78.9443,-1);
select round (74.9443,-1);
select round (378.9443,-2);
select round (348.9443,-2);
select truncate (78.9443,-1);
select truncate (74.9443,-1);
select truncate (378.9443,-2);
select truncate (348.9443,-2);
select avg(salary) from employees;
select round(avg(salary),2) from employees;
select abs(-8),abs(8);
select pi();
select mod(9,3);
select mod(9,2);
select mod(2,4);
select sqrt(25);
select power(3,2);
select power(3,3);
-- String functions
select length('hello');
select first_name,
length(first_name) from employees;
select ucase('hello');
select first_name,
ucase(first_name) from employees;
select upper('hello');
select lcase('HELLO');
select lower('HELLO');
select left('hello',2);
select right('hello',2);
select concat('hello',' ','world',' ','hai');
select concat(first_name,' ',last_name) 
Employee_Name
from employees;
select substring('hello world',1,3);
select substring('hello world',3,3);
select substring('hello world',3);
select locate('world','helloworld');
select locate('sa','helloworld');
select concat(first_name,' ',last_name) Name 
from employees;
select reverse('hello');
select first_name,
trim(leading 'A' from first_name)
from employees;
select first_name,
trim(trailing 'n' from first_name)
from employees;
select ascii('hello');
SELECT CONVERT('1998-03-16', DATE);
select CONVERT('19980316', DATE);
select convert('abc',date);
select upper(left(first_name,1)) 
from employees;
select lower(substring(first_name,2)) 
from employees;
select concat
(upper(left(first_name,1)),lower(substring(first_name,2)))
from employees;
-- Date functions
select date(sysdate());
select sysdate();
select time(sysdate());
select date('20201219');
select date('abc');
select hire_date,day(hire_date),month(hire_date),
year(hire_date) from employees;
select hour(sysdate()),minute(sysdate()),
second(sysdate());
select hire_date,extract(day from hire_date),
extract(month from hire_date) from employees;
select hire_date,dayname(hire_date),
monthname(hire_date) from employees;
select dayname(sysdate());
select hire_date,
adddate(hire_date,interval 20 day),
adddate(hire_date,interval 1 month),
adddate(hire_date,interval 1 year)
from employees;
select date(current_date+1);
select hire_date,datediff(sysdate(),hire_date)/365
from employees;
select hire_date,
round(datediff(sysdate(),hire_date)/365,2)
from employees;
SELECT DAYOFMONTH('2021-02-22');
SELECT DAYOFMONTH('2021-02-24');
SELECT DAYOFYEAR('2020-12-21');
SELECT DAYOFYEAR('2021-02-24');
SELECT DAYOFYEAR('2020-11-21');
SELECT DAYOFWEEK('2021-02-26');
SELECT DAYOFWEEK('2020-12-25');
SELECT LAST_DAY('2020-12-15');
SELECT LAST_DAY('2021-02-26');
SELECT dayname(LAST_DAY('2020-12-15'));
select date_format('2020-12-21', '%W %M %Y');
select date_format('2020-12-21', '%W , %M ,%Y');
select date_format('2021-02-22', '%W %M %Y');
select date_format('2020-12-21', '%d-%m-%Y');
select date_format('2020-12-21', '%d/%m/%Y');
select hire_date,
date_format(hire_date,'%m-%d-%Y')
from employees;
select dayname(hire_date),
monthname(hire_date)
from employees;
-- General functions
/* Display employee names and their contact info whichever
is available.*/
select first_name,
coalesce(email,phone_number,'NA') 'Contact Info'
from employees;
select nullif(12,12);
select nullif(12,10);
select if(1>2,'true','false');
select distinct job_id from employees;
/* Display employees,commission who avail commission and for
 those who are
not availing display Not eligible*/
select first_name,
if(commission_pct is not null,
commission_pct,'Not eligible')
from employees;
/* Display employee name,designation. 
If job_title is
AD_PRES then display designation President
AD_VP then Vice President
IT_PROG then Programmer
else display NA.
*/
select first_name,job_id,
case job_id
when 'AD_PRES' then 'President'
when 'AD_VP' then 'Vice President'
else 'NA' end Designation
from employees;

/*
Display employee name,salary and salary grade. Find salary grade
based on the following criteria:
if sal>50000 grade - A
if sal >=30000 and <50000 grad -B
if sal >=15000 and <=30000 grad -C
*/
select first_name,salary,
case 
when salary>50000 then 'A'
when salary between 30000 and 50000 then 'B'
when salary between 15000 and 29999 then 'C'
else 'No grade' 
end Grade
from employees;

select ifnull(10,20);
select ifnull(null,20);
select avg(commission_pct) from employees;
-- 3000
select sum(commission_pct)/2
 from employees;
 -- 3000
select sum(commission_pct)/count(employee_id)
 from employees;
 -- 750
select avg(ifnull(commission_pct,0)) 
from employees;

-- order by (asc(default),desc)
select first_name,salary from employees 
order by salary;
select first_name,salary from employees 
order by salary desc;
select first_name,salary from employees 
order by salary desc;
select first_name,salary from employees 
order by first_name;
select first_name,hire_date from employees 
order by hire_date;
select first_name,salary,department_id from 
employees order by department_id,salary;
select first_name,salary,department_id 
from employees order by 
department_id,salary desc;
select first_name,department_id,job_id from 
employees order by 
department_id desc,job_id;

select employee_id from employees where 
employee_id like '__7%';

select first_name,department_id,job_id from 
employees order by 
2 desc,3;

-- select initcap(first_name) from employees;

select ucase(left(first_name,1)) from employees;
select lcase(substring(first_name,2)) from employees;

select concat(ucase(left(first_name,1)),
lcase(substring(first_name,2)))
from employees;
select ascii(left(first_name,1)) from employees;
select first_name from employees
where ascii(left(first_name,1)) between 65 and 90;
select cast(salary as char) from employees;
select cast('5' as unsigned int);


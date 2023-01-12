
--Question-1
--creating a database
-- CREATE DATABASE Organization;

--(a)
--(i).CREATING EMPLOYEE TABLE

CREATE TABLE Employee 
(
Emp_no int,
Emp_name varchar(50),
Job varchar(50),
Mgr int,
HireDate date,
Salary int,
Comm int,
Dept_no int
);

--(ii).CREATING DEPARTMENT TABLE
CREATE TABLE Department  
(
Dept_no int,
Dname varchar(50),
Loc varchar(50)

);

--(iii).
INSERT INTO Employee (
Emp_no,
Emp_name,
Job,
Mgr ,
HireDate ,
Salary ,
Comm ,
Dept_no) VALUES ( 325,'Smith','Clerk',433,'11/01/1995',500,1400,20), (825, 'James','Clerk',466 ,'02-aug-81',2975,NULL,20),
(433     , 'James ',		'Analyst', 	825   ,    '03-Dec-89',   3500,  NULL,40),
(466      ,'Mike	', 	'President',	NULL,	  '18-nov-97',	 7000,  NULL,30),
(469      ,'Arun	', 	'Manager',	NULL,	  '18-dec-98',	 5000,  NULL,30),
(889      ,'Adams',		'Manager',	433      , '23-may-87',	 3250,	0,10),
(435      ,'Blake ',		'Analyst', 	889  ,     '03-Dec-89',   4500,  0,40);

--(iv)
INSERT INTO Department (Dept_no,Dname,Loc) VALUES (10,		'Accounting',		'Chicago'),
(20,		'Research',		'Dallas	'),
(30,		'Sales',			'NewYork'),
(40,		'Operations',		'Boston'),
(50,      'Purchase',		'Los Angeles') ;


--(b)
--(i)
SELECT * FROM Employee;

--(ii)
SELECT * FROM Department;

--(iii)
SELECT Emp_no,Emp_name,Job FROM Employee;

--(iv)
SELECT Dept_no,Dname FROM Department;

--(v)
SELECT DISTINCT(Job) FROM Employee;


------------------------------------------------------------------------

--Question-2

--(i)
SELECT Emp_name FROM Employee WHERE Job LIKE 'Analyst' AND Salary>2000;

--(ii)
SELECT Emp_no,Emp_name FROM Employee WHERE Comm=0 OR Comm IS NULL;

--(iii)
SELECT Emp_name FROM Employee WHERE (Job LIKE 'Clerk' OR Job LIKE 'Analyst' OR Job LIKE 'Manager') AND Salary>3000;

--(iv)
SELECT Emp_name FROM Employee WHERE (Dept_no = 10 OR Dept_no = 20 OR Dept_no = 40) OR (Job LIKE 'Clerk' OR Job LIKE 'Analyst');

--(v)
SELECT e.Emp_name,e.Dept_no,d.Dname FROM Employee e INNER JOIN Department d ON e.Dept_no=d.Dept_no WHERE d.Dname LIKE 'Research';

--(vi)
SELECT Emp_name FROM Employee WHERE Emp_name LIKE 'b%e';

--(vii)
SELECT Job FROM Employee WHERE Dept_no=20 AND Job IN (SELECT Job FROM Employee WHERE Dept_no=10  );

--(viii)
SELECT DISTINCT(Job) FROM Employee WHERE Dept_no=10;

--(ix)
SELECT Emp_name FROM Employee WHERE (Salary+0.2*Salary)>3000;

--(x)
SELECT * FROM Employee WHERE Mgr IS NULL;

-------------------------------------------------------------------------

--Question-3
--(a)
--(i)
SELECT COUNT(*) FROM Employee;

--(ii)
SELECT COUNT(*) FROM Employee e INNER JOIN Department d ON e.Dept_no=d.Dept_no WHERE d.Dname LIKE 'Accounting';

--(iii)
select SUM(salary) from employee;

--(iv)
select dept_no,avg(salary),min(salary),max(salary)  from employee  where dept_no in (select tbl.dept_no from (select dept_no ,count(*) as cnt from employee group by dept_no) as tbl where tbl.cnt>2 ) group by dept_no;

--(b)
select current_date 

--(c)
select emp_name ,salary*12 as Annual_salary from employee;

------------------------------------------------------------------------------------------

--Question-4
--(a)
--(i)
select job,count(job) from employee group by job;

--(ii)
select tbl.job,tbl.sum_salary from (select job,sum(salary) sum_salary from employee group by job) as tbl where tbl.sum_salary>5000 ;

--(iii)
select emp_no,emp_name dept_no,salary from employee order by emp_name,dept_no,salary;

--(iv)
select emp_name ,salary*12 as Annual_salary from employee order by Annual_salary desc;

--(b)
--(i)
select emp_name  from employee where salary = (select max(salary) from employee);

--(ii)
select emp_name  from employee where salary> (select avg(salary) from employee);

--(iii) to complete
select *  from employee where salary > (
select min(salary) from employee where dept_no=30) and dept_no!= 30;

--(iv)
select emp_name from employee where salary>(select max(e.salary) from employee e inner join department d on d.dept_no= e.dept_no where d.dname like 'Sales');

--(v)
select * from employee where mgr in (select emp_no from employee where emp_name like '%James%');

--(vi)
select * from employee where (salary >= (select avg(salary) from employee)) and job like 'Manager';

-----------------------------------------------------------------------------------------------------

--Question-5
--(a)
--(i)
select e.emp_no ,e.emp_name ,e.dept_no,d.dname  from employee e left join department d on e.dept_no =d.dept_no;

--(ii)
select e1.emp_name,e2.emp_name as manager from employee e1 left join employee e2 on e1.mgr=e2.emp_no ;

--(iii)
select * from employee e1 left join employee e2 on e1.mgr=e2.emp_no where e1.dept_no = e2.dept_no;

--(iv)
select *  from employee e full outer join department d on e.dept_no =d.dept_no;
select *  from employee e left outer join department d on e.dept_no =d.dept_no;
select *  from employee e right outer join department d on e.dept_no =d.dept_no;

--(b)
--(i)
create table Cust_dtls (
Cust_no int  unique not null,
Cust_name varchar(50) check (upper(Cust_name)=Cust_name),
Cust_city varchar(50) check (Cust_city like 'H%')
);

--(ii)
--(a)
alter table employee add primary key(emp_no);

--(b)
alter table employee 
alter column emp_name
set not null;

--(c)
alter table employee 
alter column comm
set default 0;

--(d)
alter table Department
ADD CONSTRAINT unique_dept_no UNIQUE ( dept_no );



alter table employee 
add foreign key (dept_no) references department(dept_no) ;

--(e)
alter table employee 
add foreign key (mgr) references employee(emp_no) ;


--(iii)

--(iv)
alter table department 
add CONSTRAINT unique_loc UNIQUE ( loc );

--(v)
alter table cust_dtls
drop constraint cust_dtls_cust_name_check;

-------------------------------------------------------------------------

--Question-6
--(a)
--(i)
alter table department
add column Budget int default 10;

--(ii)
update department 
set Budget=12;

--(iii)
drop table employee;

--(b)
--(i)
ALTER TABLE department 
RENAME TO dept_details;

--(ii)
delete from dept_details 
where loc like 'NewYork'

--(iii)
delete from employee  
where salary < (select avg(salary) from employee)

--(iv)
update dept_details 
set dept_no=70,dname='Distribution'
where dname like 'Sales'












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

--(i)
alter table department
add column Budget int default 10;

--(ii)
update department 
set Budget=12;

--(iii)
drop table employee;
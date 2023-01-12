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
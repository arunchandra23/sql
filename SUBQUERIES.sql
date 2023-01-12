
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
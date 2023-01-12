--(i)
select job,count(job) from employee group by job;

--(ii)
select tbl.job,tbl.sum_salary from (select job,sum(salary) sum_salary from employee group by job) as tbl where tbl.sum_salary>5000 ;

--(iii)
select emp_no,emp_name dept_no,salary from employee order by emp_name,dept_no,salary;

--(iv)
select emp_name ,salary*12 as Annual_salary from employee order by Annual_salary desc;

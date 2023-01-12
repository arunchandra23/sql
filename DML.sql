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

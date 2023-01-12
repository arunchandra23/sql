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
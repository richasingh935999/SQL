create table empt
(
empno int primary key, ename varchar(30), job varchar(30), age int, mgrid int, hiredate date, sal float, comm int, deptno int references dept(deptno)
);
alter table empt drop column age

create table dept
(
deptno int primary key , dname varchar(30), loc varchar(30)
);
insert into dept values
(10     ,'ACCOUNTING',    'NEW YORK') ,
(20     ,'RESEARCH',      'DALLAS'), 
(30     ,'SALES',         'CHICAGO'), 
(40    ,' OPERATIONS'    ,'BOSTON' )

insert into empt values
(7369,    'SMITH',      'CLERK'	,7902   	,'17-DEC-80'     	 ,800,	           20,null),
(7499,   'ALLEN',      'SALESMAN',     7698,      '20-FEB-81'    	 ,1600     ,300    ,30),
(7521,   'WARD',	  'SALESMAN',      7698,    '22-FEB-81',  		 1250,     500,    30),
(7566,   'JONES',     'MANAGER',       7839,      '02-APR-81',   	 2975,      null,      20),
(7654,    'MARTIN',    'SALESMAN',     7698,      '28-SEP-81', 		 1250,    1400,    30),
(7698,	  'BLAKE', 	  'MANAGER', 	 7839, 	'01-MAY-81',    	 2850,        null,    30),
(7782, 	  'CLARK',     'MANAGER',      7839,     '09-JUN-81',   	       2450,null,            10),
(7788,    'SCOTT',     'ANALYST',       7566,    '19-APR-87',       	 3000, null,           20),
(7839,    'KING',      'PRESIDENT',    null,       	 '17-NOV-81',       	 5000,     null,      10),
(7844,    'TURNER ',   'SALESMAN',      7698,   	 '08-SEP-81',    	 1500,      0,     30),
(7876,    'ADAMS ',    'CLERK',         7788,   	 '23-MAY-87',       	 1100, null,           20),
(7900,    'JAMES',     'CLERK',     7698,   	 '03-DEC-81',  	  950, null,            30),
(7902,    'FORD',      'ANALYST',       7566,   	' 03-DEC-81',   	 3000,null,            20),
(7934,    'MILLER',    'CLERK',         7782,    	 '23-JAN-82',		 1300,null,            10)

select * from empt
select * from dept
--1. List all employees whose name begins with 'A'. 
select * from empt where ename like'A%'

--2. Select all those employees who don't have a manager. 
select * from empt where mgrid is null

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select empno, ename,sal  from empt where sal between 1200 and 1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
update empt set sal=sal*0.10 from empt e left join dept d on e.deptno=d.deptno where d.dname='Research'

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(job) as 'Number of Clerks employed'from empt where job='CLERK'

--6. Find the average salary for each job type and the number of people employed in each job. select avg(sal) from empt group by job
select job,avg(sal) as 'Average Salary',count(job) as 'No. of employees' from empt group by job
 
 --7. List the employees with the lowest and highest salary. 
select  min(sal)as'Lowest Salary', max(sal) as 'Highest Salary' from empt 

--8. List full details of departments that don't have any employees. 
select * from dept where not exists (select deptno from empt where dept.deptno=empt.deptno)

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select ename,sal from empt where job='Analyst' and sal>1200 and deptno=20 order by ename asc

--10. For each department, list its name and number together with the total salary paid to employees in that department. 
select d.dname,d.deptno,sum(e.sal) as 'Total Salary' from dept d left join empt e on e.deptno=d.deptno group by d.deptno,d.dname

--11. Find out salary of both MILLER and SMITH.
select sal,ENAME from empt WHERE ename='Miller'or ename='Smith'

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’. 
select ename from empt where ename like 'A%'or ename like'M%'

--13. Compute yearly salary of SMITH. 
select ename,sal*12 as 'Yearly Salary' from empt where ename='Smith'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename,sal from empt where sal not between 1500 and 2850
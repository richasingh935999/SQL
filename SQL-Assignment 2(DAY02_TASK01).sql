--1. Retrieve a list of MANAGERS. 
select * from empt where job='Manager'

--2. Find out the names and salaries of all employees earning more than 1000 per month. 
select ename,sal from empt where sal>1000

--3. Display the names and salaries of all employees except JAMES. 
select ename,sal from empt where ename!='James'

--4. Find out the details of employees whose names begin with �S�. 
select * from empt where ename like 'S%'

--5. Find out the names of all employees that have �A� anywhere in their name. 
select ename from empt where ename like '%A%'

--6. Find out the names of all employees that have �L� as their third character in their name. 
select ename from empt where ename like '__L%'

--7. Compute daily salary of JONES. 
select (sal*12/365) as 'Daily Salary' from empt where ename='Jones'

--8. Calculate the total monthly salary of all employees. 
select sum(sal) as 'Total Salary' from empt

--9. Print the average annual salary . 
select avg(sal*12) as 'Average Annual Salary' from empt

--10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30.
select ename,job,sal,deptno from empt where job!='Salesman' and deptno=30

--11. List unique departments of the EMP table. 
select distinct(deptno) from empt;

--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename as 'Employee',sal as 'Monthly Salary' from empt where sal>1500 and deptno in(10,30) 

--13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename,job,sal from empt where job in ('Manager','Analyst') and sal not in (1000,3000,5000)

--14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select ename,sal,comm from empt where comm>=sal*0.10

--15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select ename from empt where ename like '%L%L%' and (deptno=30 or mgrid=7782);

--16. Display the names of employees with experience of over 10 years and under 20 yrs.Count the total number of employees. 
select ename from empt where DATEDIFF(MONTH,hiredate,GETDATE())/12 BETWEEN 10 AND 20

--17. Retrieve the names of departments in ascending order and their employees in descending order. 
select empt.ename,dept.dname from empt join dept on empt.deptno = dept.deptno order by dept.dname asc ,empt.ename desc;

--18. Find out experience of MILLER.
select DATEDIFF(MONTH,hiredate,GETDATE())/12 as Experience from empt where ename='MILLER'





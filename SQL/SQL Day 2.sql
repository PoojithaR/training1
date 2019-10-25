/*Query 2*/
#1
select * from Employee where YEAR(Hiredate) like 1981
#2
select * from Employee where Hiredate like '%81%'
#3
select *,DATEPART(yy,Hiredate) as Year from Employee where Hiredate like '%81%'
#4
select * from Employee where Hiredate between '1981' and '1982'

/*Query 3*/
select Emp_no,Emp_name into Emp10
from Employee 
where Dept_no=10 and Salary is not null 
Select * from Emp10

/*Query 4*/
select sum(Salary) as "Total Salary" from Employee where job='Analyst' and Dept_no=20 

/*Query 5*/
select * from Employee where Emp_name like '%A%I%'and Emp_name like '%I%A%' and Emp_name not like '%E%'

/*Query 6*/
update Employee set Emp_name=null where comm=0
Select * from Employee

/*Query 7*/
select Emp_name,Salary*1.15 as'HRA',Salary*1.10 as 'DA',Salary*1.05 as 'PF',
((Salary+Salary*1.15+Salary*1.10 )-Salary*1.05) as 'Total Salary'
from Employee
order by "Total Salary" desc

/*Query 8*/
select * from Employee where Len(Emp_name)=5;

/*SET 2*/
/*Query 1*/
select * from Employee where Job like 'Manager'

/*Query 2*/
select Salary,Emp_name from Employee where Emp_name='Miller' or Emp_name='Smith'

/*Query 3*/
Select Emp_name,Salary from Employee where Salary>1000

/*Query 4*/
Select Emp_name,Salary from Employee where Emp_name not like 'James'

/*Query 5*/
select * from Employee where Emp_name like 'S%'

/*Query 6*/
select * from Employee where Emp_name like '%A%'

/*Query 7*/
select * from Employee where Emp_name like '__l%'

/*Query 8*/
select * from Employee where Emp_name like 'A%M%' or Emp_name like 'M%A%'

/*Query 9*/
select Emp_name,Salary*12 as 'Yearly Salary' from Employee where Emp_name like 'Smith'

/*Query 10*/
select Emp_name,Salary/30 as 'Daily Salary' from Employee where Emp_name like 'Jones'

/*Query 11*/
select sum(Salary) as 'Total Monthly Salary' from Employee

/*Query 12*/
select avg(Salary*12) as 'Annual Salary' from Employee 

/*Query 13*/
select Emp_name,Job,Salary,Dept_no from Employee where Job not like'Salesman' and Dept_no=30

/*Query 14*/
select distinct D.Dname from Employee E,Dept D where E.Dept_no=D.Dept_no 

/*Query 15*/
select Emp_name as'Employee',Salary as'Monthly Salary' from Employee where Salary>1500 and Dept_no=10 or Dept_no=30 

/*Query 16*/ 
select Emp_name,Salary from Employee where Salary not between 1500 and 2850

/*Query 17*/
select Emp_name,Job from Employee where Mgr=0

/*Query 18*/
select Emp_name,Job,Salary from Employee where Job like 'Manager' or Job like 'Analyst' and Salary <>1000 or Salary <>3000 or Salary <>5000

/*Query 19*/
select Emp_name,Salary,Comm from Employee where Comm>Salary*1.10

/*Query 20*/
select Emp_name from Employee where Emp_name like '%ll%' and Dept_no=30 or Mgr=7782

/*Query 21*/
select Emp_name from Employee where DATEDIFF(YEAR, Hiredate, GETDATE())<10 and DATEDIFF(YEAR, Hiredate, GETDATE())>20

/*Query 22*/
Select E.Emp_name,D.Dname from Employee E,Dept D  where E.Dept_no=D.Dept_no order by D.Dname asc,Emp_name desc

/*Query 23*/
select DATEDIFF(YEAR, Hiredate, GETDATE()) as 'Experience Of Miller' from Employee where Emp_name='Miller'

/*Query 24*/
select count(distinct Dept_no)as 'Department Count' from Employee

/*Query 25*/
select E.Emp_name,D.Dname from Employee E,Dept D
where D.Dept_no=E.Dept_no and D.Dname='Sales' or D.Dname='Research' group by D.Dname,E.Emp_name

/*Query 26*/
select D.Dname,avg(Salary) as 'Average Salary' from Employee E,Dept D
where D.Dept_no=E.Dept_no group by D.Dname

/*Query 27*/
select min(Salary) as 'Minimum Salary',max(Salary) as 'Maximum Salary'
from Employee 

/*Query 28*/
select D.Dname,min(Salary) as 'Minimum Salary',max(Salary) as 'Maximum Salary'
from Employee E,Dept D
where D.Dept_no=E.Dept_no group by D.Dname

/*Query 29*/
select * from Employee where Job='Clerk' and Salary <1000


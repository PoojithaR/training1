CREATE DATABASE Poojitha_Trainee

use Poojitha_Trainee

create table Employee
(
Emp_id int primary key,
Emp_name varchar(30),
Salary float,
)

insert into Employee values(100,'Ram',12000)

alter table Employee add doj date 

insert into Employee(Emp_id) values (101)



insert into Employee values(102,'Archie',null)
insert into Employee values(103,'Betty',14000,null)


alter table Employee drop column doj

update Employee set Salary=17500 where Emp_id=102

insert into Employee values(104,'Veronica',20000,'22 Sep 2019')

alter table Employee add check (Salary>5000)


alter table Employee add constraint un_name unique(Emp_name)

select Emp_id,Emp_name,Salary from Employee where Salary>12000

drop table Employee







/*Day 1 Assignment*/


create table Dept
(
Dept_no int primary key,
Dname char(20),
Loc char(20),
)

create table Employee(
Emp_no int primary key,
Emp_name char(10),
Job char(20),
Mgr int,
Hiredate date,
salary float,
Comm int,
Dept_no int foreign key references Dept(Dept_no),
)

insert into Dept values(10,'Accounting','New York')
insert into Dept values(20,'Research','Dallas')
insert into Dept values(30,'Sales','Chicago')
insert into Dept values(40,'Operations','Boston')

select * from Dept
select * from Employee

insert into Employee values(7369,'Smith','Clerk',7902,'17 Dec 1980',800,'',20)
insert into Employee values(7499,'Allen','Salesman',7698,'20 Feb 1981',1600,300,30)
insert into Employee values(7521,'Ward','Salesman',7698,'22 Feb 1981',1250,500,30)
insert into Employee values(7566,'Jones','Manager',7839,'02 Apr 1981',2975,'',20)
insert into Employee values(7654,'Martin','Salesman',7698,'28 Sep 1981',1250,1400,30)
insert into Employee values(7698,'Blake','Manager',7839,'01 May 1981',2850,'',30)
insert into Employee values(7782,'Clark','Manager',7839,'09 Jun 1981',2450,'',10)
insert into Employee values(7788,'Scott','Analyst',7566,'19 Apr 1987',3000,'',20)
insert into Employee values(7839,'King','President',0,'17 Nov 1981',5000,'',10)
insert into Employee values(7844,'Turner','Salesman',7698,'08 Sep 1981',1500,'',30)
insert into Employee values(7876,'Adams','Clerk',7788,'23 May 1971',1100,'',20)
insert into Employee values(7900,'James','Clerk',7698,'03 Dec 1981',950,'',30)
insert into Employee values(7902,'Ford','Analyst',7566,'03 Dec 1981',3000,'',20)
insert into Employee values(7934,'Miller','Clerk',7782,'23 Jan 1982',1300,'',10)


/*Queries*/

/*1*/
Select * from Employee where Emp_name like'A%'

/*2*/
select * from Employee where Mgr=0

/*3*/
select Emp_name,Emp_no,Salary  
from Employee
where Salary between 1200 and 1400

/*4*/
update Employee set Salary=Salary*1.10 where Dept_no=(
Select Dept_no from Dept where Dname='Research')
select * from Employee where Dept_no=20

/*5*/
select count(Emp_name) as Count_Of_Clerks from Employee where Job='Clerk'

/*6*/
select distinct Job,avg(Salary) as AverageSalary,count(Emp_no) as NoOfPeople from Employee group by Job;

/*7*/
select Emp_no,Emp_name,Salary as "Min/Max" from Employee where Salary<=all(select Salary from Employee)
UNION
select Emp_no,Emp_name,Salary as "Min/Max" from Employee where Salary>=all(select Salary from Employee)

/*8*/
Select * from Dept where NOT EXISTS( select * from Employee where Employee.Dept_no=Dept.Dept_no)

/*9*/
Select Emp_name,Salary from Employee where Job='Analyst' and Salary>1200 and Dept_no=20 order by Emp_name;

/*10*/
select  E.Dept_no,D.Dname,sum(Salary) as "Total Salary"
from Employee as E,Dept as D
where E.Dept_no=D.Dept_no group by E.Dept_no,Dname

sp_help Employee
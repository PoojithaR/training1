
create view vWEmp as 
(select Emp_no,Emp_name,Dept_no from Employee)

select * from vWEmp

update vWEmp set Emp_name='Bob' where Emp_no=7566

create procedure EmpDetails
as select * from Employee

exec EmpDetails

create procedure ProcgetData @Emp_no int
as 
begin
select salary from Employee where Emp_no=@Emp_no
end

exec ProcgetData 7369

alter procedure getSalary @Emp_no int ,@Sal float output
as 
begin
select @Sal=salary from Employee where Emp_no=@Emp_no
end


declare @mysal float
exec getSalary 7369,@mysal output
print @mysal

exec getSa

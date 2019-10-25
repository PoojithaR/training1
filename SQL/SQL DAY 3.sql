select * from categories
select * from Customers
select * from Employees
select * from [Order Details]





/*Assignment*/

/*Query 1*/
select * from Customers where Country like 'Germany'

/*Query 2*/
select concat(FirstName,LastName) as 'Full Name Of Employees' from Employees 

/*Query 3*/
select * from Customers where Fax is not null

/*Query 4*/
select * from Customers where ContactName like'_U%'

/*Query 5*/
select * from [Order Details] where UnitPrice>10 and UnitPrice<20

/*Query 6*/
select * from Orders where ShippedDate is not null order by ShippedDate

/*Query 7*/
select * from Orders where ShipName like 'La corne d_abondance' and ShippedDate between '1998-02-03' and '1998-03-27'

/*Query 8*/
select * from Suppliers where CompanyName like 'Exotic Liquids'

/*Query 9*/
select P.ProductID,avg(O.Quantity) as 'Average Quantity' from Products P,[Order Details] O
where P.ProductID=O.ProductID group by O.Quantity,P.ProductID

/*Query 10*/
select O.ShipName,S.CompanyName as "Shipping Company Name" 
from Orders O join Shippers S on O.ShipVia=S.ShipperID 
group by O.ShipName,S.CompanyName;

/*Query 11*/
select * from Employees where ReportsTo is not null

/*Query 12*/
create procedure Bill @id integer as
begin
select P.ProductName,C.CategoryName,P.UnitPrice,((O.UnitPrice-O.Discount)*O.Quantity) as "Price after Discount" 
from Products P join Categories C on P.CategoryID=C.CategoryID join [Order Details] O on O.ProductID=P.ProductID 
where O.OrderID=@id;
end

exec Bill 10249


/*Query 13*/
select Shippers.CompanyName,O.OrderID, S.CompanyName, ((O.UnitPrice-O.Discount)*O.Quantity) as "TotalPrice"
 from Products P join Suppliers S on P.SupplierID=S.SupplierID join [Order Details] O on 
 O.ProductID=P.ProductID join Orders on Orders.OrderID=O.OrderID join Shippers on Orders.ShipVia=Shippers.ShipperID 
 where S.CompanyName='Exotic Liquids' and ((O.UnitPrice-O.Discount)*O.Quantity)>50;


/*Stored Procedure*/
/*1*/
Create procedure Factorial @num int 
as begin
Declare @i int = 1,@res int=1
while (@i<=@num)
Begin
	Set @res = @res * @i
	Set @i += 1
End
Select @res as "Factorial"
End
 
exec Factorial 6

/*2*/
Create procedure Salary @sal float
as
begin
declare @hra float
declare @pf float
declare @da float
declare @it float
declare @deductions float
declare @gross float
declare @net float
set @hra=1.1*@sal;
set @pf=1.08*@sal;
set @da=1.2*@sal;
set @it=1.05*@sal;
set @deductions=@pf+@it;
set @gross=@sal+@hra+@da;
set @net=@gross-@deductions;
select @sal as "SALARY"
select @hra as "HRA"
select @pf as "PF"
select @da as "DA"
select @it as "IT"
select @deductions as "DEDUCTIONS"
select @gross as "GROSS SALARY"
select @net as "NET SALARY"
END


exec Salary 1000
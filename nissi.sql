SELECT TOP (1000) [empid]
      ,[empname]
      ,[designation]
      ,[salary]
      ,[deptid]
  FROM [subquery].[dbo].[emp]


select*from emp

create procedure Nissi 
as
select*from Emp
where Empid>2

exec Nissi

sp_helptext nissi

create procedure p 
as
begin
select empname from [dbo].[emp]
end

exec p

alter procedure p
as
begin
select empname,designation,deptid from [dbo].[emp]
end

exec p

drop procedure p

select*from emp

create procedure prolist @designation char(50)
as
begin
select [empid],[designation],[empname]
from [dbo].[emp]
where [designation]=@designation
end

sp_helptext emplist

sp_helptext prolist

drop  procedure prolist

exec prolist 'tester'
exec prolist 'programmer'

sp_rename 'prolist','emplist'

exec emplist 'programmer'

create procedure nissi1 @empname nvarchar(20),@deptid int
as
select * from Emp
where empname=@empname and deptid=@deptid

exec nissi1 @empname='john',@deptid=1

alter procedure nissi1 @empname nvarchar(20),@deptid int
as
select * from emp
where empname=@empname or deptid=@deptid

exec nissi1 @empname='paul',@deptid=1



create procedure listed @salary money,
as
begin
select [empid],[designation],[empname],[salary]
from [dbo].[emp]
where [salary]=@salary
end


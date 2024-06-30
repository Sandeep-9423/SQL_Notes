create database Batch
use batch

create table student(id int,name char(20),dept char(20))
insert into student values(1001,'Yuvan','IT'),(1002,'Dinesh','CSE'),(1003,'Karthik','IT')
insert into student values(1004,'Priya','Aero'),(1005,'Dharani','CSE')


select *from student

declare @variable_name datatype

--set @variable_name=value
--print @variablename
--select @variable_name

declare @a int
set @a=12
print @a

declare @x int,@y int
set @x=12
set @y=14
declare @res int
set @res=@x+@y
print @res

declare @name char(20)
select @name='oliver'
print @name

declare @t int
set @t=13
select @t

declare @a int
set @a=12
if @a<20
print 'Value is lesser'
else 
print 'value is greater'


declare @a int
set @a=25
if @a<20
print 'value is less'
else
print 'value is greater'

declare @d char(20)
select @d=dept from student where id=1002
if @d='CSE'
print 'accepted'
else
print 'Rejected'

select id,name,dept,'department description'=case dept
when 'IT' then 'Information Technology'
when 'CSE' then 'Computer Science Engineering'
when 'Aero' then 'Aeronautical Engineering'
else 'Notapplicable'
end 
from student

create table employee(id int primary key,name char(20))
insert into employee values(1001,'kishore')

begin try
insert into employee values(1002,'Hari')
end try
begin catch
print'Dont insert duplicate records! please try again!'
end catch

begin try
insert into employee values(1002,'Hari')
end try 
begin catch
select Error_line()
select ERROR_MESSAGE()
select ERROR_PROCEDURE()
select ERROR_SEVERITY()
select ERROR_STATE()
select ERROR_NUMBER()
end catch



--raiseerror('Errormessage','severity','state')

severity various levels 0.25
state -various levels 0 to 255

declare @a int 
set @a=5
if @a<10
raiserror('Number is not Valid',16,1)

Create table errorlog
(errorid int identity (1,1),
  Errordate datetime,
  ErrorMessage Nvarchar(255)) on [primary]

  insert into errorlog values(1,'default date','not valid')
  
  select*from errorlog

 
  
DECLARE @DUPDATE AS DATETIME
   

BEGIN TRY
    INSERT INTO Example(code, startdate, enddate)
    VALUES (1, @DUPDATE, @DUPDATE)

	create procedure pr6 @i int
	as
	begin
	if exists(select*from student where id=@i)
	begin
	print'Record Found'
	return 0
	end
	else
	begin
	print'No Record Found'
	return 1
	end 
	end

	exec pr6 1008

	create procedure pr7 @i int
	as
	begin
	declare @res int 
	exec @res=pr6 @i
	if(@res=0)
	select*from student where id=@i
	else
	print'Error in Retrieving Records'
	end

exec pr7 1001
exec pr7 1008

select *from student

with oliver(id,name,dept)
as
(select*from student where id>1002)
select*from oliver order by dept

with temp(id,name,dept)
as
(select*from student where id>1003)
select*from temp order by name

with list_CTE(i)
as
(select i=convert(varchar(8000),'Welcome')   ---//anchor query (---we need to use varchar instead of char)
union all
select i+'A' from  list_CTE where LEN(i)<10)   ----//recursive query
select i from List_CTE order by i

create table demo(id int,picture varbinary(max))   ----insert image 
insert into demo values(1001,Cast('C:\Users\Dell\Desktop\All\HD Wallpapers\pxfuel.jpg' as varbinary(max)))
select*from demo

create table demo1
(id int,data geography)     ----location
insert into demo1 values(1001,Geography::Parse('POINT(-92.9876 83.564)'))
select*from demo1

create table demo2   -----not much in use 
(id int identity(500,1),name char(20),key_value uniqueidentifier default(newsequentialid()))
insert into demo2 values('Arun',default)
insert into demo2 values('Yuvraj',default)
insert into demo2 values('Ragvan',default)
insert into demo2 values('manoj',default)
select*from demo2

create table table1(id int,sanme char(20))
insert into table1 values(1001,'Shivam'),(1002,'Ishwar'),(1003,'Pugal')
select*into table2 from table1

select*from table1
select*from table2

update table1 set sanme='Oliver' where id=1002
update student set dept='mech' output inserted.*
where id=1001

update student set dept='Aero'
output deleted.*
where id=1002

update student 
set dept='IT'
output inserted.name
where id=1003

create table geek_demo(name varchar(10))
insert into geek_demo values('A'),('B'),('B'),('c'),('C'),('D'),('E')
select*from geek_demo

select name,
rank()over(order by name)
as
rank_no
from geek_demo

select name,
dense_rank()over(order by name)
as
rank_no
from geek_demo

create table geeks_demo(id int not null)
insert into geeks_demo(ID)values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10)

select id,NTILE(2)over(order by id)group_number from geeks_demo

select getdate()
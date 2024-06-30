create database multiplefunctions
use multiplefunctions
create table Empinfo(empid int,empname nvarchar(20),salary money)
insert into Empinfo values(1,'amar',20000),(2,'sandeep',22000),(3,'jayesh',25000),(4,'sakashi',30000),(5,'nehal',32000),(6,'Krishnaji',28000)
select *from Empinfo

create function payrate (@salary money) returns @table table 
(empid int not null,empname nvarchar(20) not null,
salary money not null) 
as begin insert @table
select*from [dbo].[Empinfo]
where salary>@salary 
return end

select*from payrate(22000)

create table practicefunction(id int,name nvarchar(20),fees int,datetimechange datetime)
insert into practicefunction values(1,'dadu',2000,18-11-1997),(2,'dad',1500,13-05-1973),(3,'mom',1200,06-06-1979),(4,'Rani',8000,16-03-1998),(5,'dada',90000,30-12-1996)
insert into practicefunction values(6,'sakshi',2200,22-04-2002)
insert into practicefunction values(7,'gambler',12000,15-09-2023)
SELECT GETDATE()
select*from practicefunction

create function rate(@rate int) returns @pfun table
(id int not null,name nvarchar(20) not null,
fees int not null,
datetimechange datetime not null)
as begin insert @pfun
select*from[dbo].[practicefunction]
where fees>@rate
return end

select*from rate(1400)
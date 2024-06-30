create database groupon
use groupon
create table groupon(id int identity (1,1) not null,ename  nvarchar(20),city nvarchar(20),salary money)
insert into groupon values('san','mum',20000)
insert into groupon values('an','nw',22000)
insert into groupon values('sn','mo',25000)
insert into groupon values('nan','pun',26000)
insert into groupon values('kol','chan',22500)
select*from groupon

select city, sum(salary) as totalsalary from groupon group by(city)
create table groupa as select* from groupon
create database groupings
use groupings
create table sales(Empid int,yr int,sales money)
insert into sales values(1,2005,12000),(1,2006,18000),(1,2007,25000),(2,2005,12000),(2,2006,6000),(3,2006,20000),(3,2007,6000)

select*from sales
select empid,yr,avg(sales)avgvachours from sales group by grouping sets((Empid,yr),(yr),(Empid))
select empid,sales,yr from sales order by empid offset 3 rows fetch next 2 rows only

alter table sales add city nvarchar(20)

update sales set city='mumbai' where Empid=1

select*from sales
select*from sales where city is null
select*from sales where city is not null


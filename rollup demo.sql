create database demo
use demo
create table Demo(Dept varchar(255),section varchar(255),marks int)
insert into demo values('CSE','A',45)
insert into demo values('CSE','B',98)
insert into demo values('IT','A',100)
insert into demo values('IT','B',32)
select*from demo

select dept,section,sum(marks) from demo group by dept,section with rollup
select dept,section,sum(marks) from demo group by dept,section with cube

select dept,section,avg(marks) from demo group by dept,section with rollup
select dept,section,avg(marks) from demo group by dept,section with cube

select dept,section,max(marks) from demo group by dept,section with rollup
select dept,section,max(marks) from demo group by dept,section with cube

select dept,section,min(marks) from demo group by dept,section with rollup
select dept,section,min(marks) from demo group by dept,section with cube

select dept,section,count(marks) from demo group by dept,section with rollup
select dept,section,count(marks) from demo group by dept,section with cube


create database viewpractice
use viewpractice
create table viewpractice(eid int,ename char(20),dept char(30),age int,mailid char(30),
mno char(20),gender char(10),salary float,addresss char(20),martialstatus char(20))
insert into viewpractice values(1002,'amay',',mechancial',26,'amay@gmail.com','98756542015','male',350222,'mumbai','single')
insert into viewpractice values(1003,'kumar',',IT',25,'kumarbhau@gmail.com','807565425482','male',550450,'panvel','married')

create view V_manager as select eid,ename,dept,mailid,martialstatus from viewpractice
select*from V_manager

create view V_guide as select eid,ename,dept from viewpractice
select*from V_guide

create view V_friend as select eid,ename,age,mno,gender,addresss,salary, mailid from viewpractice
select*from V_friend


update V_manager set dept='testing' where eid=1002
select*from V_manager

create table program(eid int,pname char(20),pno char(20))
insert into program values(1001,'Data science','982222511')



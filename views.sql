create database viewss
use viewss
create table employee(eid int,ename char(20),dept char(30),age int,mailid char(30),
mno char(20),gender char(10),salary float,addresss char(20),martialstatus char(20))

insert into employee values(1001,'ajay','IT',24,'Ajay@gmail.com','9875266225','male',34500,'delhi','single')

create view V_manager as select eid,ename,dept,mailid from employee
select*from V_manager

create view v_friend as select eid,ename,mno,mailid,addresss,martialstatus from employee
select*from v_friend

create view V_guide as select eid,ename,mno from employee
select*from V_guide

update V_manager set dept='testing' where eid=1001
select*from V_manager

create table program(eid int,pname char(20))
insert into program values(1001,'JAVA')

create view view2 as select e.eid,e.ename,e.dept,p.pname from employee e join program p on e.eid=p.eid
select * from view2

update view2 set ename='sandeep',pname='Programmer' where eid=1001

alter view v_manager as select eid,ename,dept,mailid,salary from employee
select * from v_manager

sp_rename 'v_manager','view_data'
select*from view_data
alter view view_data as select eid,ename,dept,mailid,salary from employee

select*from view_data

drop view view_data
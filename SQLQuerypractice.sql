Create database sqldepartment
use sqldepartment
create table Department (Deptid int primary key,deptname nvarchar(20))
insert into department values ( 1,'mechanical')
insert into department values ( 2,'production')
insert into department values ( 3,'operations')
insert into department values ( 4,'Logistics')
Drop Table department
create table Department (Deptid int primary key,deptname nvarchar(20))
insert into department values ( 1,'mechanical')
insert into department values ( 2,'production')
insert into department values ( 3,'operations')
insert into department values ( 4,'Logistics')

Create table EmpDep (Deptid int foreign key references Department (Deptid),salary money)
insert into EmpDep values ( 1,20000)
insert into EmpDep values ( 1,250000)
insert into EmpDep values ( 2,18000)
insert into EmpDep values ( 3,19000)
insert into EmpDep values ( 2,15000)
insert into EmpDep values ( 3,16000)
select* from EmpDep
insert into EmpDep values ( 3,16000)
select*from EmpDep where id=2;

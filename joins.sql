create database sample1
use sample1
create table Empdetails12(Eid int primary key,ename Nvarchar(20) not null,salary money check(salary>=20000),city nvarchar(20) default'jalgaon',phone varchar(255) unique)
insert into Empdetails12 values(1,'sandeep ',25000,'mumbai',9423435263)
insert into Empdetails12 values(2,'akash ',26000,'new mumbai',7423435263)
insert into Empdetails12 values(3,'Amit',28000,'mumbai',8023435263)
insert into Empdetails12(Eid,ename,salary,phone) values(4,'it',39000,8023435593)



select*from Empdetails12

create table Emp25(id int not null,age int)
insert into Emp25 values(1,18),(2,25),(3,21)
select*from Emp25


create table table1(id int,code nvarchar(20))
insert into table1 values(1,'AAA')
insert into table1 values(2,'BBB')
insert into table1 values(3,'CCC')
create table table2(id int,amount money)
insert into table2 values(1,30000)
insert into table2 values(2,40000)
insert into table2 values(4,50000)
select*from table1 A inner join table2 B on A.id=B.id;
select*from table1 A left outer join table2 B on A.id=B.id;
select*from table1 A right outer join table2 B on A.id=B.id;
select*from table2 A inner join table1 B on A.id=B.id;
select*from table1 A full outer join table2 B on A.id=B.id;


create table table3(id int,code nvarchar(20))
create table table31(id int primary key,code nvarchar(20))
insert into table31 values(1,'aaa')
insert into table31 values(2,'bbb')
insert into table31 values(3,'ccc')

create table table42(id int foreign key references table31(id),Amount money)
insert into table42 values(1,40000)
insert into table42 values(1,25000)
insert into table42 values(2,30000)
insert into table42 values(2,45000)
insert into table42 values(4,60000)

select*from table31 C join table42 e On C.id=e.id
select*from table31 C join table42 e On C.id=e.id


create table t1(customerid int primary key,customername nvarchar(20))
insert into t1 values (1,'sandeep'),(2,'jayesh'),(3,'samir')
select*from t1

create table Employee(Employeeid int,lastname nvarchar(20),managerid  int)
insert into Employee values(100,'king',null),(101,'kochhar',100),(102,'de haan',100),(103,'hunold',102)
select e.lastname employee,m.lastname manager from employee e join employee m on (e.managerid=m.employeeid) 
select*from employee

create  table student(studentid int,firstname nvarchar(20),friendid int)
insert into student values(1,'jay',3),(2,'ray',1),(3,'may',2),(4,'say',null)
select* from student
select e.firstname student,g.firstname friend from student e join student g on (e.studentid=g.friendid)

create table patient(patientid int,age int not null,pname nvarchar(20),doctorid  int)
insert into patient values(1,23,'samir',3),(2,13,'amir',1),(3,22,'mir',2),(4,23,'ir',null)
select*from patient
select e.pname patient,g.pname doctor from patient e join patient g on (e.patientid=g.doctorid)


create table Empslef(Empid int,empname nvarchar(20),salary money,deptid int,deptname nvarchar(20))
insert into Empslef values(1,'sandeep',20000,6,'Hr'),(2,'aman',10000,5,'admin'),(3,'michael',22000,4,'teacher'),(4,'jonhson',25000,3,'teacher'),(5,'clark',30000,2,'principal'),(6,'andrew',32000,1,'admin');
select*from Empslef
delete Empslef


select e.empname empslef,g.empname deptname from empslef e join empslef g on (g.empname=e.deptname)


create table empsk(empid int,empname nvarchar(255),deptid int,deptname nvarchar(255));
insert into empsk values(1,'sakshi',100,'HR'),(2,'rama',100,'HR'),(3,'seema',101,'admin');
select * from empsk
delete empsk
select e.empid empsk,g.deptid,g.empname as deptname from empsk e join empsk g
on (e.deptid=g.deptid)


create table employees (empid int,fullname nvarchar(20),salary money,managerid int);
insert into employees values(1,'john',10000,3),(2,'jen',12000,3),(3,'tom',15000,4),(4,'annie',20000, null),(5,'york',90000,1);
select * from employees
delete employees
select e.empid,e.fullname,e.managerid,f.fullname as managername from employees e join employees f
on (e.managerid=f.empid)


create database subquery
use subquery
create table dept(deptid int primary key,dname varchar(30),location varchar(30))

create table emp(empid int primary key,empname varchar(30),designation varchar(30),salary money,deptid int references dept(deptid))

create table salgrade(grade char(1) primary key,lowsal int,highsal int)

create table exemp(empid int primary key,empname varchar(30),designation varchar(30),salary money,deptid int references dept(deptid))
select*from exemp
drop table exemp

create table activeemp(empid int primary key,empname varchar(30),designation varchar(30),salary money,deptid int references dept(deptid))

insert into dept values(1,'sales','kolkata'),(2,'marketing','chennai'),(3,'production','mumbai'),(4,'quality control','hyderabad')

insert into emp values(1,'suresh','programmer',34000,2)
insert into emp values(2,'john','accountant',23000,1)
insert into emp values(3,'abdul','programmer',32000,1)
insert into emp values(4,'paul','tester',27000,3)
insert into emp values(5,'sneha','manager',30000,1)
insert into emp values(6,'rohini','accountant',25000,3)
insert into emp values(7,'jaya prasad','programmer',23000,2)
insert into emp values(8,'kiran','Asst.Manager',27000,2)
insert into emp values(9,'samuel','tester',20000,3)
insert into emp values(10,'srinath','manager',29000,1)

insert into salgrade values('A',30001,600000),('B',1500001,300000),('c',2000,15000)

insert into exemp values(1,'suresh','Techncal Assistant',23000,2)
insert into exemp values(4,'paul','Technical Assistant',15000,3)
insert into exemp values(8,'kiran','Accountant',19000,2)
insert into exemp values(110,'XXXX','Clerk',5400,1)
insert into exemp values(121,'PPP','Tester',14500,2)

insert into activeemp values(1,'suresh','programmer',34000,2)
insert into activeemp values(2,'john','Accountant',23000,1)
insert into activeemp values(3,'Abdul','programmer',32000,1)
insert into activeemp values(4,'paul','tester',27000,3)
insert into activeemp values(25,'Ramesh','technician',40000,2)

select*from emp where salary>=(select avg(salary)from emp)
select*from emp e1 where salary>=(select avg(salary)from emp e2 where e2.deptid=e1.deptid or salary>=27000)
select*from  emp e1 where exists(select*from exemp where empid=e1.empid)
select*from emp e1 where salary in(select salary from emp where deptid=1)
select*from emp e1 where salary>all(select salary from emp where deptid=1)
select*from emp e1 where salary>any(select salary from emp where deptid=1)
select*from emp e1 where salary<any(select salary from emp where deptid=1)

select*from emp e1 where salary>any(select salary from emp where deptid=2)
select*from emp

select*from emp e1 where e1.salary=(select max(salary)from emp e2 where e2.salary<
(select max(salary) from emp))



SELECT*FROM emp WHERE salary <ANY(SELECT salary FROM EMP WHERE salary>=20000)
select GETDATE()

create table Employee(id int,name nvarchar(20),age int,addresss nvarchar(20),salary money)
insert into Employee values(1,'john',20,'US',2000)
insert into Employee values(2,'stephan',26,'DUBAi',1500)
insert into Employee values(3,'david',27,'Bangkok',2000)
insert into Employee values(4,'alina',29,'UK',6500)
insert into Employee values(5,'kathrin',34,'Banglore',8500)
insert into Employee values(6,'Harry',42,'china',4500)
insert into Employee values(7,'jackson',25,'Mizoram',10000)
select*from Employee
select*from Employee where id in(select id from Employee where salary>4500)

select*into Employee_BKP from Employee

update Employee set salary=salary*1.25 where age in(select age  from Employee_BKP where age>=29)
select*from Employee
update Employee set salary=salary+(salary*0.25) where age in(select age  from Employee_BKP where age>=29)
select*from Employee

delete from Employee where age in(select age from Employee_BKP where age>=29)
select*from Employee

select*into sandeep_BKP from Employee
select* from sandeep_BKP
delete from sandeep_BKP
insert into sandeep_BKP select*from Employee where id in(select id from Employee)
select*from sandeep_BKP
select*from Employee

update Employee_BKP set salary= salary+(salary*0.25) where age in(select age from Employee where age<=25)
select*from Employee

update Employee_BKP set salary= salary+salary*0.50 where age in (select age from Employee where age>=29) 
select*from Employee_BKP

update Employee_BKP set salary=salary*0.75 where age in (select age from Employee where age<=29)

update Employee_BKP set salary=salary*0.95 where id in (select id from Employee where id=5)
select*from Employee_BKP

update Employee_BKP set salary=salary*1.15 where id in (select id from Employee where id=7)
update Employee_BKP set salary=(salary*0.15)+salary where id in (select id from Employee where id=7)

update Employee_BKP set salary=(salary*0.15)+salary where addresss in (select addresss from Employee where addresss='bangkok')
select*from Employee_BKP

update Employee_BKP set age=(age*0.15)+age where id in (select id from Employee where id=7)
select*from Employee_BKP
select*from Employee




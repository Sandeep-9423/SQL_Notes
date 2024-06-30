Create database sqlbatchsandeep1
use sqlbatchsandeep1
create table Emp (id int,salary money,name nvarchar(20))
insert into Emp values(1,20000,'Tanay')
insert into Emp values(2,25000,'Prafull')
insert into Emp values(3,28000,'Pankaj')
insert into Emp values(4,30000,'Akash')
insert into Emp values(5,32000,'Nishudhan')
Select* From Emp
select id,salary,salary+100 From Emp
select id,salary,salary*2 From Emp
select top 2*from  Emp
select top 50 Percent*from Emp
select id,salary,salary-500 From Emp
Alter Table Emp add city Nvarchar(20)
Update Emp Set city='Mumbai' Where Id =1
Update Emp Set city='Navi Mumbai' Where Id =2
Update Emp Set city='Thane' Where Id =3
Update Emp Set city='Vashi' Where Id =4
Update Emp Set city='Nerul' Where Id =5
Select* From Emp
select id,salary,salary*12 From Emp
Select* From Emp

insert into Emp values(6,38000,'Yogesh','Seawoods'),(7,40000,'Amit','Ghansoli'),(8,42000,'Saket','Nashik')
insert into Emp values(9,48000,'Yamraj','')
Update Emp Set city='Jalgaon' Where Id =9
select top 50 Percent*from Emp
insert into Emp values(10,50000,'Suman','Delhi')
Select* From Emp
select top 2*from  Emp
select top 70 Percent*from Emp
Select* From Emp
select id,salary,salary+100 From Emp
select id,salary,salary*2 From Emp
Alter table Emp Add Phone Bigint
Alter table Emp Drop Column Phone
Select* From Emp
---
create table tableA (id  int, name nvarchar(20))
insert into TableA values(1,'Tanay'),(2,'Jayesh'),(3,'Sandeep'),(4,'Prafull'),(5,'Akash')
create table tableB (id  int,Salary money)
insert into TableB values(1,32000),(3,25000),(5,28000),(6,30000),(7,35000)
Select* From Emp
select id  from TableA 
union
select  id from TableB
select id  from TableA 
union all
select  id from TableB
select id  from TableA 
intersect
select  id from TableB
select id  from TableA 
Except
select  id from TableB
select id  from TableB
Except
select  id from TableA
Select* From Emp
--Alter table Emp Drop Column Phone

select*from  tableA,tableB
create table parent(id int primary key,name nvarchar(20))
insert into parent values (1,'ajit'),(2,'Geeta')
Select* From Emp
create table Child (id int foreign key references parent (id),fees money)
insert into child values (1,10000)
insert into child values (1,20000)
insert into child values (2,30000)
insert into child values (3,40000)
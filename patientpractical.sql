create database doctor
use doctor
create table patientdetail(id int not null ,age int,pname nvarchar(20),phone bigint not null)
insert into  patientdetail values(1,23,'dadu',9423435263)
insert into  patientdetail values(2,24,'prafull',7506879290)
insert into  patientdetail values(3,22,'sheshi',9423435268)
select* from patientdetail
create table patient(id int not null primary key,Dept nvarchar(20))
insert into patient values(1,'ent')
insert into patient values(2,'opd')
insert into patient values(3,'surgery')
insert into patient values(4,'OBGY')
insert into patient values(5,'PEDIATRICS')
select* from patient
create table patient1(id int foreign key,pname nvarchar(20),diseases nvarchar(20))
insert into patient1 values(1,'dadu')
select* from patient1
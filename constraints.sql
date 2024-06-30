create database constnull
use constnull
create table persons(id int not null,age int)
insert into persons values(null,25)
insert into persons values(20,null)
select*from persons
create table person1(id int unique,lastname varchar(25)not null);
insert into person1 values(1,'patil')
insert into person1 values(1,'patil')
create table person2(id int not null,lastname varchar(25)not null,age int check(age>=18));
insert into person2 values(1,'khote',19)
select*from person2
create table person21(id int not null,age int check (age  between 18 and 21))
insert into person21 values (1,20)
insert into person21 values (1,21)
select* from person21
create table person22(id int not null,age int check (age in(18,21,25)))
insert into person22 values(3,18)
insert into person22 values(3,21)
insert into person22 values(3,25)
insert into person22 values(4,21)

select* from person22

create table person3(id int not null,name nvarchar(20)check(name like'A%'))
insert  into person3 values(1,'Amit')
insert  into person3 values(1,'Amar')
select* from person3

create table person4(id int not null,age int,city varchar(25)default 'sadness')
insert into person4 values(1,20,'default')
select* from person4
insert into person4(id,age)values(20,35),(15,20),(5,26)


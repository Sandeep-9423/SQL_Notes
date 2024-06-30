create database queries
use queries
create table student(studentid int,sname char(30),age int,dept char(20),marks int,mailid char(20))
insert into student values(1001,'arun',21,'IT',45,'arun@gmail.com')
insert into student values(1002,'geetha',22,'CSE',90,'geetha@gmail.com')
insert into student values(1003,'ajay',25,'CSe',100,'ajay@gmail.com')
insert into student values(1004,'vamsi',22,'ECE',92,'vamsi@gmail.com')
insert into student values(1005,'gautam',23,'IT',81,'gautam@gmail.com')
insert into student values(1006,'rekha',21,'CSE',28,'rekha@gmail.com')

delete from student where studentid=1006 
delete from student where studentid=1005

select*from student
select*from student where dept='IT'
select*from student where marks>90
select*from student where marks between 45 and 90
select*from student where marks>=45 and marks<=90
select* from student where marks in(45,90)
select*from student where dept in ('CSE','aero','mech')
select*from student order by sname
select*from student order by sname desc

    #(max,min,sum,count,avg)

select max(marks) from student
select min(marks) from student
select sum(marks) from student
select count(marks) from student
select avg(marks) from student

    #(and or not)

select*from student where marks>=90 and dept='CSE'
select*from student where marks>=80 or dept='cse'
select*from student where not sname='Ajay'
select*from student where  dept like 'i%'
select*from student where  dept like '%e'
select*from student where  dept like '%s%'
select*from student where  dept like 'i%'
select*from student where  mailid like '_a%m'
select*from student where sname like '__k%a'
select*from student where sname like 'r%' or sname like 'a%'
select*from student where sname like '__u%' or sname like 'a%'

create table trader(traderid bigint identity(1,1) not null,datetimestamp datetime not null default(getdate()),data nvarchar(100) not null)
insert into trader(Data) values('abc'),('cde'),('fgh'),('ijk'),('lmn')
select*from trader

create table trader1(traderid bigint identity(1,5) not null,datetimestamp datetime not null default(getdate()),data nvarchar(100) not null)
insert into trader1(Data) values('abc'),('cde'),('fgh'),('ijk'),('lmn')
select*from trader1

select* from trader1

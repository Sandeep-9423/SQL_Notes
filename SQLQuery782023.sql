Create database sqlbatchsandeep
use sqlbatchsandeep
create table Emp (id int,salary money,name nvarchar(20))
insert into Emp values(1,20000,'Tanay')
insert into Emp values(2,25000,'Prafull')
insert into Emp values(3,28000,'Pankaj')
insert into Emp values(4,30000,'Akash')
insert into Emp values(5,32000,'Nishudhan')
Select* From Emp
delete from Emp Where id=1
Select* From Emp
update Emp set name='Harshada' Where id=2
Select* From Emp
update Emp set name='Priyanka' Where id=3
Select* From Emp
alter table EMP add columndays nvarchar(20)
alter table Emp  drop column Columndays
insert into Emp values(7,21000,'Tanay','Monday'),(6,22000,'Prafull','tuesday')
alter table Emp  drop column Columndays
alter table Emp  drop column Column_days
delete from Emp Where id=5
insert into Emp values(5,32000,'Nishudhan','wednesday')
update Emp set name='Hermaini' Where id=8
insert into Emp values(8,42000,'Hermaini','friday')
Select* From Emp
update Emp set name='prafulla' Where id=6
drop table Emp
insert into Emp values(1,20000,'Tanay')
insert into Emp values(2,25000,'Prafull')
insert into Emp values(3,28000,'Pankaj')
insert into Emp values(4,30000,'Akash')
insert into Emp values(5,32000,'Nishudhan')
select id as "eid",name as"ename",city as "address" from Emp
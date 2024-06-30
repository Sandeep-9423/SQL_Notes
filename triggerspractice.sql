create database triggerspractice
use triggerspractice
create table personalinfo(srnumber int ,Adharid int primary key,name nvarchar(20),address nvarchar(25),income money)
insert into personalinfo values(1,54256928,'Sandeep','apartment',65000)
insert into personalinfo values(2,77782515,'mayur','302 renukadevi',40000)
insert into personalinfo values(3,89726653,'roshan','field 542',9000)
insert into personalinfo values(4,459656928,'yogu','Room',51000)
select*from personalinfo

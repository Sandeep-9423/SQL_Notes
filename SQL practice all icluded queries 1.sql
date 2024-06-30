create database sample2
use sample2
create table customer
(
customerid int identity(1,1) primary key,
customernumber int not null unique check (customernumber>0),
lastname varchar(30) not null,
firstname varchar(30) not null,
areacode int default 71000,
address varchar(50),
country varchar(50) default 'Malaysia'
)

insert into customer values
(100,'Fang Ying','Sham','418999','sdadasfdfd',default),
(200,'Mei Mei','Tan',default,'adssdsadsd','Thailand'),
(300,'Albert','John',default,'dfdsfsdf',default)

select * from customer

select customerid, customernumber, lastname, firstname from customer

alter table customer
add phonenumber varchar(20)

update customer set phonenumber='1234545346' where customerid=1
update customer set phonenumber='45554654' where customerid=2

alter table customer
drop column phonenumber

select * from customer

delete
from customer
where country='Thailand'   --if not put ‘where’, will delete all record

drop table customer

alter table customer
alter column phonenumber varchar(10)
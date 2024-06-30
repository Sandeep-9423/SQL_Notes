create database practice
use practice
create table customers(customerid int primary key,customername nvarchar(20),contactname nvarchar(20),address1 varchar(255),city nvarchar(20),postalcode int,country nvarchar(20))
insert into customers values(1,'Alfred futterkiste','maria anders','obere str. 57','Berlin',12209,'germany')
insert into customers values(2,'ana trujillio helado','ana trujilo','Avda. de la constituction 2222','mexico D.F.',05021,'mexico')
insert into customers values(3,'Antonio taqueria','antonio moreno','mataderos 23122','mexico D.F',05023,'mexico')
insert into customers values(4,'Around the horn','thomas hardy','120 hanover sq.','london',11,'uk')
insert into customers values(5,'Berglunds snabbkop','christina berglund','Bergusvagen 8','lulea',95822,'sweden')
select*from customers

select customername,city from customers
select distinct country from customers
select country from customers
SELECT COUNT(DISTINCT Country) FROM Customers;
SELECT COUNT(Country) FROM Customers
select  distinct customername from customers
select  distinct city from customers

select*from customers where city='Mexico d.f'
select*from customers where country='germany'
select*from customers where postalcode=11




select*from customers where city like 'm%'
select*from customers where customername like 'b%' or customername like 'n%'
select*from customers where customername like '__f%' or customername like 'n%'
select*from customers where customername like '__o%n'
select*from customers where customername like 'a%' and contactname like 't%'
select*from customers where not customername='around the horn'
select*from customers where customername like '%o%'
select*from customers where customername like '%a%'



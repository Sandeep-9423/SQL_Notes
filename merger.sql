create database mergee
use mergee

create table  sourceproducts(productid int,productname nvarchar(20),price decimal(9,2))
insert into sourceproducts values(1,'Table',100),(2,'Desk',80),(3,'Chair',50),(4,'Computer',300)

create table targetproducts(productid int,productname nvarchar(20),price decimal(9,2))
insert into targetproducts values(1,'Table',100),(2,'Desk',180),(5,'Bed',50),(6,'Cupboard',300)

select*from sourceproducts
select*from targetproducts

merge targetproducts as target      ----------------merger
using sourceproducts as source
on source.productid = target.productid

when not matched by target then  ------for inserts
insert(productid,productname,price)
values(source.productid,source.productname,source.price)

when matched then update set ------update
target.productname = source.productname,
target.price= source.price

when not matched by source then delete;       -----deletes



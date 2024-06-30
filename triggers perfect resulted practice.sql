create  database dmlt
use dmlt
create table dbo.vegetables (id int primary key,name nvarchar(20),colour nvarchar(25),price money)
insert into vegetables values(1,'Apple','Red',95.67),(2,'Banana','Yellow',55.67);
insert into vegetables values(3,'mango','green',45.52)
insert into vegetables values(4,'Apricot','orange',110)
select*from vegetables

create trigger t1 on dbo.vegetables 
for insert as 
begin
select*from inserted
select*from dbo.vegetables end

insert into dbo.vegetables values(5,'kiwi','neon',45.4)
drop trigger t1

create trigger t2 on dbo.vegetables 
for delete as 
begin
select*from deleted
select*from dbo.vegetables end

delete from dbo.vegetables where id=3;
drop trigger t2


create trigger t3 on dbo.vegetables 
for update as 
begin
select*from inserted
select*from deleted
select*from dbo.vegetables end

update dbo.vegetables set name='Water' where id =2;
create  database dmltrigger
use dmltrigger
create table dbo.vegetables (id int primary key,name nvarchar(20),colour nvarchar(25),price money)
insert into vegetables values(1,'Apple','Red',95.67),(2,'Banana','Yellow',55.67);
select*from vegetables

create trigger t1 on dbo.vegetables 
for insert as 
begin
select*from inserted
select*from dbo.vegetables end

insert into dbo.vegetables values(3,'grapes','green',81.67)
drop trigger t1

create trigger t6 on dbo.vegetables
for delete as 
begin
select*from deleted
select*from dbo.vegetables
end

delete from dbo.vegetables where id=1;
 drop trigger t6

create trigger t3 on dbo.vegetables 
for update as
begin
select*from inserted
select*from deleted
select*from dbo.vegetables
end

update dbo.vegetables set name='Water' where id =2;

drop trigger t3
select from dbo.vegetables;

create trigger t5 on dbo.vegetables 
for insert as
begin
select*from inserted
select*from dbo.vegetables
end
insert into dbo.vegetables values(4,'musk','yellow',78.5)
drop trigger t5


create trigger t7 on dbo.vegetables 
for update as
begin
select*from deleted
select*from dbo.vegetables
end

drop trigger t6

update dbo.vegetables set name='melon' where id=4
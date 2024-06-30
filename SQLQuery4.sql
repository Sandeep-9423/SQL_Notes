create database groupby
use groupby
create table grow11(groupid int,groupname nvarchar(20),city varchar(255),salary bigint identity(20000,5000) not null,datetimestamp datetime not null default(getdate()))
insert into grow11 values(1,'ops','mum','default')
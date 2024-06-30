create database ddltrigger
use ddltrigger

create trigger trRestrictCreateTable
on  database for create_table
as
begin
print'YOU CANNOT CREATE A TABLE IN THIS DATATBASE'
rollback transaction
end

drop trigger trRestrictCreateTable on database

create table  Empll(Eid int,Ename nvarchar(20))

create trigger trRestrictAlterTable
on database
for ALTER_TABLE 
as
begin
print'YOU CANNOT ALTER A TABLES'
Rollback Transaction
end



alter table Empl add fees money 

drop trigger trRestrictAlterTable on database

Create trigger trRestrictdropTable
on Database
for DROP_TABLE
as
begin
print'YOU CANNOT DROP_TABLES'
ROLLBACK TRANSACTION
END

drop trigger trRestrictdropTable on database

drop table empll

create procedure Nissi 
as
select*from Empl
where Empl_id>101


exec nissi



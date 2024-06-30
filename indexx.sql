create database indexx
use indexx
create table Employee(empid int,ename varchar(200))
insert into Employee values(1,'priti'),(2,'leena')
insert into Employee values(3,'sakshi')
select*from Employee
create clustered index ix_employeeeid on employee (empid);
create nonclustered  index idx_Employeee_managerid on Employee(ename);
select*from sys.indexes where name='ix_employeeeid';
select*from sys.indexes where name='idx_Employeee_managerid'
alter  index ix_employeeeid on dbo.Employee disable
alter  index ix_employeeeid on dbo.Employee rebuild
sp_rename 'dbo.employee.iX_employeeeid','Ix_emp','index'
select*from sys.indexes where name='Ix_emp'

drop index  Ix_empl on employee
create database SaleOrder
use SaleOrder

create table dbo.customer (
CustomerID int NOT null primary key,
CustomerFirstName varchar(50) NOT null,
CustomerLastName varchar(50) NOT null,
CustomerAddress varchar(50) NOT null,
CustomerSuburb varchar(50) null,
CustomerCity varchar(50) NOT null,
CustomerPostCode char(4) null,
CustomerPhoneNumber char(12) null,
);

create table dbo.inventory (
InventoryID tinyint NOT null primary key,
InventoryName varchar(50) NOT null,
InventoryDescription varchar(255) null,
);

create table dbo.employee (
EmployeeID tinyint NOT null primary key,
EmployeeFirstName varchar(50) NOT null,
EmployeeLastName varchar(50) NOT null,
EmployeeExtension char(4) null,
);

create table dbo.sale (
SaleID tinyint not null primary key,
CustomerID int not null references customer(CustomerID),
InventoryID tinyint not null references Inventory(InventoryID),
EmployeeID tinyint not null references Employee(EmployeeID),
SaleDate date not null,
SaleQuantity int not null,
SaleUnitPrice smallmoney not null
);

select * from information_schema.tables    --##-Check what table inside

--top: show only the first two
select top 2 * from customer

--top 40 percent: also means show the first two
select top 40 percent * from customer

--sort result (by default is ascending)
select customerfirstname, customerlastname from customer
order by customerlastname desc

select customerfirstname, customerlastname from customer
order by 4, 2, 3 desc -- Order By Based on column no. without typing column name
--distinct: only show unique value

select distinct customerlastname from customer
order by customerlastname

--into file_name: save result in another table (BASE TABLE)
select distinct customerlastname into temp
from customer
order by customerlastname

select * from temp --see the table (data type will remain)

-- (underscore sign) _ is only specific for one character only
-- (percent sign) % represents zero, one, or multiple characters
select * from customer
where customerlastname like '_r%'

-- search multiple items
select * from customer
where customerlastname in ('Brown', ‘Michael’, ’Jim’)

select * from customer
where customerlastname > 'Brown' or customerlastname>'Cross'

select * from customer
where customerlastname <> 'Brown'

-- check null values
select * from customer
where customerlastname IS NULL

select * from customer
where customerlastname IS NOT NULL

select * from sale
where saleunitprice between 5 and 10 --not include 5 & 10

-- returns the number of rows in a table
-- AS means aliasing, temporary giving name to a column/ table
select count(*) as [Number of Records] from customer
where customerfirstname like 'B%'

select sale.employeeid ,EmployeeFirstName, EmployeeLastName , count(*) as [Number of order] ,
sum(salequantity) as [Total Quantity]
from sale,employee
where sale.employeeid = employee.employeeid
group by sale.employeeid ,EmployeeFirstName, EmployeeLastName

select month(saledate) as [Month], count ( * ) as [Number of sale],
sum(salequantity*saleunitprice) as [Total Amount]
from sale
group by month(saledate)

SELECT MAX(Salary)    --maximum calculation
FROM EmployeeSalary

SELECT MIN(Salary)   --mininmum calculation
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics ED
JOIN EmployeeSalary ES
ON ED.EmployeeID = ES.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1
SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics ED
JOIN EmployeeSalary ES
ON ED.EmployeeID = ES.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

-- CAST(expression AS datatype(length))
SELECT CAST('2017-08-25 00:00:00.000' AS date)

-- CONVERT(data_type(length), expression, style)
SELECT CONVERT(date,'2017-08-25 00:00:00.000')

SELECT FirstName, LastName, Age,
CASE
WHEN Age > 30 THEN 'Old'
WHEN Age BETWEEN 27 AND 30 THEN 'Young'
ELSE 'Baby'
END
FROM EmployeeDemographics ED
WHERE Age IS NOT NULL
ORDER BY Age


--
SELECT FirstName, LastName, JobTitle, Salary,
CASE
WHEN JobTitle = 'Salesman' THEN Salary + (Salary *.10)
WHEN JobTitle = 'Accountant' THEN Salary + (Salary *.05)
WHEN JobTitle = 'HR' THEN Salary + (Salary *.000001)
ELSE Salary + (Salary *.03)
END AS SalaryAfterRaise
FROM EmployeeDemographics ED
JOIN EmployeeSalary ES
ON ED.EmployeeID = ES.EmployeeID


SELECT FirstName, LastName, Gender, Salary,    --- Partition By returns a single value for each row
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics ED
JOIN EmployeeSalary ES
ON ED.EmployeeID = ES.EmployeeID


-- Remove space
Select EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) as IDRTRIM
FROM EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) as IDLTRIM
FROM EmployeeErrors

-- Replace
Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors

-- Substring
Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


-- UPPER and LOWER CASE
Select firstname, LOWER(firstname)
from EmployeeErrors
Select Firstname, UPPER(FirstName)
from EmployeeErrors"



--JOINS

select * from inventory,sale
where sale.inventoryid=inventory.inventoryid

select inventoryname,saledate,saleunitprice,salequantity,salequantity*saleunitprice as [Total amount]
from sale,inventory
where sale.inventoryid=inventory.inventoryid
group by sale.inventoryid,inventoryname,saledate,salequantity,saleunitprice
order by inventoryname

--inner join
select * from inventory
inner join sale
on sale.inventoryid=inventory.inventoryid

select inventoryname,saledate,saleunitprice,salequantity,saleunitprice*salequantity as [Total Amount]
from inventory inner join sale
on sale.inventoryid=inventory.inventoryid
order by inventoryname

--full outer join (shows everything)
select sale.inventoryid,inventoryname
from inventory
full outer join sale on
sale.inventoryid=inventory.inventoryid
where sale.inventoryid is NULL

--left join (might have NULL value, since some inventory might not have sales)
select inventory.inventoryid,inventoryname
from inventory left join sale on
sale.inventoryid=inventory.inventoryid

--left join
select inventory.inventoryid,inventoryname
from inventory left join sale on
sale.inventoryid=inventory.inventoryid where sale.inventoryid is NULL

-- without join: use subquery
select inventoryid,inventoryname from inventory
where inventoryid not in (select inventoryid from sale)

--right join
select sale.inventoryid,inventoryname
from inventory right join sale on
sale.inventoryid=inventory.inventoryid


select E.employeeID, E.employeefirstname+' '+E.employeelastname as
[Full Name], E.managerID, , M.employeefirstname+' '+M.employeelastname as [Manager Name]
from staff E
inner join staff M
on E.managerID = M.employeeID

--left outer join (list all the employees)
select E.employeeID, E.employeefirstname+' '+E.employeelastname as [F Name], E.managerID, , M.employeefirstname+' '+M.employeelastname as [Manager Name]
from staff E
left outer join staff M
on E.managerID = M.employeeID

select * from inventory1                           --Cross Join     --generate all combination of records (all possibility)
(Cartesian Product)
cross join inventory2                 



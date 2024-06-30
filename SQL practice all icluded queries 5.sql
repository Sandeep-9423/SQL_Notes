---Table & View

--1. view table
--(view will be updated when update base)
--view is a result set of SQL statements, exists only for a single query

create view CustomerView as
select customerfirstname+' '+customerlastname as [Customer Name] , customerphonenumber,
inventoryname,saledate,salequantity,saleunitprice,salequantity*saleunitprice as [Total Amount]
from customer inner join sale on customer.customerid=sale.customerid inner join inventory
on sale.inventoryid=inventory.inventoryid

--2. Temp table
--(temp will NOT be updated when update base)
--a single hashtag (#) sign must be added in front of their names
--used to store data temporarily, physically created in the Tempdb database
--can perform CRUD, join, and some other operations like the persistent database tables

DROP TABLE IF EXISTS #temp_Employee
Create table #temp_Employee (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

Insert INTO #temp_Employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

SELECT * FROM #temp_Employee


--CTE (Common Table Expression)
--create temporary result set which is used to manipulate the complex sub-queries data
--created in memory rather than Tempdb database, so cannot create any index on CTE.

WITH CTE_Employee AS
(
SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics ED
JOIN EmployeeSalary ES
ON ED.EmployeeID = ES.EmployeeID
WHERE Salary > '45000'
)

SELECT FirstName, LastName, Gender, TotalGender
FROM CTE_Employee
WHERE TotalGender = (SELECT MIN(TotalGender) FROM CTE_Employee)

--4. Duplicate Table
select customerfirstname+' '+customerlastname as [Customer Name] , customerphonenumber,
inventoryname,saledate,salequantity,saleunitprice,salequantity*saleunitprice as [Total Amount] into customerRec
from customer inner join sale on customer.customerid=sale.customerid inner join inventory
on sale.inventoryid=inventory.inventoryid
order by customerfirstname +' '+ customerlastname,inventoryname



-- SQL RANKS


--1. ROW_NUMBER()

--get a unique sequential number for each row
--get different ranks for the row having similar values
SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary

--2. RANK()

--specify rank for each row in the result set
--use PARTITION BY to performs calculation on each group
--each subset get rank as per Salary in descending order
USING PARTITION BY
SELECT *, RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY JobTitle, SalaryRank

--NOT USING PARTITION BY
-- get SAME ranks for the row having similar values
SELECT *,
RANK() OVER(ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY SalaryRank

--3. DENSE_RANK()

-- if have duplicate values, SQL assigns different ranks to those rows.
-- will get the same rank for duplicate or similar values
SELECT *,
DENSE_RANK() OVER(ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY SalaryRank

-----------------3.1 RANK()
SELECT *,
RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY JobTitle, SalaryRank   -- skip a rank if have similar values

----------------3.2 DENSE_RANK()
SELECT *,
DENSE_RANK() OVER(PARTITION BY JobTitle ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY JobTitle, SalaryRank   -- maintains the rank and does not give any gap for the values



--4. NTILE()
-- can specify required how many group of result, and it will rank accordingly
SELECT *,
NTILE(3) OVER(ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY SalaryRank;

--USING PARTITION BY
SELECT *,
NTILE(3) OVER(PARTITION BY JobTitle ORDER BY Salary DESC) SalaryRank
FROM EmployeeSalary
ORDER BY JobTitle, SalaryRank;


--5. Remove duplicate records
WITH RowNumCTE AS(
Select *,
ROW_NUMBER() OVER (
PARTITION BY ParcelID,
PropertyAddress,
SalePrice,
SaleDate,
LegalReference
ORDER BY UniqueID) as row_num
From NashvilleHousing
order by ParcelID
)


--DELETE
Select * From RowNumCTE
Where row_num > 1
Order by PropertyAddress

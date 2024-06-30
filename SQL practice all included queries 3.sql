CREATE PROCEDURE Temp_Employee @JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
ON emp.EmployeeID = sal.EmployeeID where JobTitle = @JobTitle --- make sure to change this in this script from original above
group by JobTitle

Select *
From #temp_employee
GO;

--- only need to run this on next time 
EXEC Temp_Employee @JobTitle = 'Salesman'

-- Subquery in Select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary

-- with Partition By
SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary

-- Subquery in From
SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER () AS AllAvgSalary
FROM EmployeeSalary) a
ORDER BY a.EmployeeID

-- Subquery in Where
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE EmployeeID in (SELECT EmployeeID FROM EmployeeDemographics
WHERE Age > 30)

SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
WHERE Salary in (SELECT Max(Salary) FROM EmployeeSalary)




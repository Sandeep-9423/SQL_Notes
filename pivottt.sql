create  database pivott
use pivott
create table courseSaless(course varchar(50),years int,Earning money)
INSERT INTO CourseSales VALUES('.NET',2012,10000)
INSERT INTO CourseSales VALUES('Java',2012,20000)
INSERT INTO CourseSales VALUES('.NET',2012,5000)
INSERT INTO CourseSales VALUES('.NET',2013,48000)
INSERT INTO CourseSales VALUES('Java',2013,30000)

SELECT*FROM courseSales

SELECT*FROM courseSales PIVOT(SUM(EARNING) FOR COURSE IN([.NET],JAVA)) AS PVTTable
SELECT*FROM courseSales PIVOT(SUM(EARNING) FOR YEARS IN([2012],[2013]))AS PVTTable
select* into coursesalespivotresults from coursesales 
select* into coursesalespivotresult from courseSales pivot(sum(Earning)for course in([.net],java))as pvttable
select*from coursesalespivotresult
select course,years,earning from coursesalespivotresult unpivot(Earning for course in ([.NET],java)) as UNPVTTable

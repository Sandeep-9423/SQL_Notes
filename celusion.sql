use celusion;

select * FROM dbo.celusion;
select*from EmployeePosition

select UPPER (Empfname) as Empname
from celusion

select count(Department) from celusion where Department='HR'
select getdate();
select left(0,5) EmpLname from celusion where EmpLname like

SELECT LEFT(Emplname,4) AS Empname
FROM celusion;
SELECT RIGHT(Addresss,5) AS addresss
FROM celusion     --(--only last right side charcters are seen upto 5 or according to number mentioned in Bracket)
select* into newduplicatecelusion from celusion
select*from newduplicatecelusion



---SELECT SUBSTRING(addresss,5,length(Addresss)-7) FROM celusion;

---SELECT substring_index(addresss,'(', 1) as place_name
--FROM celusion
---select addresss,replace(addresss, '(', '')+replace(addresss, ')','') as 

---CREATE TABLE celusion_copy like celusion;
----

select*from EmployeePosition where salary  between (500000  1000000

select Emplo from 


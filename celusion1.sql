SELECT TOP (1000) [Empid]
      ,[Empfname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Addresss]
      ,[DOB]
      ,[Gender]
  FROM [celusion].[dbo].[celusion]

  select * into celusion1 from newduplicatecelusion

  select*from celusion1

  select trim('( )' from addresss) from celusion1

  UPDATE celusion
SET Addresss = left(addresss, LEN(addresss) - 5)

select*from celusion

   select trim(trailing '(' from addresss) from celusion

SELECT TRIM('  addresss  ' ) AS 'TRIM(5) function';
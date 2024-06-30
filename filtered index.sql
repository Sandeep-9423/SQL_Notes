SELECT TOP (1000) [studentid]
      ,[sname]
      ,[age]
      ,[dept]
      ,[marks]
      ,[mailid]
  FROM [queries].[dbo].[student]

  select*from student

  create nonclustered index NCI_department on  dbo.student(studentid)
  where dept='CSE'

  select he.studentid,he.age,he.sname,he.dept
  from dbo.student he
  where he.dept='CSE'


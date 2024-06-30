use queries
select*from dbo.student


create function fx_sandeep(@dept nvarchar(20))returns table as return(select* from [dbo].[student]where dept=@dept)

select*from fx_sandeep('IT')
select*from fx_sandeep('CSE')
select*from dbo.student

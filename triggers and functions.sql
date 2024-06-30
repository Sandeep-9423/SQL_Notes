create database triggerss
use triggerss ---sacalr functions is returning single value when we call
create function dbo.monthlysal(@payrate float) returns float as begin return (@payrate*8*30)end
declare @payrate float set @payrate=dbo.monthlysal(12.25) print @payrate

create function dbo.monthlysall(@payrate float) returns float as begin return (@payrate*10*30)end
declare @payrate float set @payrate=dbo.monthlysall(914) print @payrate

create function dbo.yearsal(@payrate  float)returns float as begin return (@payrate*10*30*12)end
declare @payrate float set @payrate=dbo.yearsal(27.8) print @payrate
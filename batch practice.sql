create database batchpractice
use batchpractice

create table example
(id int identity(1,1),
 code int not null,
  startdate date not null,
  enddate date null,
  CONSTRAINT [PK_example] PRIMARY KEY CLUSTERED 
  (
    [id] ASC
  ),
  constraint uc_combination UNIQUE(code,startdate,enddate)
)on [primary]


select*from example


Create table errorlog
(errorid int identity (1,1),
  Errordate datetime,
  ErrorMessage Nvarchar(255)) on [primary]

  select *from errorlog


DECLARE @DUPDATE AS DATETIME

SELECT @DUPDATE = GETDATE()    

BEGIN TRY
    INSERT INTO Example(code, startdate, enddate)
    VALUES (1, @DUPDATE, @DUPDATE)

    -- Second insert should violate the constraint...
    INSERT INTO Example(code, startdate, enddate)
    VALUES (1, @DUPDATE, @DUPDATE)
END TRY
BEGIN CATCH
    -- Execute the error retrieval routine.
    INSERT INTO ERRORLOG(ErrorDate, ErrorMessage)
    VALUES (GETDATE(), ERROR_MESSAGE())
END CATCH;
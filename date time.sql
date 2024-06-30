create  table calender(today_date date)

alter table calender  add borndate datetime
select getdate()

insert into calender(today_date) values('2005-05-15 09:21:10.008')
select *from calender

insert into calender values('2004-10-28 09:21:58.025','29-12-1996 06:30:4')


insert into calender(borndate)
       values (convert(datetime,'18-06-12 10:34:09 PM',4));

	   
insert into calender(borndate)
       values (convert(datetime,'18-06-12 10:34:09 PM',3));

set dateformat dmy
insert into calender(borndate)
       values (convert(datetime,'18-06-12 10:34:09 PM','german'));


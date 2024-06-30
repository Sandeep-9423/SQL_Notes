--1. Union
--allow you to combine two tables together (but the no. of columns & each column’s data types for 2 tables must be match)
--don't need common key, only need common attributes
--merge, not showing duplicate record

select cust_lname,cust_fname from customer
union
select cust_lname,cust_fname from customer_2

--2. Union all
--merge, but show you everything, even the duplicate record

select cust_lname,cust_fname from customer
union all
select cust_lname,cust_fname from customer_2

--3. Intersect
--keep only the rows in common to both query
--not showing duplicate record

select cust_lname,cust_fname from customer
intersect
select cust_lname,cust_fname from customer_2

---or

select c.cust_lname,c.cust_fname from customer c,customer_2 c2
where c.cust_lname=c2.cust_lname and c.cust_fname=c2.cust_fname

--4. Except
--generate only the records that are unique to the CUSTOMER table

select cust_lname,cust_fname from customer
except
select cust_lname,cust_fname from customer_2

--use subquery
select cust_lname,cust_fname from customer
where(cust_lname) not in
(select cust_lname from customer_2) and
(cust_fname) not in
(select cust_fname from customer_2)

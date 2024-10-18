
-- 2) List the users who are currently logged in to the website along with their login time / date.

# here list the users who had not log out 

select * from session;
select * from customers;

select * from session 
where log_out is null;

select c.username ,s.log_in , s.device from session s
inner join customers c 
on s.cid = c.cid
where log_out is null;


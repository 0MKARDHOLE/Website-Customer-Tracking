
-- 5)  Whichcustomer was online the longest?

# here we have to show who was login longest time than others 

select * from customers;
select * from session;
select * from session_history;

select max(total_session_time) from session_history;

select s.session_id, c.username, s.log_in, s.log_out, sh.total_session_time from customers c
inner join session s
on c.cid = s.cid
inner join session_history sh
on s.session_id = sh.session_id
where sh.total_session_time = 
(
	select  max(total_session_time) from session_history 
);




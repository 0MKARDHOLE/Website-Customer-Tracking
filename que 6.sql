
-- 6)  What is the average time that customer spends on the site?

# here we have to show the average time the users spends on the internet 

select * from customers;
select * from session;
select * from session_history;

select (avg(total_session_time )) from session_history;

select sec_to_time(avg(timestampdiff(second,log_in, log_out))) as avg_time from session 
where log_out is not null;


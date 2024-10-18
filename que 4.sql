
--  4) List the session history for a particular customer, the details should also contain the
--  total time spent in a single session when browsing the website

# here if the user has log out than show the history i.e =  id, name & how much time he had spend 

select * from  session;
select * from  customers;
select * from  session_history;

-- drop trigger check_history;
delimiter $

create trigger check_history
after update on session
for each row 
begin 

	if new.log_out is not null then 
    insert into session_history(cid,session_id,total_session_time) values			-- afte the user has log out than it will insert its values into 
    (new.cid, new.session_id, timediff(new.log_out,old.log_in));					-- into session_history table
    
    delete from active_session
    where cid = new.cid						-- it will also delele it from active session table
    and session_id = new.session_id;
    
    end if;

end $

delimiter ;

select timediff(log_out,log_in)
from session;

 insert into session(cid,log_in,log_out,device) values
 (2,now(),null,"Tablet"),
 (3,now(),null,"Laptop");
 
select * from session;
select * from session_history;
select * from active_session;

update session 
set log_out = "2024-10-02 14:45:10"
where session_id = 5;

update session 
set log_out = "2024-10-02 15:04:11"
where session_id = 6;





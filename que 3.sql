
-- 3)  LOGOFF: A stored procedure that logs off a user. The relevant changes should be made.

# here make a procedure where if the user log out it will update = sesssion , session_history, active_session table 
# session table = insert log out 
# session_history = show the total amount he was log in
# active_session = remove the user from active sesssion

-- drop procedure logoff_user;
delimiter $

create procedure logoff_user
(
in give_name varchar(30), 					-- username
in give_password varchar(30), 				-- password(optional) 
in give_device varchar(30)					-- device name
)
begin 
	
        declare s_cid int;			
      
        select cid into s_cid from customers
        where username = give_name;
	
		if s_cid is null then 
        signal sqlstate '45000'
        set message_text = "Customer does not exits";
        
        else 
        update session 
        set log_out = now()			-- here it will give the log out timing 
        where cid = s_cid
        and log_out is null;
        
        delete from active_session			-- also remove the user from active session
        where cid= s_cid;
        
        if row_count() = 0 then 			-- it will check if the user had already logout or not 
        signal sqlstate '45000'
        set message_text = "You have already logout";
        
        end if;
        end if;
  
end $
 
delimiter ;
 
select * from session;
select * from customers;
select * from active_session;

call logoff_user("Omkar Dhole","Omkar123","Laptop");
call logoff_user("Bhushan Patil","Bhusan123","Phone");
 
select * from active_session;
select * from session;

 
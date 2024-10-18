
-- 1) LOGIN: Whenever a customer enters proper credentials, he should be logged in. 
-- Also check if the person is already logged in as well.

# here the user will provide username , password , device name than he will be logged in 
# and also check if the user is already login or not 


use project7;
select * from customers;
select * from session;
-- drop procedure checkiflogin;

 delimiter $
 create procedure logincustomer
 (
 in give_name varchar(30), 					-- username
 in give_password varchar(30), 				-- password 
 -- in give_email varchar(30), 				-- email (optinal)
 in give_device varchar(30)					-- device name
 )
 begin 
		
        declare v_cust_id int;				-- user id
        declare v_username varchar(30);		-- users name
        declare v_password varchar(30);		-- password
        -- declare v_email varchar(30);
        declare active_session varchar(30);		-- check who are active 
		
        select cid,username, password into v_cust_id,v_username, v_password from customers
        where username = give_name;
        
        if v_cust_id is null then
        signal sqlstate '45000'
        set message_text = "Invalid ID";
        
        elseif v_username != give_name then 
        signal sqlstate '45000'
        set message_text = "invalid username";
        
        elseif v_password != give_password then 
        signal sqlstate '45000'
        set message_text = "invalid password";
        
      /*  elseif v_email != give_email then 		-- optional
        signal sqlstate '45000'
        set message_text = "invalid email";   */
        
        end if;
        
        -- now checking if the user is already login or not --
        
        select count(*) into active_session
        from session 
        where cid = v_cust_id
        and log_out is null;			-- here log_out is null because customer is logging 
        
        if active_session >= 1 then
        signal sqlstate '45000'
        set message_text = "Already login";
        
        else
        insert into session (cid, log_in,log_out, device) values
        (v_cust_id,now(),null,give_device);
        
        end if;
  
 end $
 
 delimiter ;
 
 select * from customers;
 select * from session;
 select * from active_session;
 
call logincustomer('Omkar Dhole','Omkar123','Laptop');
call logincustomer('Ronit Patil','ronit12','Laptop');		-- it will give invalid password msd 
call logincustomer('Bhushan Patil','Bhusan123','Phone');
call logincustomer('Bhushan Patil','Bhusan123','Phone');		-- it will give already login 

 
 select * from session;
 select * from customers;
 select * from active_session;

insert into session (cid,log_in,log_out,device) values
(2,"2024-09-30 14:52:45"," 2024-09-30 15:02:33","Tablet"),
(4,"2024-09-30 22:30:45"," 2024-09-30 23:12:07","Computer");

select * from session;



--  7) Create a TRIGGER that ensures that a customer cannot be logged in on more than 2 devices.

select * from customers;
select * from session;
select * from session_history;
select * from active_session;
 
# solution 1:

 -- drop trigger checkifalreadylogin;
delimiter $
create trigger checkifalreadylogin
before insert on session
for each row 
begin 
	

    declare active_device int;

    select count(*) into active_device from active_session
	where cid = new.cid;
    
    if active_device >=2 then
    signal sqlstate '45000'
    set message_text = "You had already login in 2 devices";


    end if;

end $

delimiter ;
 
 insert into session(cid,log_in,log_out,device) values
(4,now(),null,"Tablet");

select * from session;
select * from session_history;
select * from active_session;
-------------------------------------------------------------------------------------------

 /*
 Can't update table 'session' in stored function/trigger because it is already used by statement which 
 invoked this stored function/trigger.	0.000 sec
 */
 
---------------------------------------------------------------------------------------------
# Doing it with procedures 

# Solution 2: 

-- drop trigger checkifalreadylogin;
delimiter $
create trigger checkifalreadylogin
before insert on active_session
for each row 
begin 
	

    declare active_device int;

    select count(*) into active_device from active_session
	where cid = new.cid;
    
    if active_device >=2 then
    signal sqlstate '45000'
    set message_text = "You had already login in 2 devices";
    
    else insert into session(cid,log_in,log_out,device)values
    (new.cid,now(),null,new.active_device);

    end if;

end $

delimiter ;


select * from session;
select * from session_history;
select * from active_session;


insert into session(cid,log_in,log_out,device) values
(4,now(),null,"Computer");

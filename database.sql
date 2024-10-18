-- Website Customer Tracker
-- Completed By Omkar Ganesh Dhole

-- drop database project7;
create database project7;
use project7;
show tables;
drop table customers;
drop table session;
drop table session_history;

create table customers			-- to store the customers details
(
	cid int primary key auto_increment,
    username varchar(30) not null,
    password varchar(30) not null,
    email varchar(30) not null,
    date_joined datetime default current_timestamp
    
);

insert into customers(username,password,email) values
("Omkar Dhole","Omkar123","omkard@gmail.com"),
("Ronit Patil","Ronit123","ronitp@gmail.com"),
("Bhushan Patil","Bhusan123","bhushanp@gmail.com"),
("Arsalan","Arsalan123","arsalan@gmail.com");


create table session				-- to store the log_in & log_out details
(
	session_id int  primary key auto_increment,
    cid int,
    log_in datetime default current_timestamp,
    log_out datetime,
    device varchar(30),
    foreign key(cid) references customers(cid)
);

select * from session;
select now();

create table session_history					-- to store the history of the customers
(
	history_id int primary key auto_increment,
    cid int,
    session_id int,
    total_session_time time,
    foreign key(cid) references customers(cid),
    foreign key(session_id) references session(session_id)
    
);


create table active_session					-- to see who are currently active i.e log in 
(
	as_no int primary key auto_increment,
    session_id int,
    cid int,
    log_in_time datetime default current_timestamp ,
    active_device varchar(20),
    foreign key(session_id) references session(session_id),
    foreign key(cid) references customers(cid)
);

delimiter $
create trigger enter_active_session					-- whenever the user log in it stores the data 
after insert on session
for each row 
begin 

		if new.log_out is null then 
        insert into active_session(session_id,cid,log_in_time,active_device) values
        (new.session_id, new.cid, now(),new.device);
        
        end if;
end $
delimiter ;

-- drop trigger enter_active_session;
---------------------------------------------------------------------------------------------

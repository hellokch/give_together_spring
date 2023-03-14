drop table userperson;
create table userperson(
id varchar(20) primary key,
kinds varchar(1),
pass varchar(20),
tel varchar(20),
name varchar(30),
email varchar(20),
location varchar(200),
location1 varchar(200),
nickname varchar(50),
gender number
);

drop table usergroup;
create table usergroup(
id varchar(20) primary key,
kinds varchar(1),
pass varchar(20),
tel varchar(20),
name varchar(30),
email varchar(50),
location varchar(200),
location1 varchar(200),
p_name varchar(20),
intro varchar(1000),
picture varchar(500)
);


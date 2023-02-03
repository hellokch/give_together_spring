drop communityboard
create table communityboard(
index_num number primary key,
id varchar(20),
title varchar(30),
context varchar(4000),
name varchar(30),
content varchar(50),
not_date date,
is_notice varchar(10),
picture varchar(200),
boardid varchar(1),
File1 varchar(50)
);
--file commit--

create sequence communityboardseq;
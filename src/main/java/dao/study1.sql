-- 커뮤니티 게시판 테스트 sql
create table board(
  num int primary key,
  name varchar(30),
  pass varchar(20),
  subject varchar(100),
   content varchar(4000),
  file1 varchar(100),
  regdate date,
 readcnt number(10),
 ref int,
 reflevel number(3),
 refstep number(5),
  boardid varchar(1)
 ); 
 
 create sequence boardseq;
drop table RENTDB;
drop table BOOKDB;
drop table MEMBERDB;


create table rentDB
    (rent_id varChar2(20) primary key,
    book_number varchar2(20) not null,
    member_id  varchar2(30) not null,
    rent_date date not null,
    return_date date not null);

create table bookDB (
book_number varchar2(20) not null,
book_name varchar2(20) not null,
book_count number(10));

create table memberDB(
member_number varchar2(20) not null primary key,
member_id varchar(20) not null,
member_name varchar(20) not null,
blacklist_member varchar(20));

alter table memberdb drop column blacklist_member;
alter table memberdb add member_pw varchar2(20) not null;

create table blacklistdb(
blacklist_member varchar(30) primary key);

create sequence seq1
increment by 1
start with 1
minvalue 1
maxvalue 30
nocycle
nocache;

alter table memberdb add column member_id ;

insert into memberdb;


alter table memberdb add member_id varchar2(20);

create sequence member_number
    increment by 1 -- 증가치 : 1
    start with 1 -- 초기값 : 100
    minvalue 1 -- 최소값 : 99
    nomaxvalue  -- 최대값 : 110
    nocycle -- 최대값 도달시 시작값부터 재시작할지 여부 : Yes
    nocache;







commit;
-- 쪽지 테이블


select msgcon.no no ,msg.receiver receiver,msg.sender sender ,msg.sendtime sendtime ,msg.readtime readtime ,msgcon.title title, msgcon.text text  from message msg  inner join messageContext msgcon 
on msg.no=msgcon.no;


select * from (select message.no d from message msg  inner join messageContext msgcon 
on msg.no=msgcon.no) where receiver='test1';




drop table messageContext;

drop table message;

alter table messageContext modify(msgCon_title varchar2(90));
select * from messageContext;

-- 회원 테이블
create table member(
    mem_id varchar2(20) primary key,
    mem_pw varchar2(30) not null,
    mem_name varchar2(21) not null,
    mem_nick varchar2(30) not null unique,
    mem_grade varchar2(18) default'일반회원' check(mem_grade in('일반회원','총관리자','소모임관리자','마켓관리자','커뮤니티관리자')),
    mem_birth date not null,
    mem_phone char(13),
    mem_gender varchar2(6) not null,
    mem_report number default 0 check(mem_report>=0),
    mem_join date default sysdate,
    mem_pw_q varchar2(40) not null,
    mem_pw_a varchar2(30) not null
);
select * from member;
insert into member values('test1' , 'testpw1','테스트1' , '테스트1', '일반회원',sysdate,'010-1111-0001','남성',0,sysdate,'질문','질문');
insert into member values('test2' , 'testpw2','테스트2' , '테스트2' , '일반회원',sysdate,'010-1111-0002','여성',0,sysdate,'질문','질문');
insert into member values('test3' , 'testpw3','테스트3' , '테스트3' , '일반회원',sysdate,'010-1111-0003','여성',0,sysdate,'질문','질문');
insert into member values('test4' , 'testpw4','테스트4' , '테스트4', '일반회원',sysdate,'010-1111-0004','남성',0,sysdate,'질문','질문');
insert into member values('test5' , 'testpw5','테스트5' , '테스트5' , '일반회원',sysdate,'010-1111-0005','여성',0,sysdate,'질문','질문');
insert into member values('test6' , 'testpw6','테스트6' , '테스트6' , '일반회원',sysdate,'010-1111-0006','여성',0,sysdate,'질문','질문');
create table exercisecategory(
excate_name varchar2(20) primary key
);

create table fitgroup(
 fg_no number primary key,
 fg_id varchar2(20) references member(mem_id) on delete cascade not null,
 excate_name varchar2(20) references exercisecategory(excate_name) on delete cascade not null,
 fg_title varchar2(60) not null,
 fg_intro varchar2(4000) not null,
 fg_starttime date not null,
 fg_endtime date not null,
 fg_location varchar2(51)  not null,
 fg_onlyfemale varchar2(6) not null
);

create table fitgroupimage(
fg_image_no number primary key,
fg_no number references fitgroup(fg_no) on delete cascade not null,
fg_image_upload varchar2(256),
fg_image_save varchar2(256),
fg_image_size number,
fg_image_type varchar2(256)
);

create table mysmallgroup(
fg_join_no number primary key,
sg_no number references fitgroup(fg_no) on delete cascade not null,
m_id varchar2(20) references member(mem_id) on delete cascade not null
);

create table rating(
rating_no number primary key,
sender_id varchar2(20) references member(mem_id) on delete cascade not null,
fg_no number references fitgroup(fg_no) on delete cascade not null,
rating_score number not null
);
create table member_profile(
    mp_no number primary key,
    mp_id varchar2(20) references member(mem_id) on delete set null,
    mp_upload varchar2(256) not null,
    mp_save varchar2(256) not null unique,
    mp_size number,
    mp_type varchar2(256)
);
create table notification(
ntc_no number primary key,
ntc_id varchar2(20) REFERENCES member(mem_id) on delete set null not null,
ntc_msg varchar2(500),
ntc_date date default sysdate,
ntc_read varchar2(9) default '안읽음' not null check (ntc_read in('읽음','안읽음'))
);
create table friend(
    friend_no number primary key,
    friend_id varchar2(20)references member(mem_nick) on delete set null not null,
    friend_nick varchar2(30) references member(mem_id) on delete set null not null,
    friend_date date default sysdate
    );
    create table friendrequest(
friend_request_no number primary key,
friend_id varchar2(20) references member(mem_id) on delete set null not null,
m_id varchar2(20) references member(mem_id) on delete set null not null,
ntc_no number references notification(ntc_no),
friend_request_type varchar2(30),
friend_request_msg varchar2(60),
friend_request_date date default sysdate
);
create table fitgroupfilter(
filter_no number primary key,
mem_id  varchar2(20) references member(mem_id),
filter_range number,
filter_onlyfemale varchar2(1)
);
create table admin_memo(
memo_no number primary key,
mem_id REFERENCES member(mem_id) on delete set null,
memo_content varchar2(1500) not null,
memo_time date default sysdate not null
);
create table large_type(
    large_name varchar2(12) primary key check(large_name in('커뮤니티', '마켓', '기록', '공지사항'))
);

create table middle_type(
    middle_name varchar2(12) primary key check(middle_name in('판매', '구매', '전체', '추천글', '운동인증', '코디', '질문', '유머', '일자별', '소모임', '식단', '공지', '이벤트')),
    large_name varchar2(12) references large_type(large_name) on delete set null
);
create table board(
    board_no number primary key,
    board_large_name varchar2(12) references large_type(large_name) on delete set null not null,
    board_middle_name varchar2(12) references middle_type(middle_name) on delete set null not null,
    board_writer varchar2(20) references member(mem_id) on delete set null not null,
    board_title varchar2(30) not null,
    board_post varchar2(4000) not null,
    board_date date default sysdate,
    board_reply number default 0,
    board_read number default 0,
    board_like number default 0,
    board_hate number default 0  
);

create table board_report(
board_report_no number,
board_no number references board(board_no) not null,
board_reportected_id varchar2(20) references member(mem_id) not null,
board_reporter_id varchar2(20) references member(mem_id) not null,
board_report_reason varchar2(9) not null
);

create table image(
    image_no number primary key,
    board_no number references board(board_no) on delete set null,
    board_upload varchar2(256) not null,
    board_save varchar2(256) not null unique,
    board_size number,
    board_type varchar2(256)
);
create table reply(
    reply_no number primary key,
    reply_id varchar2(20) references member(mem_id) on delete set null,
    board_no number references board(board_no) on delete set null,
    reply_date date default sysdate,
    reply_post varchar2(1500) not null    
);
create table reply_report(
    reply_report_no number primary key,
    reply_reporter_id varchar2(20) references member(mem_id) on delete set null,
    reply_no number references reply(reply_no) on delete set null,
    reply_report_reason varchar2(9) not null check(reply_report_reason in('욕설','도배','광고','음란물'))
);

create table inquiry(
inquiry_no number primary key,
mem_id REFERENCES member(mem_id) on delete set null,
large_name REFERENCES large_Type(large_name) on delete set null,
middle_name REFERENCES middle_Type(middle_name) on delete set null,
inquiry_title varchar2(90) not null,
inquiry_content varchar2(4000) not null,
inquiry_date date default sysdate not null,
inquiry_state varchar2(12) default '처리중' not null check(inquiry_state in('처리중', '완료'))
);

create sequence mysmallgroup_seq;
create sequence fitgroupimg_seq;
create sequence fitgroup_seq;
create sequence friendrequest_seq;
create sequence friend_seq;
create sequence friendrequest_seq;
create sequence notification_seq;
create sequence fitgroupfilter_seq;
create sequence adminmemo_seq;
create sequence inquiry_seq;
create sequence board_seq;
create sequence memberprofile_seq;
create sequence boardreport_seq;
create sequence image_seq;
create sequence reply_seq;
create sequence replyreport_seq;
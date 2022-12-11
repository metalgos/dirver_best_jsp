create table board(
   idx int not null auto_increment,
   title varchar(1000) not null,
   content varchar(3000) not null,
   writer varchar(1000) not null,
   indate datetime not null default now(),
   count int not null default 0,
   primary key(idx)
);


--int : 숫자형 타입
--auto_increment : 자동으로 1씩 증가하며 들어가는 키워드
--datetime : 날짜, 시간넣어주는 타입
---default 따로 값을 넣어주지 않아도 초기값이 들어감
--now() sql프로그램 안에서 현재시간을 넣어주는 함수

=

--임의로 내용넣기 auto_increment와 defaul가 있는것 빼고
insert into board (title,content,writer)
values('스프링 게시판','오늘 처음 써봅니다..','오지윤')



-- 회원 정보 테이블
-- memId,memPw,memName
create table member(
memId varchar(50) not null,
memPw varchar(50) not null,
memName varchar(50) not null,
primary key(memId)
)

select * from member;

insert into member values("test","1234","오지윤");
insert into member values("test2","12345","오지윤2");
insert into member values("test3","123455","오지윤3");

-- board 테이블에 memId 컬럼 추가
alter table board add memId varchar(50);
select * from board;
select * from member;
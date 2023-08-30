/***************
파일명 :  Or09DML.sql
DML : Data Manipulation Language(데이터 조작어)
설명 : 레코드를 조작할 때 사용하는 쿼리문, 앞에서 학습했던
    select문을 비롯하여 update(레코드 수정), delete(레코드 삭제),
    insert(레코드 입력) 가 있다.
****************/
-- study계정

/*
레코드 입력하기 : insert
    레코드 입력을 위한 쿼리로 문자형은 반드시 '로 감싸야한다
    숫자형은 '없이 그냥 쓰면된다. 만약 숫자형을 '로 감싸면 자동으로
    변환되어 입력된다.
*/
-- 새로운 테이블 생성하기
create table tb_sample(
    dept_no number(10),
    dept_name varchar2(20),
    dept_log varchar2(15),
    dept_manager varchar2(30)
    );
-- 생성된 테이블의 구조 확인
desc tb_sample;

-- 데이터 입력1 : 컬럼을 지정한 후 insert한다.
insert into tb_sample (dept_no, dept_name, dept_log, dept_manager)
    values(10, '기획실', '서울', '나연');
insert into tb_sample (dept_no, dept_name, dept_log, dept_manager)
    values(20, '전산팀', '수원', '쯔위');    

-- 데이터 입력2 : 컬럼 지정없이 전체 컬럼을 대상으로 insert한다.
insert into tb_sample values (30, '영업팀', '대구', '모모');
insert into tb_sample values (40, '인사팀', '부산', '지효');

select * from tb_sample;

/*
컬럼을 지정해서 insert하는 경우 데이터를 삽입하지 않을 컬럼을 지정할 수
있다. 아래의 경우 dept_name이 null이 된다.
*/
insert into tb_sample (dept_no, dept_log, dept_manager)
values (50, '제주', '효연');
select * from tb_sample;

/*
    지금까지 작업(트랜잭션)을 그대로 유지하겠다는 명령으로 커밋을
    수행하지 않으면 외부에서는 변경된 레코드를 확인할 수 없다.
    여기서 말하는 외부란 Java/Jsp와 같은 Oracle 이외의 프로그램을
    말한다.
    *트랜잭션이란 송금과 같은 하나의 단위작업을 말한다.
*/
commit;

-- 커밋 이후 새로운 레코드를 삽입하면 임시테이블에 저장된다.
insert into tb_sample values (60, '금융팀', '광주', '아이린');
-- 오라클에서 확인하면 실제 삽입된것처럼 보인다. 하지만 실제 반영되지
-- 않은 상태이다.
select * from tb_sample;
-- 롤백 명령으로 마지막 커밋 상태로 되돌릴 수 있다.
rollback;
--마지막에 입력한 '아이린'은 제거된다.
select * from tb_sample;

/*
    rollback 명령은 마지막 커밋 상태로 되돌려준다.
    즉, commit 한 이전의 상태로는 롤백할 수 없다.
*/

/*
레코드 수정하기 : update
    형식)
        update 테이블명
        set 컬럼1 = 값1, 컬럼2 = 값2, .....
        where 조건;
    * 조건이 없는 경우 모든 레코드가 한꺼번에 수정된다.
    * 테이블명 앞에 from이 들어가지 않는다.
*/
-- 부서번호 40인 레코드의 지역을 미국으로 수정하시오.
update tb_sample set dept_log = '미국' where dept_no = 40;
-- 지역이 서울인 레코드의 매니저명을 '박진영'으로 수정하시오.
update tb_sample set dept_manager = '박진영' where dept_log = '서울';
select * from tb_sample;

-- 모든 레코드를 대상으로 지역을 '합정'으로 변경하시오.
update tb_sample set dept_log='합정';
/*
    전체 레코드가 대상이므로 where절을 쓰지 않는다.
*/
select * from tb_sample;

/*
레코드 삭제하기 : delete
    형식)
        delete from 테이블명 where 조건;
        * 레코드는 삭제하므로 delete 뒤에 컬럼을 명시하지 않는다.
*/
-- 부서번호가 10인 레코드를 삭제하시오.
delete from tb_sample where dept_no=10;
select * from tb_sample;
-- 레코드 전체를 삭제하시오.
delete from tb_sample;
/*
where 절이 없으므로 모든 레코드를 삭제한다.
*/
select * from tb_sample;    

-- 마지막에 커밋했던 지점으로 되돌린다.
rollback;
select * from tb_sample;

/*
DML문 : 레코드를 입력 및 조작하는 쿼리문
(Data Manipulation Language "데이터 조작어")
    레코드 입력 : insert into 테이블명 (컬럼) values (값)
    레코드 수정 : update 테이블명 set 컬럼 = 값 where 조건
    레코드 삭제 : delete from 테이블명 where 조건.
* insert의 경우 컬럼은 생략할 수 있다.
*/



insert into pr_enp (eno, ename, job, regist_date) -- 방법1
    values(1, '이제훈', '어른승민', '1975-11-21');

insert into pr_enp (eno, ename, job, regist_date)
    values(2, '엄태웅', '대학생승민', '1978-07-23');    

insert into pr_enp values (3, '한가인', '어른서연', '1982-10-24'); -- 방법2

insert into pr_enp values (4, '배수지', '대학생서연', '1988-05-21');

select * from pr_enp;


select * from pr_enp where mod(eno, 2) = 0;
update pr_enp set job = job||'(짝수)' where mod(eno, 2) = 0;
update pr_enp set job = job||'(짝수)' where mod(eno, 2) = 1; --고쳐야함











































































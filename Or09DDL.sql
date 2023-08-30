/***************
���ϸ� :  Or09DDL.sql
DDL : Data Definition Language(������ ���Ǿ�)
���� : ���̺�, ��� ���� ��ü�� ���� �� �����ϴ� �������� ���Ѵ�.
****************/

/*
system �������� ������ �� �Ʒ� ����� �����Ѵ�.
���ο� ����� ������ ������ �� ���ӱ��Ѱ� ���̺� ���� ���ѵ��� �ο��Ѵ�.
*/
-- oracle21c �̻���ʹ� ���� ������ �ش����� �����ؾ��Ѵ�.
alter session set "_ORACLE_SCRIPT" = true;
-- study������ �����ϰ�, �н����带 1234�� �ο��Ѵ�.
create user study identified by 1234;
-- ������ ������ ��� ������ �ο��Ѵ�.
grant connect, resource to study;


---------------------------------------------------------------------------
--syudy ������ ������ �� �ǽ��� �����Ѵ�.

-- ��� ������ �����ϴ� ������ ���̺�
select * from dual;

-- �ش� ������ ������ ���̺� ����� ������ �ý��� ���̺�
-- �̿� ���� ���̺��� "�����ͻ���"�̶�� �Ѵ�.
select * from tab;

/*
���̺� �����ϱ�
����) create table ���̺�� (
        �÷���1 �ڷ���,
        �÷���2 �ڷ���,
        ...
        primary key(�÷���) ���� �������� �߰�
        );
*/  
create table tb_member (
    idx number(10), -- 10�ڸ��� ������ ����
    userid varchar2(30), -- ���������� 30byte ���尡��
    passwd varchar2(50), -- 50����Ʈ
    username varchar2(30), -- 30����Ʈ
    mileage number(7,2) -- �Ǽ�ǥ��, ��ü7�ڸ�, �Ҽ����� 2�ڸ� ǥ��.
    );
    
-- ���� ������ ������ ������ ���̺� ����� Ȯ���Ѵ�.
select * from tab;

-- ���̺��� ����(��Ű��) Ȯ��. �÷���, �ڷ���, ũ����� Ȯ���Ѵ�.
desc tb_member;

/*
���� ������ ���̺� ���ο� �÷� �߰��ϱ�
 => tb)member ���̺� email �÷��� �߰��Ͻÿ�.
����) alter table ���̺�� add �߰��� �÷� �ڷ���(ũ��) ��������;
*/
alter table tb_member add email varchar2(100);
desc tb_member;

/*
���� ������ ���̺� �÷� �����ϱ�
 => tb_member ���̺��� email �÷��� ����� 200���� Ȯ���Ͻÿ�.
 ���� �̸��� ����Ǵ� username �÷��� 60���� Ȯ���Ͻÿ�.
 ����) alter table ���̺�� modify ������ �÷��� �ڷ���(ũ��);
*/
alter table tb_member modify email varchar2(200);
alter table tb_member modify username varchar2(60);
desc tb_member;

/*
���� ������ ���̺��� �÷� �����ϱ�
    => tb_member ���̺��� mileage �÷��� �����Ͻÿ�.
    ����) alter table ���̺�� drop column ������ �÷���;
*/
alter table tb_member drop column mileage;
desc tb_member;

/*
����)���̺� ���Ǽ��� �ۼ��� employees ���̺��� �ش� study ������ �״��
    �����Ͻÿ�. ��, ���������� ������� �ʽ��ϴ�.
*/
create table employees (
    employee_id number(6),
    first_name varchar2(20),
    Last_name varchar2(25),
    email varchar2(25),
    phone_number varchar2(20),
    hire_date date,
    job_id varchar2(10),
    salary number(8, 2),
    commission_pct number(2, 2),
    manager_id number(6),
    department_id number(4)
    );
desc employees;

/*
���̺� �����ϱ�
    => employees ���̺��� ���̻� ������� �����Ƿ� �����Ͻÿ�.
����) drop table ������ ���̺��;
*/
select * from tab;
-- ���̺� ����
drop table employees;
-- ������ ���̺� ��Ͽ����� ������ �ʴ´�. �����뿡 �� ����.
select * from tab;
-- ��ü�� �������� �ʽ��ϴٶ�� ������ �߻��Ѵ�.
desc employees;

/*
tb_member ���̺� ���ο� ���ڵ带 �����Ѵ�.(DML�κп��� �н��� ����)
������ ���̺� �����̽���� ������ ���� ������ �� ���� �����̴�.
*/
insert into tb_member values 
(1, 'hong', '1234','ȫ�浿', 'hong@naver.com');

/*
����Ŭ 11g������ ���ο� ������ ������ �� connect, resource �� (Role)��
�ο��ϸ� ���̺� ���� �� ���Ա��� ������, �� ���Ĺ��������� ���̺����̽�
���� ������ �߻��Ѵ�. ���� �Ʒ��� ���� ���̺� �����̽��� ���� ���ѵ�
�ο��ؾ��Ѵ�.
�ش� ����� system�������� ������ �� �����ؾ��Ѵ�.
*/
grant unlimited tablespace to study;

--�ٽ� study�������� ������ �� ���ڵ带 �����Ѵ�.
insert into tb_member values 
(1, 'hong', '1234','ȫ�浿', 'hong@naver.com');
insert into tb_member values 
(1, 'yu', '9876','����', 'yoo@hanmail.com');
--���Ե� ���ڵ带 Ȯ���Ѵ�.
select * from tb_member;

-- ���̺� �����ϱ�1 : ���ڵ���� �Բ� ����
/*
    select���� ����Ҷ� where���� ������ ��� ���ڵ带 ����϶��
    ����̹Ƿ� �Ʒ������� ��� ���ڵ带 �����ͼ� ���纻 ���̺��� �����Ѵ�.
    ��, ���ڵ���� ����ȴ�.
*/
create table tb_member_copy
    as
    select * from tb_member;
desc tb_member_copy;
select * from tb_member_copy;

-- ���̺� �����ϱ�2 : ���ڵ�� �����ϰ� ���̺� ������ ����
create table tb_member_empty
as 
select * from tb_member where 1= 0;
desc tb_member_empty;
select * from tb_member_empty;

/*
DDL�� : ���̺��� ���� �� �����ϴ� ������
(Data Definition Language : ������ ���Ǿ�)
    ���̺� ���� : create table ���̺��
    ���̺� ����
        �÷� �߰� : alter table ���̺�� add �÷���
        �÷� ���� : alter table ���̺�� modify �÷���
        �÷� ���� : alter table ���̺�� drop column �÷���
    ���̺� ���� : drop table ���̺��
*/

-- ��������
--study ����

/*
1. ���� ���ǿ� �´� "pr_dept" ���̺��� �����Ͻÿ�.
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
*/
create table pr_dept(
    dno number(2),
    dname varchar2(20),
    loc varchar2(35)
    );
    
create table pr_enp (
    eno number(4),
    ename varchar2(10),
    job varchar2(30),
    regist_date date
    );































































































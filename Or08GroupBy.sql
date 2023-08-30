/***************
���ϸ� :  Or08GroupBy.sql
�׷��Լ�(select�� �ι�°)
���� : ��ü ���ڵ�(�ο�)���� ������� ����� ���ϱ� 
    ���� �ϳ��̻��� ���ڵ带 �׷����� ��� ������
    ����� ��ȯ�ϴ� �Լ� Ȥ�� ������
****************/
-- hr ����

-- ������̺����� ������ ���� : �� 107���� ����˴ϴ�.
select job_id from employees;

/*
distintct
    - ������ ���� �ִ� ��� �ߺ��� ���ڵ带 ������ �� �ϳ��� ���ڵ常
    �����ͼ� �����ش�.
    - �ϳ��� ������ ���ڵ��̹Ƿ� ������� ���� ����� �� �ִ�.
*/
select distinct job_id from employees;

/*
group by
    - ������ ���� �ִ� ���ڵ带 �ϳ��� �׷����� ��� �����´�.
    - �������°� �ϳ��� ���ڵ����� �ټ��� ���ڵ尡 �ϳ��� �׷����� ������
    ����̹Ƿ� ������� ���� ����� �� �ִ�.
    - �ִ�, �ּ�, ���, �ջ� ���� ������ �����ϴ�.
*/

-- �� �������� �������� ������� ī��Ʈ �Ѵ�.
select job_id, count(*) from employees group by job_id;

-- ������ ���� �ش������ ���� select �ؼ� ����Ǵ� ���� ������ ���غ���.
select first_name, job_id from employees where job_id = 'FI_ACCOUNT'; --5��
select first_name, job_id from employees where job_id = 'ST_CLERK'; -- 20��

/*
group ���� ���Ե� select ���� ����
    select
        �÷�1, �÷�2, .... Ȥ�� ��ü(*)
        from 
            ���̺���
        where
            ����1 and ����2 or ����3
        group by
            ���ڵ� �׷�ȭ�� ���� �÷���
        having
            �׷쿡���� ����
        order by
            ������ ���� �÷����� ���Ĺ��(asc Ȥ�� desc)
* ������ ���� ���� * (�����߿�)
from(���̺�) => where(����) => group by(�׷�ȭ) => having(�׷�����)
    => select(�÷�����) => order by(���Ĺ��)
*/

/*
sum() : �հ踦 ���� �� ����ϴ� �Լ�
    - number Ÿ���� �÷������� ����� �� �ִ�.
    - �ʵ���� �ʿ��� ��� as�� �̿��ؼ� ��Ī�� �ο��� �� �ִ�.
*/
-- ��ü ������ �޿��� �հ踦 ����Ͻÿ�.
-- where ���� �����Ƿ� ��ü������ ������� �Ѵ�.
select
    sum(salary) sumSalary1,
    to_char(sum(Salary), '999,000') sumSalary2,
    ltrim(to_char(sum(salary), 'L999,000')) sumSalary3,
    ltrim(to_char(sum(salary), '$999,000')) sumSalary4
 from employees;
 
 -- 10�� �μ��� �ٹ��ϴ� ������� �޿��� �հ�� ������ ����Ͻÿ�.
 
 select
    sum(salary) "�޿��հ�",
    to_char(sum(Salary), '999,000') "���ڸ� �ĸ�",
    ltrim(to_char(sum(salary), 'L999,000')) "������������",
    ltrim(to_char(sum(salary), '$999,000')) "��ȭ��ȣ���"
 from employees where department_id = 10;

-- sum()�� ���� �׷��Լ��� numberŸ���� �÷������� ����� �� �ִ�.
sleect sum(first_name) from employees; -- �����߻�

/*
count() : �׷�ȭ�� ���ڵ��� ������ ī��Ʈ�Ҷ� ����ϴ� �Լ�
*/
select count(*) from employees;
select count(employee_id) from employees;

/*
    count() �Լ��� ����� �� �� �ΰ��� ��� ��� ���������� *��
    ����� ���� �����Ѵ�. �÷��� Ư�� Ȥ�� �����Ϳ� ���� ���ظ�
    ���� �����Ƿ� ����ӵ��� ������.
*/

/*
count() �Լ��� ����
    ���� 1 : conut(all Į����)
        => ����Ʈ �������� �÷� ��ü�� ���ڵ带 �������� ī��Ʈ�Ѵ�.
    ���� 2: count(distinct �÷���)
        => �ߺ��� ������ ���¿��� ī��Ʈ�Ѵ�.
*/
select 
    count(job_id) "������ ��ü����1",
    count(all job_id) "������ ��ü����2",
    count(distinct job_id) "���������� ����"
    from employees;

/*
avg() : ��հ��� ���Ҷ� ����ϴ� �Լ�
*/
-- ��ü����� ��ձ޿��� ������ ����ϴ� �������� �ۼ��Ͻÿ�.
select 
    count(*) "��ü�����",
    sum(salary) "����޿��� ��",
    sum(salary) / count(*) "��ձ޿� (�������)",
    avg(salary) "��ձ޿�(avg() �Լ�)",
    trim(to_char(avg(salary), '$999.000')) "���� �� ���� ����"
    from employees;

-- ������(seles)�� ��ձ޿��� ���ΰ���?
-- 1. �μ����̺����� �������� �μ���ȣ�� �������� Ȯ���Ѵ�.
/*
�����˻��� ��ҹ��� Ȥ�� ������ ���Ե� ��� ��� ���ڵ忡 ����
���ڿ��� Ȯ���ϴ� ���� �Ұ����ϹǷ� �ϰ����� ��Ģ�� ������ ����
upper()�� ���� ��ȯ�Լ��� ����Ͽ� �˻��ϴ� ���� ����.
*/
select * from departments where department_name = initcap('sales');
select * from departments where lower(department_name) = 'sales';
select * from departments where upper(department_name) = upper('sales');

-- �μ���ȣ�� 80�� ���� Ȯ���� �� ���� �������� �ۼ��Ѵ�.
select ltrim(to_char(avg(salary), '$999,000,00'))
from employees where department_id=80;

/*
min(), max() �Լ� : �ִ밪, �ּҰ��� ã���� ����ϴ� �Լ�
*/
--��ü ����� ���� ���� �޿��� ���ΰ���?
select min(salary) from employees;

-- ��ü ����� �޿��� ���� ���� ������ �����ΰ���?
-- �Ʒ� �������� �����߻���. �׷��Լ��� �Ϲ��÷��� ����� �� ����.
select first_name, salary from employees where salary=min(salary);

--��� ���̺����� ���� ���� �޿��� 2100�� �޴� ����� �����Ѵ�.
select first_name, salary from employees where salary = 2100;




select department_id from employees group by department_id;


select department_id, sum(salary), trim(to_char(sum(salary), '999,000'))
 from employees
 group by department_id
 order by sum(salary) desc;

select * from employees;

/*
����)������̺����� �� �μ��� ������� ��ձ޿��� ������ ����ϴ� 
�������� �ۼ��Ͻÿ�.
��°��: �μ���ȣ, �޿�����, �������, ��ձ޿�
��½� �μ���ȣ�� �������� �������� �����Ͻÿ�.
*/
-- �⺻��
select department_id, sum(salary), count(*), avg(salary)
from employees
group by department_id
order by department_id asc;

-- ���İ� �Ҽ��� ó��
select
    department_id "�μ� ��ȣ",
    rtrim(to_char(sum(salary), '999,999')) "�޿��հ�",
    count(*) "�����",
    rtrim(to_char(avg(salary), '999,000')) "��� �޿�"
 from employees
 group by department_id
 order by department_id asc;
 
/*
�տ��� ����ߴ� �������� �Ʒ��� ���� �����ϸ� ������ �߻�
group by ������ ����� �÷��� select������ ����� �� ������
�� �ܿ� ���� �÷��� select������ ����� �� ����.
�׷�ȭ�� ���¿��� Ư�� ���ڵ� �ϳ��� �����ϴ� ���� �ָ��ϱ� �����̴�.
*/
select department_id, sum(salary), count(*), avg(salary), first_name
from employees
group by department_id
order by department_id asc;

/*
�ó�����) �μ� ���̵� 50�� ������� ��������, ��ձ޿�, �޿�������
    ������ ����ϴ� �������� �ۼ��Ͻÿ�.
*/
select 
    '50�� �μ�', count(*), round(avg(salary)), sum(salary)
 from employees where department_id = 50
 group by department_id;

/*
having �� : ���������� �����ϴ� �÷��� �ƴ� �׷��Լ��� ���� ����������
    ������ �÷��� ������ �߰��� �� ���
    �ش� ������ where���� �߰��ϸ� �����߻�
*/

/*
�ó�����) ������̺����� �� �μ����� �ٹ��ϰ� �ִ� ������ ��������
    ������� ��ձ޿��� ������ ����ϴ� �������� �ۼ��Ͻÿ�.
    ��, ������� 10�� �ʰ��ϴ� ���ڵ常 �����Ͻÿ�.
*/

/*
���� �μ��� �ٹ��ϴ��� �������� �ٸ��� �����Ƿ� �� ����������
group by���� 2���� �÷��� �����ؾ��Ѵ�. �� �μ��� �׷�ȭ �� ��
�ٽ� ���������� �׷�ȭ�Ѵ�.
*/
select
    department_id, job_id, count(*), avg(salary)
 from employees
 where count(*)>10    --���⼭ �����߻�
 group by department_id, job_id;
/*
�������� ������� ���������� �����ϴ� �÷��� �ƴϹǷ�
where���� ���� ������ �߻�. �̷� ��쿡�� having���� ������ �߰��ؾ� �Ѵ�.
Ex) �޿��� 3000�� ��� => ���������� �����ϹǷ� where������ ���
    ��� �޿��� 3000�� ��� => ���������� �����ϹǷ� having�� ���
    ��,�׷��Լ��� ���� ���Ҽ� �ִ� ��������.
*/
select
    department_id, job_id, count(*), avg(salary)
 from employees
 group by department_id, job_id
 having count(*)>10; -- �׷��� ������ having���� ����Ѵ�.

/*
����)�������� ����� �����޿��� ����Ͻÿ�.
    ��, ������(Manager)�� ���� ����� �����޿��� 3000�̸��� �׷���
    ���ܽ�Ű��, ����� �޿��� ������������ �����Ͽ� ����Ͻÿ�.
*/
select
    job_id, min(salary)
    from employees
    where manager_id is not null
    group by job_id
    having not min(salary) < 3000
    order by min(salary) desc;
/*
    ���������� �޿��� ���������� �����ϴ� ���û����� ������
    ���� select�Ǵ� �׸��� �޿��� �ּҰ��̹Ƿ� doder by ������
    min(salary)�� ����ؾ��Ѵ�.
*/

/*
1.��ü ����� �޿� �ְ���, ������, ��ձ޿��� ����Ͻÿ�. �÷��� ��Ī��
�Ʒ��� ���� �ϰ�, ��տ� ���ؼ��� �������·� �ݿø� �Ͻÿ�.
��Ī) �޿��ְ��� => MaxPay
�޿� ������ => MinPay
�޿���� => AvgPay
*/
-- round(), to_char() : �ݿø� ó�� �Ǿ� ��µ�
-- trunc() : �Ҽ� ���ϸ� �߶� ��µ�. �ݿø� ���� ����
select
    max(salary) MaxPay, min(salary) MinPay, 
    --avg(salary) as AvgPay,
--    round(avg(salary)) AvgPay2,
--    trunc(avg(salary)) AvgPay3,
    to_char(round(avg(salary)), '999,000') AvgPay4
from employees;
/*
2.�� ������ �������� �޿��ְ���, ������, �Ѿ� �� ��վ��� ����Ͻÿ�.
�÷��� ��Ī�� �Ʒ��� �����ϰ� ��� ���ڴ� to_char�� �̿��Ͽ� ���ڸ�����
�ĸ��� ��� �������·� ���
����) employees ���̺��� job_id�÷��� �������� �Ѵ�.

*/
select 
    job_id,
    to_char(max(salary)'999,000') MaxPay, min(salary) MinPay,
    avg(salary) AvgPay, sum(salary) SumPay
    from employees
    group by job_id;


select job_id, department_id from employees
group by job_id, department_id


















































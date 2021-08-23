
-- # �ǽ����� 
-- 1. employees ���̺��� ��� ����� first_name�� first_name�� ���� ���� ��ȸ�ϼ���.
SELECT length(first_name), first_name
from employees;


-- 2. employees ���̺��� first_name�� last_name�� �� ���� ������ �̸��� ��ȸ�ϼ���.
SELECT CONCAT(first_name, last_name) AS "fullName"
FROM employees;

-- 3. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��! LOWER
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. �� ���� ��Ī�� name�Դϴ�. 
--  ����3 ) �޿��� ��ü 10�ڸ��� ����ϵ� �������ڸ��� *�� ����մϴ�. �� ���� ��Ī�� salary�Դϴ�.

SELECT JOB_ID, 
RPAD(SUBSTR(first_name,1,3), LENGTH(first_name),'*') AS name, 
salary AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';

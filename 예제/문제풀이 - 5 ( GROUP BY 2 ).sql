-- �ǽ�����

-- 1. employees���̺��� �� ����� �μ��� �μ� ��ȣ(department_id)�� ��� �޿�(salary)�� ��ȸ�ϼ���.

SELECT
department_id AS "�μ� ��ȣ",
TO_CHAR(ROUND(avg(salary),2),'L999,999.99') AS "��� �޿�"
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 2. employees���̺��� �μ��� �μ� ��ȣ(department_id)�� �μ��� �� ��� ���� ��ȸ�ϼ���.

SELECT
department_id AS "�μ� ��ȣ",
COUNT(department_id) "��� ��"
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 3. employees���̺��� �μ��� �޿� ����� 8000�� �ʰ��ϴ� �μ��� �μ���ȣ�� �޿� ����� ��ȸ�ϼ���.

SELECT
department_id AS "�μ� ��ȣ",
(ROUND(avg(salary),2)) AS "��� �޿�"
FROM employees
GROUP BY department_id
HAVING avg(salary) > 8000
ORDER BY department_id;

-- 4. employees���̺��� �޿� ����� 8000�� �ʰ��ϴ� �� ����(job_id)�� ���Ͽ� 
--    ���� �̸�(job_id)�� SA�� �����ϴ� ����� �����ϰ� ���� �̸��� �޿� ����� 
--    �޿� ����� ���� ������ �����Ͽ� ��ȸ�ϼ���.

SELECT
job_id AS "���� �̸�",
avg(salary) AS "��� �޿�"
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING avg(salary) > 8000
-- salary�� ORDERBY �ȵ� �� ��Ī
ORDER BY avg(salary) DESC;



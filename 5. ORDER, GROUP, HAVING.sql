
-- # GROUP BY, HAVING
-- 1. ���� �Լ�

SELECT
-- ���� �� ���
COUNT(emp_no) AS "�� �����",
MAX(birth_de) AS "���� � ���"
, MIN(birth_de) AS "���� ���� ���� ���"
FROM tb_emp;

SELECT
COUNT(*),
COUNT(direct_manager_emp_no)
FROM tb_emp;

--2. GROUP BY : ���̺� ������ �׷�ȭ �� ��
-- EX) �μ����� ���� ������ �������, ���� ���̸��� ����� �������, �μ� �� ���� ��
SELECT birth_de, dept_cd, emp_nm
FROM tb_emp
ORDER BY dept_cd ASC; -- ����" ASC - ������(�⺻��) DESC(������)

SELECT dept_cd,
 COUNT(*) AS "�μ��� ���� ��"
, MAX(birth_de) AS "�μ� ����"
, MIN(birth_de) AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;

-- HAVING�� : �׷�ȭ�� ������� ������ �ɾ� �� ���� ����
SELECT dept_cd,
 COUNT(*) AS "�μ��� ���� ��"
, MAX(birth_de) AS "�μ� ����"
, MIN(birth_de) AS "�μ� ������"
FROM tb_emp
GROUP BY dept_cd
-- COUNT�� 2�� �̻��� �׷츸 ǥ��
HAVING COUNT(*) >= 2
ORDER BY dept_cd
;


-- ���� ORDER BY
-- ASC: ������(�⺻��) // DESC : ������
-- �׻� SELECT���� �� �������ٿ� ��ġ
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

-- ��� �� ������
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm;

-- ORDER BY ����
SELECT emp_no, emp_nm, addr
FROM tb_emp
-- emp_no, emp_nm�� ������ ������ ���ĵ�
ORDER BY 2 DESC;

-- emp_no ������ �� ���� �� ���� ������ emp_no�� ������������ �����ϰڴ�.
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no DESC;
--ORDER BY 2 DESC, 1 DESC;


SELECT emp_no AS "��� ��ȣ", 
emp_nm AS "��� ��", 
addr AS "���� �ּ�"
FROM tb_emp
ORDER BY "���� �ּ�" DESC;
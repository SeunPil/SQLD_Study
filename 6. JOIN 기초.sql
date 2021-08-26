

-- ���� ����
SELECT
 emp_no, emp_nm, dept_cd
FROM tb_emp
;

SELECT
dept_cd, dept_nm
FROM tb_dept;


-- ��Ī�� ���� �ʾ� ��� ����� ��� �μ��� ����Ǿ���.
SELECT 
 E.emp_no
 , E.emp_nm
 , E.dept_cd
 , D.dept_nm
FROM tb_emp E, tb_dept D
;

-- JOIN ����
SELECT 
 E.emp_no
 , E.emp_nm
 , E.dept_cd
 , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- �ڰ��� ���� ���̺�
SELECT * FROM tb_certi;

-- ����� ����� �ڰ��� ���� ���̺�
SELECT * FROM tb_emp_certi;

SELECT
E.emp_no, E.emp_nm,
EC.certi_cd, EC.acqu_de
FROM tb_emp E, tb_emp_certi EC
WHERE E.emp_no = EC.emp_no;

SELECT
C.certi_cd,
C.certi_nm,
C.issue_insti_nm,
EC.acqu_de, ec.emp_no
FROM tb_certi C, tb_emp_certi EC
WHERE C.certi_cd = EC.certi_cd;


-- 3���� ���̺� ����
SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.emp_nm LIKE '��%'
    AND C.acqu_de LIKE '2019%'
ORDER BY C.acqu_de;

-- #INNER JOIN
-- 1. 2�� �̻��� ���̺��� ����� �÷��� ���� �������� ���յǴ� ���α���̴�.
-- 2. WHERE���� ���� �÷����� �������(=)�� ���� ���ε˴ϴ�.

SELECT
 E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E,tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%����%'
ORDER BY 4, 1;


-- 1. NATURAL JOIN�� �ٸ� ���̺��� ���� �÷����� �ڵ� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ����
-- 3. �� �� ���εǴ� �����̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, ALIAS�� ���̺���� ���� �� �����ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷����� �ڵ� �����ϸ� ��� ���տ��� �� ���� �����ݴϴ�.

-- tb_emp, tb_dept���� ���������� dept_cd�� �ִ�.
SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D;

SELECT
*
FROM tb_emp E NATURAL JOIN tb_dept D;

-- # USING�� ����
-- 1. NATURAL JOIN�� �ڵ����� �̸��� ��ġ�ϴ� ��� �÷��� ���� ������ ����������,
-- USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ���������� ������ �����մϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ���� �� �����ϴ�.
SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D 
USING(dept_cd)
;

-- # JOIN ON��
-- 1. ���� ���� ������(ON��)�� �Ϲ� ���� ������(WHERE��)�� �и��ؼ� �ۼ��ϴ� ����Դϴ�.
-- 2. ON���� ����ϸ� JOIN���Ŀ� �� �����̳� ���������� ���� �߰� ������ �� �� �ֽ��ϴ�.
-- 3. FROM ( ON ) WHERE �� ���̿� �Է��Ѵ�.

SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd
;

-- ���� ���� �ؼ���
--
--SELECT 
--    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
--FROM tb_emp A 
--JOIN tb_emp_certi B 
--ON A.emp_no = B.emp_no
--JOIN tb_certi C 
--ON B.certi_cd = C.certi_cd
--JOIN tb_dept D
--ON A.dept_cd = D.dept_cd;




SELECT
 E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE addr LIKE '%����%'
ORDER BY 1
;

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


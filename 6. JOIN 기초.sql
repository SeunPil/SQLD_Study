

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

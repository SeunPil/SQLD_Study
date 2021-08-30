

-- # ������ ���� ����
-- ����Ŀ���� ��ȸ ����� 1�� ������ ���

-- �ߺ��� ���� ��
SELECT 
*
FROM tb_emp
WHERE dept_cd = ( 
    -- ���� ���� ()
    SELECT dept_cd 
    FROM tb_emp 
    WHERE emp_nm = '�̰���'
);


-- �μ���ȣ�� 100004���� �μ��� ��� ������� ��ȸ

SELECT 
*
FROM tb_emp
WHERE dept_cd = 100004;

-- �̳��� �����ִ� �μ��� ��� ������� ��ȸ

SELECT 
*
FROM tb_emp
WHERE dept_cd = ( 
    -- ���� ���� ()
    SELECT dept_cd 
    FROM tb_emp 
    WHERE emp_nm = '�̳���'
);

-- 20200525�� ���� �޿��� ȸ���� 20200525 ��ü ��� �޿����� ���� ������� ������ȸ
-- AVG�� ���� 1�� ���ϱ� ������ '������ ��������'�̴�.

SELECT 
 A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE pay_de = '20200525'
-- ## ��������()
AND B.pay_amt >= (
    SELECT 
    avg(pay_amt)    
    FROM tb_sal_his
    WHERE pay_de = '20200525'
    )
-- ## 
ORDER BY EMP_no, B.pay_de
;

SELECT 
avg(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525';

-- # ������ ��������
-- �������� ��ȸ �Ǽ��� ���� ���� ��

-- �ѱ� �����ͺ��̽� ��������� �߱��� �ڰ����� �������ִ� �����ȣ�� ���� �ڰ��� ������ ��ȸ
SELECT * FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������';

SELECT
B.emp_nm, A.EMP_NO, COUNT(certi_cd)
FROM tb_emp_certi A, tb_emp B
WHERE A.certi_cd IN (
        SELECT certi_cd FROM tb_certi WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
AND A.emp_no = B.emp_no
GROUP BY A.EMP_no, B.emp_nm
ORDER BY A.emp_no;

-- # �μ����� 2�� �̻��� �μ� �߿��� �� �μ��� ���� ���� ���� ����� ������� ��ȸ
SELECT
    A.emp_no, 
    A.emp_nm, 
    A.birth_de, 
    B. dept_cd,
    B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd

-- WHERE (����)�� ���� ������ SELECT (����)�� �¾ƾ� �Ѵ�.
WHERE (A.dept_cd, A.birth_de) IN (
                                    SELECT 
                                    dept_cd, MIN(birth_de)
                                    FROM tb_emp
                                    GROUP BY dept_cd
                                    HAVING COUNT(*) >= 2
)
ORDER BY A.emp_no
;


-- EXISTS ��
-- �ּҰ� ������ �������� �ٹ��ϰ��ִ� �μ� ��ü������ ��ȸ

SELECT 
B.emp_nm, B.addr, B.dept_cd
FROM tb_dept A
JOIN tb_emp B
ON A.dept_cd = B.dept_cd
WHERE B.addr LIKE '%����%'
;

SELECT * FROM tb_emp WHERE addr LIKE '%����%';

SELECT
    A.dept_cd, A.dept_nm
    FROM tb_dept A
    WHERE EXISTS(
                SELECT
                    1
                FROM tb_emp B
                WHERE addr LIKE '%����%'
                -- �� tb_dept A�� ����
                AND A.dept_cd = B.dept_cd
                );
                

-- ���ǿ� �´� ����� '1'�� ǥ���ϴ� ���̴�.
-- 2���̸� 1�� 2�� 3���̸� 3��...
SELECT
1
FROM tb_emp
WHERE addr LIKE '%����%';

-- # ��Į�� �������� ( SELECT���� ���� �������� )
SELECT 
    A.emp_no, A.emp_nm
    , B.dept_nm
    ,A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

-- # ��Į�� �������� ����
-- # ���ʿ��� JOIN ����
SELECT 
    A.emp_no, A.emp_nm, (
    SELECT B.dept_nm 
    FROM tb_dept B 
    WHERE A.dept_cd = B.dept_cd 
    ) AS dept_nm
, A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
;

-- # �ζ��� �� ( FROM�� �ȿ� �ִ� �������� )

SELECT 
 X.emp_nm, X.dept_nm
FROM(SELECT 
    A.emp_no, A.emp_nm
    , B.dept_nm
    ,A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd) X
;
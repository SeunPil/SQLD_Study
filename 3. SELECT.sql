

-- SELECT �⺻
SELECT 
    certi_cd, certi_nm
FROM TB_CERTI;

SELECT 
    certi_nm
FROM TB_CERTI;

SELECT 
    *
FROM TB_CERTI;

-- DISTINCT : �ߺ��� ����
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM TB_CERTI;


-- �� ��Ī ���� (ALIAS)
SELECT 
    certi_cd AS "�ڰ����ڵ�"
    , certi_nm AS "�ڰ����̸�"
    , issue_insti_nm "��������"
FROM tb_certi;


-- ���տ�����( || )�� ����� �÷������� ����
SELECT 
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "�ڰ��� ����"
FROM tb_certi;

-- ���� ���̺� (dual) : �ܼ� �������� ��ȸ�ϰ� ���� ��

SELECT 
    (3 + 7) * 5 / 10 AS "������"
FROM dual;












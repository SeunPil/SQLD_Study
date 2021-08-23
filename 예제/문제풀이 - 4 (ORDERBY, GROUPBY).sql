-- ������� �޿��� ���� ���� ���� �׼�, ���� ���� ���� �׼�, ��� �׼�
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de; -- emp_no�� ���� ��, ���� ���� pay_de�� ������


-- 2019�� 1�Ⱓ ��� �޿��� 450���� �̻��� ����� ��ȸ
SELECT
emp_no
, MAX(pay_amt) AS "�ְ� ���� ��"
, MIN(pay_amt) AS "���� ���� ��"
-- ���ɾ��� ���� ����
, TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') AS "��� ���� ��"
FROM tb_sal_his
-- 2019�� �� �� ���� 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
-- ��� �޿��� 450���� �̻�
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no;


-- 2019�� 1�Ⱓ ����� ����
SELECT
emp_no
, MAX(pay_amt) AS "�ְ� ���� ��"
, MIN(pay_amt) AS "���� ���� ��"
-- ���ɾ��� ���� ����
, TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') AS "��� ���� ��"
, TO_CHAR(ROUND(AVG(pay_amt * 12), 2),'L999,999,999') AS "����"
--, TO_CHAR(ROUND(SUM(pay_amt *), 2),'L999,999,999') AS "����"
FROM tb_sal_his
-- 2019�� �� �� ���� 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no;
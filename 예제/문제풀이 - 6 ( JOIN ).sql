-- # �ǽ� ����
-- 1. employees, departments���̺��� INNER JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.
-- ���� �÷� department_id

SELECT 
department_id, employee_id
FROM employees;

SELECT 
E.first_name, E.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id;
-- AND E.manager_id = D.manager_id ## NATURAL JOIN

-- 2. employees, departments���̺��� NATURAL JOIN�ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
E.first_name, department_id, D.department_name
FROM employees E NATURAL JOIN departments D;
-- ��Ű�� Ȯ�ν� employees�� departments���� ���� �÷���
-- department_id, manager_id�� �����̶� ���� 32�� ��µȴ�.

-- 3. employees, departments���̺��� USING�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT
E.first_name, department_id, D.department_name
FROM employees E JOIN departments D
USING (department_id);
-- USING (department_id, manager_id); ## NATURAL JOIN


-- 4. employees, departments���̺��� JOIN ON�� ����ؼ�
--    first_name, department_id, department_name�� ��ȸ�ϼ���.

SELECT 
E.first_name, D.department_id, D.department_name
FROM employees E JOIN departments D
ON E.department_id = D.department_id;


-- # ������ ���� �߰� ����

SELECT 
employee_id,
first_name,
manager_id,
LEVEL
FROM employees
-- MANAGER_ID = 100���� �����ض�
START WITH EMPLOYEE_id = 121
CONNECT BY PRIOR employee_id = manager_id
ORDER SIBLINGS BY first_name;
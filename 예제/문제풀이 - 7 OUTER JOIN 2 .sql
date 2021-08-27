
-- OUTER JOIN �߰� ����
SELECT * FROM JOB_HISTORY
ORDER BY employee_id;

-- ��� ����� ������ ��ȸ�Ұǵ� Ȥ�� �������� �̷��� ������ �Բ� ��ȸ�ϰ�ʹ�

SELECT
E.employee_id, E.first_name, E.hire_date, E.job_id AS "���� ����"
, J.start_date, J.end_date, J.job_id AS "�� �� ����"
-- ��� ������ ���� ���̺� �����ϱ� ����
FROM employees E LEFT OUTER JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id
;

-- �ǽ����� (JOIN)

-- 1. �����ȣ�� 103���� ����� �̸�(employee_name)�� �Ŵ��� �̸�(manager_name)�� ����ϼ���.

SELECT 
A.employee_id, 
A.first_name || ' ' || A.last_name AS employee_name,
A.manager_id, 
B.first_name ||' ' || B.last_name AS "manager_name"
from employees A
JOIN employees B
ON A.manager_id = B.manager_id(+)
WHERE A.employee_id = 103
ORDER BY A.employee_id;

-- 2. ��� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� ��ȸ�ϼ���.
-- employees, departments, locations 3�� ����

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E LEFT JOIN DEPARTMENTS D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON L.location_id = D.location_id;


-- 3. 103�� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E LEFT JOIN DEPARTMENTS D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON L.location_id = D.location_id
WHERE E.employee_id = 103;


-- 4. �μ� �̸��� IT�� �����ϴ� ����� first_name�� department_name, 
--    street_address + ',' + city + ',' + state_province�� address��� alias�� 
--    �����Ͽ� ��ȸ�ϼ���.

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E JOIN DEPARTMENTS D
ON E.department_id = D.department_id
JOIN locations L
ON L.location_id = D.location_id
WHERE D.department_name IN 'IT%';


-- 5. jobs���̺��� ��� ���� id(job_id)�� ������(job_title)�� ��ȸ�ϴµ� 
--    ���� �������� �̷��� �ִٸ� �ش� �̷� ���� 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    �� �Բ� ��ȸ�ϼ���.


SELECT
-- JOBS ���̺� J
J.job_id, 
J.job_title,
-- job_history ���̺� H
H.start_date, 
H.end_date, 
H.job_id AS "���� ����", 
H.employee_id,
-- Departments ���̺� D
D.department_name
FROM jobs J 
left join job_history H
ON J.job_id = H.job_id
left join employees E
ON H.employee_id = E.employee_id
left join departments D
ON E.department_id = D.department_id;



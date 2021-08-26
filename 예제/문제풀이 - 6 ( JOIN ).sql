-- # 실습 문제
-- 1. employees, departments테이블을 INNER JOIN해서
--    first_name, department_id, department_name을 조회하세요.
-- 공통 컬럼 department_id

SELECT 
department_id, employee_id
FROM employees;

SELECT 
E.first_name, E.department_id, D.department_name
FROM employees E, departments D
WHERE E.department_id = D.department_id;
-- AND E.manager_id = D.manager_id ## NATURAL JOIN

-- 2. employees, departments테이블을 NATURAL JOIN해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
E.first_name, department_id, D.department_name
FROM employees E NATURAL JOIN departments D;
-- 스키마 확인시 employees와 departments에는 공통 컬럼이
-- department_id, manager_id가 공통이라 행이 32개 출력된다.

-- 3. employees, departments테이블을 USING을 사용해서
--    first_name, department_id, department_name을 조회하세요.

SELECT
E.first_name, department_id, D.department_name
FROM employees E JOIN departments D
USING (department_id);
-- USING (department_id, manager_id); ## NATURAL JOIN


-- 4. employees, departments테이블을 JOIN ON을 사용해서
--    first_name, department_id, department_name을 조회하세요.

SELECT 
E.first_name, D.department_id, D.department_name
FROM employees E JOIN departments D
ON E.department_id = D.department_id;

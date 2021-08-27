
-- OUTER JOIN 추가 예제
SELECT * FROM JOB_HISTORY
ORDER BY employee_id;

-- 모든 사원의 접오를 조회할건데 혹시 직무변동 이력이 있으면 함께 조회하고싶다

SELECT
E.employee_id, E.first_name, E.hire_date, E.job_id AS "현재 직업"
, J.start_date, J.end_date, J.job_id AS "그 전 직업"
-- 사원 정보는 왼쪽 테이블에 존재하기 때문
FROM employees E LEFT OUTER JOIN job_history J
ON E.employee_id = J.employee_id
ORDER BY J.employee_id
;

-- 실습문제 (JOIN)

-- 1. 사원번호가 103번인 사원의 이름(employee_name)과 매니저 이름(manager_name)을 출력하세요.

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

-- 2. 모든 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 조회하세요.
-- employees, departments, locations 3개 조인

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E LEFT JOIN DEPARTMENTS D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON L.location_id = D.location_id;


-- 3. 103번 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E LEFT JOIN DEPARTMENTS D
ON E.department_id = D.department_id
LEFT JOIN locations L
ON L.location_id = D.location_id
WHERE E.employee_id = 103;


-- 4. 부서 이름이 IT로 시작하는 사원의 first_name과 department_name, 
--    street_address + ',' + city + ',' + state_province를 address라는 alias로 
--    지정하여 조회하세요.

SELECT
E.first_name , D.department_name , L.state_province || ', ' || L.city || ', ' || L.street_address AS address
FROM employees E JOIN DEPARTMENTS D
ON E.department_id = D.department_id
JOIN locations L
ON L.location_id = D.location_id
WHERE D.department_name IN 'IT%';


-- 5. jobs테이블에서 모든 직무 id(job_id)와 직무명(job_title)을 조회하는데 
--    만약 직무변동 이력이 있다면 해당 이력 정보 
-- (start_date, end_date, job_id, employee_id, first_name, department_id, department_name)
--    도 함께 조회하세요.


SELECT
-- JOBS 테이블 J
J.job_id, 
J.job_title,
-- job_history 테이블 H
H.start_date, 
H.end_date, 
H.job_id AS "과거 직업", 
H.employee_id,
-- Departments 테이블 D
D.department_name
FROM jobs J 
left join job_history H
ON J.job_id = H.job_id
left join employees E
ON H.employee_id = E.employee_id
left join departments D
ON E.department_id = D.department_id;



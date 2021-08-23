
-- # GROUP BY, HAVING
-- 1. 집계 함수

SELECT
-- 행의 수 출력
COUNT(emp_no) AS "총 사원수",
MAX(birth_de) AS "가장 어린 사람"
, MIN(birth_de) AS "가장 나이 많은 사람"
FROM tb_emp;

SELECT
COUNT(*),
COUNT(direct_manager_emp_no)
FROM tb_emp;

--2. GROUP BY : 테이블 내에서 그룹화 할 때
-- EX) 부서별로 가장 어린사람의 생년월일, 가장 나이많은 사람의 생년월일, 부서 별 직원 수
SELECT birth_de, dept_cd, emp_nm
FROM tb_emp
ORDER BY dept_cd ASC; -- 정렬" ASC - 오름차(기본값) DESC(내림차)

SELECT dept_cd,
 COUNT(*) AS "부서별 직원 수"
, MAX(birth_de) AS "부서 막내"
, MIN(birth_de) AS "부서 연장자"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;

-- HAVING절 : 그룹화된 결과에서 조건을 걸어 행 수를 제한
SELECT dept_cd,
 COUNT(*) AS "부서별 직원 수"
, MAX(birth_de) AS "부서 막내"
, MIN(birth_de) AS "부서 연장자"
FROM tb_emp
GROUP BY dept_cd
-- COUNT가 2명 이상인 그룹만 표시
HAVING COUNT(*) >= 2
ORDER BY dept_cd
;


-- 정렬 ORDER BY
-- ASC: 오름차(기본값) // DESC : 내림차
-- 항상 SELECT절의 맨 마지막줄에 위치
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_no DESC;

-- 사원 명 오름차
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm;

-- ORDER BY 순차
SELECT emp_no, emp_nm, addr
FROM tb_emp
-- emp_no, emp_nm은 내림차 순으로 정렬됨
ORDER BY 2 DESC;

-- emp_no 내림차 순 정렬 후 값이 같으면 emp_no를 내림차순으로 정렬하겠다.
SELECT emp_no, emp_nm, addr
FROM tb_emp
ORDER BY emp_nm DESC, emp_no DESC;
--ORDER BY 2 DESC, 1 DESC;


SELECT emp_no AS "사원 번호", 
emp_nm AS "사원 명", 
addr AS "자택 주소"
FROM tb_emp
ORDER BY "자택 주소" DESC;
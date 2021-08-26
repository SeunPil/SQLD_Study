

-- 조인 기초
SELECT
 emp_no, emp_nm, dept_cd
FROM tb_emp
;

SELECT
dept_cd, dept_nm
FROM tb_dept;


-- 매칭을 하지 않아 모든 사람에 모든 부서가 연결되었다.
SELECT 
 E.emp_no
 , E.emp_nm
 , E.dept_cd
 , D.dept_nm
FROM tb_emp E, tb_dept D
;

-- JOIN 조건
SELECT 
 E.emp_no
 , E.emp_nm
 , E.dept_cd
 , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;

-- 자격증 정보 테이블
SELECT * FROM tb_certi;

-- 사원이 취득한 자격증 정보 테이블
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


-- 3개의 테이블 조인
SELECT
A.emp_no, A.emp_nm, B.certi_cd,
B.certi_nm, c.acqu_de
FROM tb_emp A, tb_certi B, tb_emp_certi C
WHERE A.emp_no = C.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.emp_nm LIKE '이%'
    AND C.acqu_de LIKE '2019%'
ORDER BY C.acqu_de;

-- #INNER JOIN
-- 1. 2개 이상의 테이블이 공통된 컬럼에 의해 논리적으로 결합되는 조인기법이다.
-- 2. WHERE절에 사용된 컬럼들이 동등연산자(=)에 의해 조인됩니다.

SELECT
 E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E,tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND addr LIKE '%용인%'
ORDER BY 4, 1;


-- 1. NATURAL JOIN은 다른 테이블의 같은 컬럼명을 자동 조인하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은
-- 3. 이 때 조인되는 동일이름의 컬럼은 데이터 타입이 같아야 하며, ALIAS나 테이블명을 붙일 수 없습니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼으로 자동 존이하며 결과 집합에서 한 번만 보여줍니다.

-- tb_emp, tb_dept에는 공통적으로 dept_cd가 있다.
SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E NATURAL JOIN tb_dept D;

SELECT
*
FROM tb_emp E NATURAL JOIN tb_dept D;

-- # USING절 조인
-- 1. NATURAL JOIN은 자동으로 이름이 일치하는 모든 컬럼에 대한 조인이 가능하지만,
-- USING을 사용하면 원하는 컬럼에 대해서만 선택적으로 조인이 가능합니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 붙일 수 없습니다.
SELECT
    E.emp_no, E.emp_nm, E.addr, dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D 
USING(dept_cd)
;

-- # JOIN ON절
-- 1. 조인 조건 서술부(ON절)와 일반 조건 서술부(WHERE절)를 분리해서 작성하는 방법입니다.
-- 2. ON절을 사용하면 JOIN이후에 논리 연산이나 서브쿼리와 같은 추가 서술을 할 수 있습니다.
-- 3. FROM ( ON ) WHERE 절 사이에 입력한다.

SELECT 
    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
FROM tb_emp A, tb_emp_certi B, tb_certi C, tb_dept D
WHERE A.emp_no = B.emp_no
    AND B.certi_cd = C.certi_cd
    AND A.dept_cd = D.dept_cd
;

-- 다중 조인 해석본
--
--SELECT 
--    A.emp_no, A.emp_nm, D.dept_nm, B.acqu_de, B.certi_cd, C.certi_nm
--FROM tb_emp A 
--JOIN tb_emp_certi B 
--ON A.emp_no = B.emp_no
--JOIN tb_certi C 
--ON B.certi_cd = C.certi_cd
--JOIN tb_dept D
--ON A.dept_cd = D.dept_cd;




SELECT
 E.emp_no, E.emp_nm, E.addr, E.dept_cd, D.dept_nm
FROM tb_emp E JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE addr LIKE '%용인%'
ORDER BY 1
;

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
-- ON    조인 조건
-- WHERE 조회 조건
-- GROUP BY  열을 그룹화
-- HAVING    그룹화 조건
-- ORDER BY  정렬할 열 [ASC | DESC];


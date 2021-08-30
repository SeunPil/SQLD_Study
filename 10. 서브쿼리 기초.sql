

-- # 단일행 서브 쿼리
-- 서브커리의 조회 결과가 1건 이하인 경우

-- 중복이 있을 때
SELECT 
*
FROM tb_emp
WHERE dept_cd = ( 
    -- 서브 쿼리 ()
    SELECT dept_cd 
    FROM tb_emp 
    WHERE emp_nm = '이관심'
);


-- 부서번호가 100004번인 부서의 모든 사원정보 조회

SELECT 
*
FROM tb_emp
WHERE dept_cd = 100004;

-- 이나라가 속해있는 부서의 모든 사원정보 조회

SELECT 
*
FROM tb_emp
WHERE dept_cd = ( 
    -- 서브 쿼리 ()
    SELECT dept_cd 
    FROM tb_emp 
    WHERE emp_nm = '이나라'
);

-- 20200525에 받은 급여가 회사의 20200525 전체 평균 급여보다 높은 사원들의 정보조회
-- AVG는 행이 1개 이하기 때문에 '단일행 서브쿼리'이다.

SELECT 
 A.emp_no, A.emp_nm, B.pay_de, B.pay_amt
FROM tb_emp A
JOIN tb_sal_his B
ON A.emp_no = B.emp_no
WHERE pay_de = '20200525'
-- ## 서브쿼리()
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

-- # 다중행 서브쿼리
-- 서브쿼리 조회 건수가 여러 행인 것

-- 한국 데이터베이스 진흥원에서 발급한 자격증을 가지고있는 사원번호와 보유 자걱증 개수를 조회
SELECT * FROM tb_certi WHERE issue_insti_nm = '한국데이터베이스진흥원';

SELECT
B.emp_nm, A.EMP_NO, COUNT(certi_cd)
FROM tb_emp_certi A, tb_emp B
WHERE A.certi_cd IN (
        SELECT certi_cd FROM tb_certi WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
AND A.emp_no = B.emp_no
GROUP BY A.EMP_no, B.emp_nm
ORDER BY A.emp_no;

-- # 부서원이 2명 이상인 부서 중에서 각 부서의 가장 나이 많은 사람의 사원정보 조회
SELECT
    A.emp_no, 
    A.emp_nm, 
    A.birth_de, 
    B. dept_cd,
    B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd

-- WHERE (조건)과 서브 쿼리의 SELECT (조건)과 맞아야 한다.
WHERE (A.dept_cd, A.birth_de) IN (
                                    SELECT 
                                    dept_cd, MIN(birth_de)
                                    FROM tb_emp
                                    GROUP BY dept_cd
                                    HAVING COUNT(*) >= 2
)
ORDER BY A.emp_no
;


-- EXISTS 문
-- 주소가 강남인 직원들이 근무하고있는 부서 전체정보를 조회

SELECT 
B.emp_nm, B.addr, B.dept_cd
FROM tb_dept A
JOIN tb_emp B
ON A.dept_cd = B.dept_cd
WHERE B.addr LIKE '%강남%'
;

SELECT * FROM tb_emp WHERE addr LIKE '%강남%';

SELECT
    A.dept_cd, A.dept_nm
    FROM tb_dept A
    WHERE EXISTS(
                SELECT
                    1
                FROM tb_emp B
                WHERE addr LIKE '%강남%'
                -- 밖 tb_dept A와 조인
                AND A.dept_cd = B.dept_cd
                );
                

-- 조건에 맞는 사람을 '1'로 표시하는 것이다.
-- 2명이면 1이 2개 3명이면 3개...
SELECT
1
FROM tb_emp
WHERE addr LIKE '%강남%';

-- # 스칼라 서브쿼리 ( SELECT절에 들어가는 서브쿼리 )
SELECT 
    A.emp_no, A.emp_nm
    , B.dept_nm
    ,A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

-- # 스칼라 서브쿼리 예제
-- # 불필요한 JOIN 제거
SELECT 
    A.emp_no, A.emp_nm, (
    SELECT B.dept_nm 
    FROM tb_dept B 
    WHERE A.dept_cd = B.dept_cd 
    ) AS dept_nm
, A.addr, A.birth_de, A.sex_cd
FROM tb_emp A
;

-- # 인라인 뷰 ( FROM절 안에 넣는 서브쿼리 )

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
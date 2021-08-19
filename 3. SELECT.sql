

-- SELECT 기본
SELECT 
    certi_cd, certi_nm
FROM TB_CERTI;

SELECT 
    certi_nm
FROM TB_CERTI;

SELECT 
    *
FROM TB_CERTI;

-- DISTINCT : 중복값 제외
SELECT ALL
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    issue_insti_nm
FROM TB_CERTI;

SELECT DISTINCT
    certi_nm, issue_insti_nm
FROM TB_CERTI;


-- 열 별칭 지정 (ALIAS)
SELECT 
    certi_cd AS "자격증코드"
    , certi_nm AS "자격증이름"
    , issue_insti_nm "발행기관명"
FROM tb_certi;


-- 결합연산자( || )를 사용한 컬럼데이터 결합
SELECT 
    certi_nm || '(' || certi_cd || ') - ' || issue_insti_nm AS "자격증 정보"
FROM tb_certi;

-- 더미 테이블 (dual) : 단순 연산결과를 조회하고 싶을 때

SELECT 
    (3 + 7) * 5 / 10 AS "연산결과"
FROM dual;












-- 사원별로 급여를 제일 많이 받은 액수, 제일 적게 받은 액수, 평균 액수
SELECT * FROM tb_sal_his
ORDER BY emp_no, pay_de; -- emp_no로 정렬 후, 같은 값은 pay_de로 재정렬


-- 2019년 1년간 평균 급여가 450만원 이상인 사원만 조회
SELECT
emp_no
, MAX(pay_amt) AS "최고 수령 액"
, MIN(pay_amt) AS "최저 수령 액"
-- 수령액의 단위 변경
, TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') AS "평균 수령 액"
FROM tb_sal_his
-- 2019년 한 해 동안 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
-- 평균 급여가 450만원 이상
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no;


-- 2019년 1년간 사원별 연봉
SELECT
emp_no
, MAX(pay_amt) AS "최고 수령 액"
, MIN(pay_amt) AS "최저 수령 액"
-- 수령액의 단위 변경
, TO_CHAR(ROUND(AVG(pay_amt), 2),'L999,999,999') AS "평균 수령 액"
, TO_CHAR(ROUND(AVG(pay_amt * 12), 2),'L999,999,999') AS "연봉"
--, TO_CHAR(ROUND(SUM(pay_amt *), 2),'L999,999,999') AS "연봉"
FROM tb_sal_his
-- 2019년 한 해 동안 
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no;
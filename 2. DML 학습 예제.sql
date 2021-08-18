

-- DML: 데이터 조작어
-- SELECT, INSERT, UPDATE, DELETE

-- 데이터 삽입
INSERT INTO BOARD
    (BNO, CONTENT, WRITER, REG_DATE)
VALUES
    (1,'안녕','재밌는 내용입니다','마이콜',SYSDATE);


-- 글 번호(BNO PK)가 중복되어 데이터 삽입이 안됨
    INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (2,'새로운 글이야','도우너',SYSDATE);
    
    
INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (2,'새로운 글이야','도우너',SYSDATE);


-- 테이블의 모든 컬럼을 순서대로 채울 경우 컬럼지정을 생략 가능
INSERT INTO BOARD
--    (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
    (3,'3번 글이야','가나다라마바사','둘리',SYSDATE);
    
-- 조회
SELECT*FROM BOARD;
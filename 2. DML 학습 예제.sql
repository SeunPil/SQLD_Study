

-- DML: ������ ���۾�
-- SELECT, INSERT, UPDATE, DELETE

-- ������ ����
INSERT INTO BOARD
    (BNO, CONTENT, WRITER, REG_DATE)
VALUES
    (1,'�ȳ�','��մ� �����Դϴ�','������',SYSDATE);


-- �� ��ȣ(BNO PK)�� �ߺ��Ǿ� ������ ������ �ȵ�
    INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (2,'���ο� ���̾�','�����',SYSDATE);
    
    
INSERT INTO BOARD
    (BNO, TITLE, WRITER, REG_DATE)
VALUES
    (2,'���ο� ���̾�','�����',SYSDATE);


-- ���̺��� ��� �÷��� ������� ä�� ��� �÷������� ���� ����
INSERT INTO BOARD
--    (BNO, TITLE, CONTENT, WRITER, REG_DATE)
VALUES
    (3,'3�� ���̾�','�����ٶ󸶹ٻ�','�Ѹ�',SYSDATE);
    
-- ��ȸ
SELECT*FROM BOARD;
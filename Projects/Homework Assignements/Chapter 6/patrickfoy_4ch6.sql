--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 6 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_5.sql";
--======================================================

-- 1 ===================================================
DROP SEQUENCE CUST#_SEQ; -- CLEAR SEQUENCE FOR TESTING

CREATE SEQUENCE CUST#_SEQ
INCREMENT BY 1
START WITH 1021
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOcACHE;
--VALIDATION--
SELECT *
FROM all_sequences
WHERE SEQUENCE_NAME = 'CUST#_SEQ';
-- 2 ===================================================
INSERT INTO CUSTOMERS (CUSTOMER#, LASTNAME, FIRSTNAME, ZIP)
VALUES (CUST#_SEQ.NEXTVAL, 'Shoulders', 'Frank', '23567');
--VALIDATION--
SELECT *
FROM CUSTOMERS
WHERE LASTNAME = 'Shoulders';
-- 3 ===================================================
DROP SEQUENCE MY_FIRST_SEQ; -- CLEAR SEQUENCE FOR TESTING
CREATE SEQUENCE MY_FIRST_SEQ
START WITH 5
INCREMENT BY -3
MAXVALUE 5
MINVALUE 0
NOCYCLE;

-- 4 ===================================================
SELECT MY_FIRST_SEQ.NEXTVAL
FROM DUAL;
SELECT MY_FIRST_SEQ.NEXTVAL
FROM DUAL;
SELECT MY_FIRST_SEQ.NEXTVAL
FROM DUAL;
--THE LAST SELECT STATEMENT WILL RETURN AN ERROR BECAUSE THE MINVALUE HAS BEEN REACHED.

-- 5 ===================================================
ALTER SEQUENCE MY_FIRST_SEQ
MINVALUE -1000;
--VALIDATION--
SELECT *
FROM all_sequences
WHERE SEQUENCE_NAME = 'MY_FIRST_SEQ';
-- 6 ===================================================
DROP TABLE email_log
    CASCADE CONSTRAINTS; -- CLEAR TABLE FOR TESTING
CREATE TABLE email_log
(emailid NUMBER GENERATED AS IDENTITY PRIMARY KEY,
emaildate date,
"customer#" number);
INSERT INTO email_log (emaildate, "customer#") 
VALUES (SYSDATE, 1007);
INSERT INTO email_log (emailid, emaildate, "customer#") 
VALUES (DEFAULT, SYSDATE, 1008);
INSERT INTO email_log (emailid, emaildate, "customer#") 
VALUES (25, SYSDATE, 1009);
--VALIDATION--
SELECT * 
FROM email_log;
-- 7 ===================================================
CREATE SYNONYM NUMGEN
FOR MY_FIRST_SEQ;
--VALIDATION--
SELECT *
FROM all_sequences
WHERE SEQUENCE_NAME = 'MY_FIRST_SEQ';
-- 8 ===================================================
SELECT NUMGEN.CURRVAL
FROM DUAL;
--VALIDATION--
SELECT *
FROM all_sequences
WHERE SEQUENCE_NAME = 'NUMGEN';
--==========================================================
DROP SYNONYM NUMGEN;
--VALIDATION--
SELECT *
FROM all_sequences
WHERE SEQUENCE_NAME = 'MY_FIRST_SEQ';
-- 10 ==================================================
CREATE INDEX idx_customer_lastname 
ON CUSTOMERS (LastName);
--VALIDATION--
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
--========================================================
DROP INDEX idx_customer_lastname;
--VALIDATION--
SELECT *
FROM user_indexes
WHERE table_name = 'CUSTOMERS';
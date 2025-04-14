--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 4 Assignment
--======================================================
DROP TABLE STORE_REPS
    CASCADE CONSTRAINTS;
DROP TABLE BOOK_STORES
    CASCADE CONSTRAINTS;
DROP TABLE REP_CONTRACTS
    CASCADE CONSTRAINTS;

--Problem 1======================================================

CREATE TABLE STORE_REPS
(rep_ID NUMBER(5),
last VARCHAR2(15),
first VARCHAR2(10),
comm CHAR(1) DEFAULT 'Y',
    CONSTRAINT store_reps_rep_ID_pk PRIMARY KEY (rep_ID));

DESC STORE_REPS

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';
--Problem 2======================================================


ALTER TABLE STORE_REPS
MODIFY last NOT NULL;

ALTER TABLE STORE_REPS
MODIFY first NOT NULL;

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'STORE_REPS';

--Problem 3======================================================
ALTER TABLE STORE_REPS
ADD CONSTRAINT store_reps_comm_com CHECK (comm = 'Y' OR comm = 'N');

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'STORE_REPS';
--Problem 4======================================================
ALTER TABLE STORE_REPS
ADD (Base_salary NUMBER(7,2));
ALTER TABLE STORE_REPS
ADD CONSTRAINT store_reps_Base_salary_ck CHECK (Base_salary >0);

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'STORE_REPS';
--Problem 5======================================================
CREATE TABLE BOOK_STORES
(Store_ID NUMBER(8),
Name VARCHAR2(30) NOT NULL ,
Contact VARCHAR2(30),
Rep_ID NUMBER(5),
CONSTRAINT BOOK_STORES_Store_ID_pk PRIMARY KEY(Store_ID),
CONSTRAINT BOOK_STORES_name_uk UNIQUE (name));

DESC BOOK_STORES

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'BOOK_STORES';

--Problem 6======================================================
ALTER TABLE BOOK_STORES
ADD CONSTRAINT BOOK_STORES_REP_ID_fk FOREIGN KEY (Rep_ID)
    REFERENCES STORE_REPS (rep_ID);

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'BOOK_STORES';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'BOOK_STORES';
--Problem 7======================================================
ALTER TABLE BOOK_STORES
DROP CONSTRAINT BOOK_STORES_REP_ID_fk;

ALTER TABLE BOOK_STORES
ADD CONSTRAINT BOOK_STORES_REP_ID_fk FOREIGN KEY (Rep_ID)
    REFERENCES STORE_REPS (rep_ID) ON DELETE CASCADE;

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'BOOK_STORES';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'BOOK_STORES';
--Problem 8======================================================
CREATE TABLE REP_CONTRACTS
(Store_ID NUMBER(8),
Name NUMBER(5),
Quarter CHAR(3),
Rep_ID NUMBER(5),
CONSTRAINT REP_CONTRACTS_Rep_ID_Store_ID_Quarter_pk PRIMARY KEY (Rep_ID, Store_ID, Quarter),
CONSTRAINT REP_CONTRACTS_Rep_ID_fk FOREIGN KEY (Rep_ID) REFERENCES STORE_REPS(rep_ID) ON DELETE CASCADE,
CONSTRAINT REP_CONTRACTS_Store_ID_fk FOREIGN KEY (Store_ID) REFERENCES BOOK_STORES(Store_ID) ON DELETE CASCADE);

DESC REP_CONTRACTS

SELECT constraint_name, constraint_type, search_condition
FROM user_constraints
WHERE table_name = 'REP_CONTRACTS';

--Problem 9======================================================
SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';

--Problem 10=====================================================
ALTER TABLE STORE_REPS
DISABLE CONSTRAINT store_reps_Base_salary_ck;

ALTER TABLE STORE_REPS
ENABLE CONSTRAINT store_reps_Base_salary_ck;

SELECT constraint_name, constraint_type, search_condition, r_constraint_name
FROM user_constraints
WHERE table_name = 'STORE_REPS';

SELECT CONSTRAINT_NAME,TABLE_NAME ,COLUMN_NAME
FROM user_cons_columns
WHERE table_name = 'STORE_REPS';


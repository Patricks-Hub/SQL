--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 7 Assignment
--======================================================


--======================================================
-- Problem 1
--======================================================
CREATE USER pfoy
IDENTIFIED BY password;

--======================================================
-- Problem 3
--======================================================

GRANT CREATE SESSION, CREATE TABLE, ALTER Table 
    TO pfoy;

--======================================================
-- Problem 4
--======================================================
--NOTE on #4:   Write different GRANT commands for the two tables; ORDERS and ORDERITEMS.
CREATE ROLE CUSTOMERREP

GRANT INSERT, DELETE
    ON ORDERS
    TO CUSTOMERREP;

GRANT INSERT, DELETE
    ON ORDERITEMS
    TO CUSTOMERREP;

--======================================================
-- Problem 6
--======================================================
--NOTE on #6:  You don't have the appropriate privileges to create a new account, So skip the first sentence about logging into the new account from problem #1.  Instead, write the command to determine the privileges currently available in your current session of your ORAxxx login you are using for the course.  

SELECT *
    FROM USER_SYS_PRIVS;

--======================================================
-- Problem 9
--======================================================

DROP ROLE CUSTOMERREP;
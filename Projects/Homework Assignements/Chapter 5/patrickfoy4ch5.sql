--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 5 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_5.sql";
--======================================================


--1======================================================
INSERT INTO ORDERS (ORDER#,CUSTOMER#,ORDERDATE)
VALUES (1021,1009,'20-07-09');
--vERIFICATION==========================================
Select * 
FROM ORDERS
WHERE ORDER# = '1021';


--2======================================================
UPDATE ORDERS
SET SHIPZIP = '33222'
WHERE ORDER# = '1017';
--vERIFICATION==========================================
Select * 
FROM ORDERS
WHERE ORDER# = '1017';


--3======================================================
COMMIT; --Verified in the output of the commit command
--======================================================


--6=====================================================
--PRE-vERIFICATION======================================
SELECT ISBN,COST
FROM BOOkS;
--======================================================
UPDATE BOOKS
SET COST = '&COST'
WHERE ISBN = '&ISBN';
--vERIFICATION==========================================
SELECT ISBN,COST
FROM BOOkS;

--9======================================================
--PRE-vERIFICATION======================================
Select * 
FROM ORDERS
WHERE ORDER# = '1005';

Select * 
FROM ORDERITEMS
WHERE ORDER# = '1005';
--======================================================
DELETE FROM ORDERITEMS
WHERE ORDER# = '1005';

DELETE FROM ORDERS
WHERE ORDER# = '1005';
--vERIFICATION==========================================
Select * 
FROM ORDERS;

Select * 
FROM ORDERITEMS;


--10======================================================
ROLLBACK;
--vERIFICATION==========================================
Select * 
FROM ORDERS
WHERE ORDER# = '1005';

Select * 
FROM ORDERITEMS
WHERE ORDER# = '1005';
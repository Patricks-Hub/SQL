--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 8 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
--Note:  The path will be different on your computer
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_8.sql";
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_9.sql";

--======================================================
-- Problem 1
--======================================================
SELECT 
b.TITLE, 
p.CONTACT|| ' ' || p.PHONE AS "Publisher Contact"
FROM 
BOOKS b
JOIN 
PUBLISHER p ON b.PUBID = p.PUBID;

--======================================================
-- Problem 2
--======================================================
SELECT 
    o.ORDER# AS "Order Number", 
    o.ORDERDATE AS "Ordered ",
    c.FIRSTNAME|| ' ' || c.LASTNAME AS "Customer Name"
From 
    ORDERS o
JOIN 
    CUSTOMERS c ON o.CUSTOMER# = c.CUSTOMER#
Where 
    o.SHIPDATE IS NULL
ORDER BY 
    o.ORDERDATE;

--======================================================
-- Problem 4
--======================================================
SELECT DISTINCT 
    b.title AS "Titles Purchased", 
    c.FIRSTNAME|| ' ' || c.LASTNAME AS "Customer Name"
From 
    CUSTOMERS c
Join 
    ORDERS o ON c.CUSTOMER# = o.CUSTOMER#
Join 
    ORDERITEMS oi ON o.ORDER# = oi.ORDER#
Join 
    BOOKS b ON oi.ISBN = b.ISBN
Where 
    c.FIRSTNAME = 'JAKE' AND c.LASTNAME = 'LUCAS';

--======================================================
-- Problem 10
--======================================================

SELECT 
    e.FNAME || ' ' || e.LNAME AS "EMPLOYEE", 
    e.JOB AS "Job Title", 
    m.FNAME || ' ' || m.LNAME AS "MANAGER"
fROM 
    EMPLOYEES e
LEFT JOIN 
    EMPLOYEES m ON e.MGR = m.EMPNO
ORDER BY 
    m.FNAME, m.LNAME;
--======================================================
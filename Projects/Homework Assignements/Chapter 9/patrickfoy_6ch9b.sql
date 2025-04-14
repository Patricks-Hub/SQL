--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 8 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
--Note:  The path will be different on your computer
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_8.sql";
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_9.sql";


DESCRIBE CUSTOMERS;

DESCRIBE BOOKS;

DESCRIBE PUBLISHER;

DESCRIBE ORDERS;

DESCRIBE ORDERITEMS;

DESCRIBE EMPLOYEES;

DESCRIBE promotion;

--======================================================
-- Problem 3
--======================================================
SELECT c.FIRSTNAME|| ' ' || c.LASTNAME AS "Customer Name"
FROM
    CUSTOMERS c,
    ORDERS o,
    ORDERITEMS oi,
    BOOKS b
WHERE
    c.CUSTOMER# = o.CUSTOMER#
    AND o.ORDER# = oi.ORDER#
    AND oi.ISBN = b.ISBN
    AND c.STATE = 'FL'
    AND b.CATEGORY LIKE 'COMP%';
--======================================================
-- Problem 7
--======================================================
SELECT
    c.FIRSTNAME || ' ' || c.LASTNAME AS "Customer Name",
    p.GIFT AS "Gift Type",
    b.TITLE AS "Book Title",
    oi.PAIDEACH AS "Paid Each",
    oi.ORDER# AS "Order#"
FROM
    BOOKS b,
    PROMOTION p,
    CUSTOMERS c,
    ORDERITEMS oi,
    ORDERS o
WHERE
    b.TITLE = 'SHORTEST POEMS'
    AND oi.ISBN = b.ISBN
    AND oi.ORDER# = o.ORDER#
    AND o.CUSTOMER# = c.CUSTOMER#
    AND oi.PAIDEACH >= p.MINRETAIL
    AND oi.PAIDEACH <= p.MAXRETAIL;
    
--======================================================
-- Problem 9
--======================================================

SELECT
    b.ISBN,
    b.TITLE,
    oi.ORDER# AS OrderNumber,
    c.STATE AS CustomerState
FROM
    BOOKS b,
    ORDERITEMS oi,
    ORDERS o,
    CUSTOMERS c
WHERE
    b.ISBN = oi.ISBN(+)
AND
    oi.ORDER# = o.ORDER#(+)
AND
    o.CUSTOMER# = c.CUSTOMER#(+)
ORDER BY
    b.TITLE;
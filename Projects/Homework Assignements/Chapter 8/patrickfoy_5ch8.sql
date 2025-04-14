--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 8 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
--Note:  The path will be different on your computer
@ "C:\College Work\CIS332 - Database and SQL I\Student Build Files\JLDB_Build_8.sql";

--In your own session of SQL Developer, use SET commands to format the output / results
--Note:  You need to include the path of where you want the spooled (output) file to go
SPOOL "C:\College Work\CIS332 - Database and SQL I\Chapter 8\Ch08_output.txt"

--======================================================
-- Problem 1
--======================================================
SELECT firstname, lastname, state
  FROM customers
  WHERE state = 'NJ';

--======================================================
-- Problem 2
--======================================================
SELECT order#, ORDERDATE
  FROM orders
  WHERE ORDERDATE > '01-APR-2009';

--======================================================
-- Problem 3
--======================================================
SELECT title, category
  FROM books
  WHERE category != 'FITNESS';

--======================================================
-- Problem 4
--======================================================
SELECT customer#, lastname, STATE
  FROM customers
  WHERE state IN ('NJ', 'GA')
  ORDER BY lastname ASC;

SELECT customer#, lastname, STATE
  FROM customers
  WHERE state = 'NJ' OR state = 'GA'
  ORDER BY lastname ASC;

--======================================================
-- Problem 5
--======================================================
SELECT order#, ORDERDATE
  FROM orders
  WHERE ORDERDATE <= '01-APR-2009';

SELECT order#, ORDERDATE
  FROM orders
  WHERE ORDERDATE < '02-APR-2009';


--======================================================
-- Problem 6
--======================================================
SELECT lname, fname
From Author
WHERE lname LIKE '%IN%'
ORDER BY lname, fname;

--======================================================
-- Problem 7
--======================================================
SELECT lastname, REFERRED
  FROM customers
  WHERE REFERRED IS NOT NULL;

--======================================================
-- Problem 8
--======================================================
SELECT title, category
  FROM books
  WHERE category LIKE 'C%' AND category != 'COMPUTER';

SELECT title, category
  FROM books
  WHERE category <='Ch' AND category != 'BUSINESS' AND category != 'COMPUTER';

SELECT title, category
  FROM books
  WHERE category IN ('CHILDREN', 'COOKING');

--======================================================
-- Problem 9
--======================================================
SELECT isbn, title
  FROM books
  WHERE title LIKE '_A_N%'
  ORDER BY title DESC;

--======================================================
-- Problem 10
--======================================================
SELECT title, PUBDATE
  FROM books
  WHERE PUBDATE BETWEEN '01-JAN-2005' AND '31-DEC-2005' AND category = 'COMPUTER';

SELECT title, PUBDATE
  FROM books
  WHERE PUBDATE >= '01-JAN-2005' AND PUBDATE <= '31-DEC-2005' AND category = 'COMPUTER';

SELECT title, PUBDATE
  FROM books
  WHERE PUBDATE LIKE '%05' AND category = 'COMPUTER';


SPOOL off;
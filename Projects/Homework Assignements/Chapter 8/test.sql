--====================================================== 
--Patrick Foy
--CIS332: Database and SQL
--CHAPTER 8 Assignment
--======================================================
--Clean-up & Preparation for Running the Script--
--Note:  The path will be different on your computer
@ "C:\College Work\CIS332 - Database and SQL I\Student Build FilesJLDB_Build_8.sql";

--In your own session of SQL Developer, use SET commands to format the output / results
--Note:  You need to include the path of where you want the spooled (output) file to go
SPOOL "C:\College Work\CIS332 - Database and SQL I\Chapter 8\test_output.txt"

DESCRIBE customers
DESCRIBE orders 
Describe books
DESCRIBE Author

SELECT title, PUBDATE, CATEGORY
  FROM books
  WHERE PUBDATE BETWEEN '01-JAN-2005' AND '31-DEC-2005';



SPOOL off;
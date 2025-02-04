/*
Patrick Foy
CIS332
CH2 Homework
*/

SELECT *
FROM books;

SELECT title 
FROM books;

SELECT title, pubdate AS "Publication Date" 
FROM books;

SELECT CUSTOMER#, city, state
FROM CUSTOMERS;

SELECT name, contact AS "Contact Person", phone
FROM PUBLISHER;

SELECT DISTINCT CATEGORY 
FROM BOOKS;

SELECT DISTINCT customer#
FROM ORDERS;

SELECT DISTINCT Category, Title 
FROM BOOKS;

SELECT LNAME || ', ' || FNAME "Authors"
FROM AUTHOR;

SELECT ORDER#, ITEM#, ISBN, QUANTITY * PAIDEACH "Item Total"
FROM ORDERITEMS;
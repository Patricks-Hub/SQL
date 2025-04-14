-- Retrieve a list of all orders, including the customer's city and the product_name for each order.
SELECT o.order_id AS "Order Number", c.city AS "Customer City", p.product_name AS "Product Name"
FROM online_retail_store.orders o
JOIN online_retail_store.customers c ON o.customer_id = c.customer_id
JOIN online_retail_store.products p ON o.product_id = p.product_id;

-- Find all orders where the rating in the Reviews table is greater than 4, and include the customer_id, product_name, and order_date
SELECT c.customer_name AS "Customer Name", c.customer_id AS "Customer Number", p.product_name AS "Product", o.order_date AS "Order Date"
FROM online_retail_store.customers c
JOIN online_retail_store.orders o ON c.customer_id = o.customer_id
JOIN online_retail_store.products p ON o.product_id = p.product_id
JOIN online_retail_store.reviews r ON p.product_id = r.product_id
WHERE r.rating > 4;

-- Calculate the total revenue (total_amount) generated for each product (product_name).

SELECT p.product_name as "Product Name", SUM(o.total_amount) AS "Total Sales"
FROM online_retail_store.orders o
JOIN online_retail_store.products p ON o.product_id = p.product_id
GROUP BY p.product_name;

-- Retrieve a list of all customers who have placed an order, including their customer_id,
-- city, and the total number of orders they have placed.

SELECT c.customer_name AS "Customer Name", c.customer_id AS "Customer Number", c.city AS "Customer City", COUNT(o.order_id) AS "Total Orders"
FROM online_retail_store.customers c
JOIN online_retail_store.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.city;

-- Find all products that have never been reviewed. Include the product_id and product_name.

SELECT p.product_id As "Product ID", p.product_name AS "Product Name", r.rating AS "Product Rating"
FROM online_retail_store.products p
JOIN online_retail_store.reviews r ON p.product_id = r.product_id
WHERE r.rating = "0";
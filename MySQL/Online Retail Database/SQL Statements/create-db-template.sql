USE online_retail_store;

DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- First, create the Customers table (no foreign keys)
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(2) Default "NA",
    age TINYINT,
    city VARCHAR(40) Default "NA",
    customer_name VARCHAR(80) Default "NA"
);

-- Next, create the Products table (no foreign keys)
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Now create the Orders table (foreign keys to Customers and Products)
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity SMALLINT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2) GENERATED ALWAYS AS (price * quantity) STORED,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
) ENGINE=InnoDB;

-- Finally, create the Reviews table (foreign keys to Customers and Products)
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating DECIMAL(2,1) Default Null,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

# 🛒 Online Retail Store Database

A MySQL database for synthetic retail transactions, enriched with customer demographics and formatted via a Python ETL tool.

---

## 🚀 Quick Setup

### 1. Import the Database
```bash
mysql -u root -ppassword123! < RetailStore.sql
```

### 2. Access the Database
```bash
mysql -u root -ppassword123! online_retail_store
```

---

## 📖 Overview

### **Base Dataset**
- **Source**: Synthetic Online Retail Data (raw CSV)
- **Enhanced Data**:
  - Split into normalized CSVs:
    - `customers.csv` (added names)
    - `products.csv`
    - orders.csv
    - reviews.csv
  - Generated synthetic foreign keys for relationships.

---

## 📂 File Structure

```
Online Retail Database/
├── Raw Data/
│   ├── synthetic_online_retail_data.csv
│   ├── customer.csv
│   ├── product.csv
│   ├── orders.csv
│   ├── reviews.csv
├── SQL Data Formatter Python/
│   ├── formatsql.py
├── SQL Statements/
│   ├── create-db-template.sql
│   ├── Join Statements.sql
├── README.txt
├── RetailStore.sql
```

---

## 🗃️ Database Schema

### **1. Customers Table**
Stores customer demographic information.

| Column Name   | Data Type   | Description                       |
|---------------|-------------|-----------------------------------|
| `customer_id` | INT         | Primary key, unique customer ID. |
| `gender`      | VARCHAR(2)  | Gender of the customer.          |
| `age`         | TINYINT     | Age of the customer.             |
| `city`        | VARCHAR(40) | City where the customer resides. |
| `customer_name` | VARCHAR(80) | Full name of the customer.       |

---

### **2. Products Table**
Stores product details.

| Column Name   | Data Type   | Description                       |
|---------------|-------------|-----------------------------------|
| `product_id`  | INT         | Primary key, unique product ID.  |
| `product_name`| VARCHAR(50) | Name of the product.             |
| `category`    | VARCHAR(50) | Category of the product.         |
| `price`       | DECIMAL(10,2) | Price of the product.           |

---

### **3. Orders Table**
Stores order details, linking customers and products.

| Column Name   | Data Type   | Description                       |
|---------------|-------------|-----------------------------------|
| `order_id`    | INT         | Primary key, unique order ID.    |
| `customer_id` | INT         | Foreign key, references `customers.customer_id`. |
| `product_id`  | INT         | Foreign key, references `products.product_id`.   |
| `order_date`  | DATE        | Date of the order.               |
| `quantity`    | SMALLINT    | Quantity of the product ordered. |
| `price`       | DECIMAL(10,2) | Price of the product at the time of order. |
| `total_amount`| DECIMAL(10,2) | Calculated as `price * quantity`. |

---

### **4. Reviews Table**
Stores customer reviews for products.

| Column Name   | Data Type   | Description                       |
|---------------|-------------|-----------------------------------|
| `review_id`   | INT         | Primary key, unique review ID.   |
| `product_id`  | INT         | Foreign key, references `products.product_id`.   |
| `customer_id` | INT         | Foreign key, references `customers.customer_id`. |
| `rating`      | DECIMAL(2,1)| Rating given by the customer.    |
| `order_date`  | DATE        | Date of the order being reviewed.|

---

## 🔧 Python ETL Formatter

### **Script: formatsql.py**
This Python script processes raw CSV files into SQL-compatible format for bulk insertion into the database.

```python
import os

def format_customer_data(input_file, output_file):
    """
    Reads csv data from input_file, formats each line, and writes to output_file
    Format: (**Data From CSV**),
    Removes trailing comma from the last line.
    """
    # Create output directory if it doesn't exist
    output_dir = os.path.dirname(output_file)
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        
    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        # Skip header if exists
        header = infile.readline()
        
        # Read all lines into a list
        lines = [line.strip() for line in infile if line.strip()]
        
        for i, line in enumerate(lines):
            # Add a comma to all lines except the last one
            if i < len(lines) - 1:
                formatted_line = f"({line}),\n"
            else:
                formatted_line = f"({line})\n"  # No comma for the last line
            outfile.write(formatted_line)
    
    print(f"Successfully formatted data. Output saved to: {output_file}")

# Update the input and output file paths as needed
input_path = r'C:\College Work\Personal Projects\CSV Data\Raw Data\customer.csv'  # Replace with your actual input file path
output_path = r'C:\College Work\Personal Projects\CSV Data\SQL Data\customer.sql'  # Replace with your actual output file path

format_customer_data(input_path, output_path)
```

---

## 📜 SQL Scripts

### **1. Create Database and Tables**
File: create-db-template.sql

```sql
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
```

---

### **2. Join Statements**
File: `Join Statements.sql`

```sql
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
```

---

## 📜 Additional Notes

- **Data Sources**: Synthetic data generated for educational purposes.
- **Python ETL**: Automates the formatting of raw CSV data into SQL-compatible format.
- **SQL Queries**: Includes examples for joins, aggregations, and filtering.

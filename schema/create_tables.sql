-- ============================================================
-- PROJECT: E-Commerce Sales Analysis
-- File: schema/create_tables.sql
-- Description: Creates all tables for the e-commerce database
-- Author: Supritha
-- ============================================================

-- Drop tables if they exist (for clean re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS suppliers;

-- ------------------------------------------------------------
-- Table 1: Suppliers
-- ------------------------------------------------------------
CREATE TABLE suppliers (
    supplier_id     INT PRIMARY KEY,
    supplier_name   VARCHAR(100) NOT NULL,
    city            VARCHAR(50),
    contact_email   VARCHAR(100)
);

-- ------------------------------------------------------------
-- Table 2: Products
-- ------------------------------------------------------------
CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(150) NOT NULL,
    category        VARCHAR(50),
    price           DECIMAL(10, 2),
    stock_quantity  INT,
    supplier_id     INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- ------------------------------------------------------------
-- Table 3: Customers
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id         INT PRIMARY KEY,
    full_name           VARCHAR(100) NOT NULL,
    email               VARCHAR(100),
    city                VARCHAR(50),
    state               VARCHAR(50),
    registration_date   DATE,
    phone               VARCHAR(15)
);

-- ------------------------------------------------------------
-- Table 4: Orders
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    order_date      DATE,
    status          VARCHAR(20),   -- 'Delivered', 'Cancelled', 'Pending', 'Returned'
    payment_method  VARCHAR(20),   -- 'UPI', 'COD', 'Card', 'Netbanking'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ------------------------------------------------------------
-- Table 5: Order Items
-- ------------------------------------------------------------
CREATE TABLE order_items (
    item_id         INT PRIMARY KEY,
    order_id        INT,
    product_id      INT,
    quantity        INT,
    unit_price      DECIMAL(10, 2),
    discount_pct    DECIMAL(5, 2) DEFAULT 0,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

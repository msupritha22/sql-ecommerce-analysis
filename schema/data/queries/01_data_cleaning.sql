-- ============================================================
-- PROJECT: E-Commerce Sales Analysis
-- File: queries/01_data_cleaning.sql
-- Description: Identifies and handles dirty/missing data
-- ============================================================

-- ------------------------------------------------------------
-- 1. Find customers with missing email
-- ------------------------------------------------------------
SELECT 
    customer_id,
    full_name,
    city,
    registration_date
FROM customers
WHERE email IS NULL;

-- ------------------------------------------------------------
-- 2. Find customers with missing phone number
-- ------------------------------------------------------------
SELECT 
    customer_id,
    full_name,
    city
FROM customers
WHERE phone IS NULL;

-- ------------------------------------------------------------
-- 3. Find orders with NULL customer_id (orphan orders)
-- ------------------------------------------------------------
SELECT 
    order_id,
    order_date,
    status,
    payment_method
FROM orders
WHERE customer_id IS NULL;

-- ------------------------------------------------------------
-- 4. Find orders with invalid/unexpected status values
-- ------------------------------------------------------------
SELECT 
    order_id,
    customer_id,
    order_date,
    status
FROM orders
WHERE status NOT IN ('Delivered', 'Cancelled', 'Pending', 'Returned');

-- ------------------------------------------------------------
-- 5. Check for duplicate orders (same customer, same date)
-- ------------------------------------------------------------
SELECT 
    customer_id,
    order_date,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY customer_id, order_date
HAVING COUNT(*) > 1;

-- ------------------------------------------------------------
-- 6. Find order items with zero or negative quantity/price
-- ------------------------------------------------------------
SELECT 
    item_id,
    order_id,
    product_id,
    quantity,
    unit_price
FROM order_items
WHERE quantity <= 0 OR unit_price <= 0;

-- ------------------------------------------------------------
-- 7. Verify referential integrity: order items with no matching order
-- ------------------------------------------------------------
SELECT 
    oi.item_id,
    oi.order_id
FROM order_items oi
LEFT JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- ------------------------------------------------------------
-- 8. Products with NULL category or zero/negative price
-- ------------------------------------------------------------
SELECT 
    product_id,
    product_name,
    category,
    price
FROM products
WHERE category IS NULL OR price <= 0;

-- ------------------------------------------------------------
-- 9. Summary: Data Quality Report
-- ------------------------------------------------------------
SELECT 'Customers with missing email'   AS issue, COUNT(*) AS count FROM customers WHERE email IS NULL
UNION ALL
SELECT 'Customers with missing phone',            COUNT(*) FROM customers WHERE phone IS NULL
UNION ALL
SELECT 'Orders with missing customer_id',         COUNT(*) FROM orders WHERE customer_id IS NULL
UNION ALL
SELECT 'Orders with invalid status',              COUNT(*) FROM orders WHERE status NOT IN ('Delivered','Cancelled','Pending','Returned')
UNION ALL
SELECT 'Products with missing category',          COUNT(*) FROM products WHERE category IS NULL;

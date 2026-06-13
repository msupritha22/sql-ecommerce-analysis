-- ============================================================
-- PROJECT: E-Commerce Sales Analysis
-- File: queries/03_customer_insights.sql
-- Description: Customer segmentation and behavior analysis
-- ============================================================

-- ------------------------------------------------------------
-- 1. Loyal customers — placed 3 or more orders
-- ------------------------------------------------------------
SELECT 
    c.customer_id,
    c.full_name,
    c.city,
    COUNT(o.order_id)   AS total_orders,
    MIN(o.order_date)   AS first_order,
    MAX(o.order_date)   AS latest_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.full_name, c.city
HAVING COUNT(o.order_id) >= 3
ORDER BY total_orders DESC;

-- ------------------------------------------------------------
-- 2. High-value customers — top 5 by lifetime spend
-- ------------------------------------------------------------
SELECT 
    c.customer_id,
    c.full_name,
    c.city,
    COUNT(DISTINCT o.order_id)                                          AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS lifetime_spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY lifetime_spend DESC
LIMIT 5;

-- ------------------------------------------------------------
-- 3. Customers at churn risk — registered but never ordered
-- ------------------------------------------------------------
SELECT 
    c.customer_id,
    c.full_name,
    c.email,
    c.city,
    c.registration_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- ------------------------------------------------------------
-- 4. Customer segmentation using CASE
--    Segment: High (>=3 orders), Medium (2 orders), Low (1 order)
-- ------------------------------------------------------------
SELECT 
    c.customer_id,
    c.full_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) >= 3 THEN 'High Value'
        WHEN COUNT(o.order_id) = 2  THEN 'Medium Value'
        WHEN COUNT(o.order_id) = 1  THEN 'Low Value'
        ELSE 'No Orders'
    END AS customer_segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.status = 'Delivered'
GROUP BY c.customer_id, c.full_name, c.city
ORDER BY total_orders DESC;

-- ------------------------------------------------------------
-- 5. State-wise customer distribution
-- ------------------------------------------------------------
SELECT 
    state,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state
ORDER BY total_customers DESC;

-- ------------------------------------------------------------
-- 6. Customers who bought from multiple categories (cross-category buyers)
-- ------------------------------------------------------------
SELECT 
    c.customer_id,
    c.full_name,
    COUNT(DISTINCT p.category) AS categories_purchased
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_id, c.full_name
HAVING COUNT(DISTINCT p.category) > 1
ORDER BY categories_purchased DESC;

-- ------------------------------------------------------------
-- 7. Top product per customer (using subquery)
-- ------------------------------------------------------------
SELECT 
    c.full_name,
    p.product_name,
    total_qty
FROM (
    SELECT 
        o.customer_id,
        oi.product_id,
        SUM(oi.quantity) AS total_qty,
        RANK() OVER (PARTITION BY o.customer_id ORDER BY SUM(oi.quantity) DESC) AS rnk
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.status = 'Delivered'
    GROUP BY o.customer_id, oi.product_id
) ranked
JOIN customers c ON ranked.customer_id = c.customer_id
JOIN products p ON ranked.product_id = p.product_id
WHERE ranked.rnk = 1
ORDER BY c.full_name;

-- ============================================================
-- PROJECT: E-Commerce Sales Analysis
-- File: queries/02_sales_analysis.sql
-- Description: Business insights from sales and product data
-- ============================================================

-- ------------------------------------------------------------
-- 1. Total revenue by product category
-- ------------------------------------------------------------
SELECT 
    p.category,
    COUNT(DISTINCT oi.order_id)                                         AS total_orders,
    SUM(oi.quantity)                                                    AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- ------------------------------------------------------------
-- 2. Top 5 best-selling products by revenue
-- ------------------------------------------------------------
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity)                                                    AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC
LIMIT 5;

-- ------------------------------------------------------------
-- 3. Monthly revenue trend
-- ------------------------------------------------------------
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m')                                  AS month,
    COUNT(DISTINCT o.order_id)                                          AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- ------------------------------------------------------------
-- 4. Revenue by city (top 10 cities)
-- ------------------------------------------------------------
SELECT 
    c.city,
    c.state,
    COUNT(DISTINCT o.order_id)                                          AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY c.city, c.state
ORDER BY total_revenue DESC
LIMIT 10;

-- ------------------------------------------------------------
-- 5. Most preferred payment method
-- ------------------------------------------------------------
SELECT 
    payment_method,
    COUNT(*)                        AS total_orders,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders WHERE status = 'Delivered'), 2) AS percentage
FROM orders
WHERE status = 'Delivered'
GROUP BY payment_method
ORDER BY total_orders DESC;

-- ------------------------------------------------------------
-- 6. Order cancellation and return rate by category
-- ------------------------------------------------------------
SELECT 
    p.category,
    COUNT(DISTINCT CASE WHEN o.status = 'Delivered' THEN o.order_id END)  AS delivered,
    COUNT(DISTINCT CASE WHEN o.status = 'Cancelled' THEN o.order_id END)  AS cancelled,
    COUNT(DISTINCT CASE WHEN o.status = 'Returned'  THEN o.order_id END)  AS returned,
    ROUND(
        COUNT(DISTINCT CASE WHEN o.status IN ('Cancelled','Returned') THEN o.order_id END) * 100.0
        / COUNT(DISTINCT o.order_id), 2
    ) AS cancellation_return_rate_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY cancellation_return_rate_pct DESC;

-- ------------------------------------------------------------
-- 7. Average Order Value (AOV) overall and by payment method
-- ------------------------------------------------------------
SELECT 
    o.payment_method,
    COUNT(DISTINCT o.order_id)  AS num_orders,
    ROUND(
        SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) / COUNT(DISTINCT o.order_id), 2
    ) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Delivered'
GROUP BY o.payment_method
ORDER BY avg_order_value DESC;

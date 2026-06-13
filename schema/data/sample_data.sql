-- ============================================================
-- PROJECT: E-Commerce Sales Analysis
-- File: data/sample_data.sql
-- Description: Sample INSERT statements with realistic Indian market data
-- Note: Includes intentional dirty data for cleaning exercises
-- ============================================================

-- ------------------------------------------------------------
-- Suppliers
-- ------------------------------------------------------------
INSERT INTO suppliers VALUES (1, 'TechZone Pvt Ltd', 'Bengaluru', 'techzone@supply.in');
INSERT INTO suppliers VALUES (2, 'FashionHub India', 'Mumbai', 'fashionhub@supply.in');
INSERT INTO suppliers VALUES (3, 'HomeGoods Co', 'Delhi', 'homegoods@supply.in');
INSERT INTO suppliers VALUES (4, 'SportsPro India', 'Pune', 'sportspro@supply.in');
INSERT INTO suppliers VALUES (5, 'BookWorld', 'Chennai', 'bookworld@supply.in');

-- ------------------------------------------------------------
-- Products
-- ------------------------------------------------------------
INSERT INTO products VALUES (101, 'Samsung 65" 4K TV', 'Electronics', 55999.00, 30, 1);
INSERT INTO products VALUES (102, 'Apple iPhone 14', 'Electronics', 79999.00, 50, 1);
INSERT INTO products VALUES (103, 'Wireless Earbuds', 'Electronics', 2999.00, 200, 1);
INSERT INTO products VALUES (104, 'Men Formal Shirt', 'Clothing', 899.00, 500, 2);
INSERT INTO products VALUES (105, 'Women Saree', 'Clothing', 1499.00, 300, 2);
INSERT INTO products VALUES (106, 'Running Shoes', 'Footwear', 2499.00, 150, 4);
INSERT INTO products VALUES (107, 'Yoga Mat', 'Sports', 799.00, 180, 4);
INSERT INTO products VALUES (108, 'Non-stick Cookware Set', 'Kitchen', 1799.00, 90, 3);
INSERT INTO products VALUES (109, 'Study Desk Lamp', 'Home Decor', 599.00, 250, 3);
INSERT INTO products VALUES (110, 'Python Programming Book', 'Books', 499.00, 400, 5);
INSERT INTO products VALUES (111, 'Data Science Handbook', 'Books', 699.00, 350, 5);
INSERT INTO products VALUES (112, 'Bluetooth Speaker', 'Electronics', 1999.00, 120, 1);

-- ------------------------------------------------------------
-- Customers (includes some nulls and dirty data for cleaning)
-- ------------------------------------------------------------
INSERT INTO customers VALUES (1001, 'Priya Sharma', 'priya.sharma@gmail.com', 'Bengaluru', 'Karnataka', '2023-01-15', '9876543210');
INSERT INTO customers VALUES (1002, 'Rahul Verma', 'rahul.verma@yahoo.com', 'Mumbai', 'Maharashtra', '2023-02-20', '9123456789');
INSERT INTO customers VALUES (1003, 'Anita Rao', 'anita.rao@gmail.com', 'Hyderabad', 'Telangana', '2023-03-10', NULL);
INSERT INTO customers VALUES (1004, 'Kiran Patel', 'kiran.patel@outlook.com', 'Ahmedabad', 'Gujarat', '2023-01-28', '9988776655');
INSERT INTO customers VALUES (1005, 'Deepa Nair', NULL, 'Kochi', 'Kerala', '2023-04-05', '9654321098');
INSERT INTO customers VALUES (1006, 'Suresh Kumar', 'suresh.kumar@gmail.com', 'Chennai', 'Tamil Nadu', '2023-05-12', '9001122334');
INSERT INTO customers VALUES (1007, 'Meena Joshi', 'meena.joshi@gmail.com', 'Pune', 'Maharashtra', '2023-06-01', '9777888999');
INSERT INTO customers VALUES (1008, 'Ajay Singh', 'ajay.singh@rediff.com', 'Delhi', 'Delhi', '2023-02-14', '9456123780');
INSERT INTO customers VALUES (1009, 'Neha Gupta', 'neha.gupta@gmail.com', 'Bengaluru', 'Karnataka', '2023-07-22', '9334455667');
INSERT INTO customers VALUES (1010, 'Ravi Bhat', 'ravi.bhat@gmail.com', 'Mangalore', 'Karnataka', '2023-08-08', '9213344556');
INSERT INTO customers VALUES (1011, 'Lakshmi Iyer', NULL, 'Chennai', 'Tamil Nadu', '2023-09-15', '9678901234');
INSERT INTO customers VALUES (1012, 'Vikram Reddy', 'vikram.reddy@gmail.com', 'Hyderabad', 'Telangana', '2023-10-03', '9876001234');
INSERT INTO customers VALUES (1013, 'Pooja Malhotra', 'pooja.malhotra@gmail.com', 'Delhi', 'Delhi', '2023-11-18', NULL);
INSERT INTO customers VALUES (1014, 'Arjun Das', 'arjun.das@gmail.com', 'Kolkata', 'West Bengal', '2023-12-01', '9512345678');
INSERT INTO customers VALUES (1015, 'Sneha Kulkarni', 'sneha.kulkarni@gmail.com', 'Pune', 'Maharashtra', '2024-01-09', '9234567890');

-- ------------------------------------------------------------
-- Orders (includes some dirty data: NULL customer_id, invalid status)
-- ------------------------------------------------------------
INSERT INTO orders VALUES (5001, 1001, '2024-01-10', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5002, 1002, '2024-01-15', 'Delivered', 'Card');
INSERT INTO orders VALUES (5003, 1003, '2024-01-20', 'Cancelled', 'COD');
INSERT INTO orders VALUES (5004, 1001, '2024-02-05', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5005, 1004, '2024-02-10', 'Pending', 'Netbanking');
INSERT INTO orders VALUES (5006, 1005, '2024-02-14', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5007, 1006, '2024-02-20', 'Returned', 'COD');
INSERT INTO orders VALUES (5008, 1007, '2024-03-01', 'Delivered', 'Card');
INSERT INTO orders VALUES (5009, 1008, '2024-03-05', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5010, 1009, '2024-03-12', 'Cancelled', 'COD');
INSERT INTO orders VALUES (5011, 1001, '2024-03-18', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5012, 1010, '2024-03-22', 'Delivered', 'Card');
INSERT INTO orders VALUES (5013, 1011, '2024-04-01', 'Pending', 'UPI');
INSERT INTO orders VALUES (5014, 1012, '2024-04-08', 'Delivered', 'Netbanking');
INSERT INTO orders VALUES (5015, 1002, '2024-04-15', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5016, 1013, '2024-04-20', 'Delivered', 'COD');
INSERT INTO orders VALUES (5017, NULL, '2024-05-01', 'Delivered', 'UPI');   -- dirty: missing customer
INSERT INTO orders VALUES (5018, 1014, '2024-05-05', 'Cancelled', 'Card');
INSERT INTO orders VALUES (5019, 1015, '2024-05-10', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5020, 1003, '2024-05-15', 'UNKNOWN', 'COD');     -- dirty: invalid status
INSERT INTO orders VALUES (5021, 1001, '2024-06-01', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5022, 1009, '2024-06-05', 'Delivered', 'Card');
INSERT INTO orders VALUES (5023, 1006, '2024-06-10', 'Delivered', 'UPI');
INSERT INTO orders VALUES (5024, 1002, '2024-06-18', 'Returned', 'COD');
INSERT INTO orders VALUES (5025, 1007, '2024-07-01', 'Delivered', 'UPI');

-- ------------------------------------------------------------
-- Order Items
-- ------------------------------------------------------------
INSERT INTO order_items VALUES (1, 5001, 102, 1, 79999.00, 5.00);
INSERT INTO order_items VALUES (2, 5001, 103, 2, 2999.00, 0.00);
INSERT INTO order_items VALUES (3, 5002, 104, 3, 899.00, 10.00);
INSERT INTO order_items VALUES (4, 5003, 106, 1, 2499.00, 0.00);
INSERT INTO order_items VALUES (5, 5004, 110, 2, 499.00, 0.00);
INSERT INTO order_items VALUES (6, 5004, 111, 1, 699.00, 0.00);
INSERT INTO order_items VALUES (7, 5005, 101, 1, 55999.00, 8.00);
INSERT INTO order_items VALUES (8, 5006, 105, 2, 1499.00, 5.00);
INSERT INTO order_items VALUES (9, 5007, 108, 1, 1799.00, 0.00);
INSERT INTO order_items VALUES (10, 5008, 112, 1, 1999.00, 0.00);
INSERT INTO order_items VALUES (11, 5009, 107, 2, 799.00, 0.00);
INSERT INTO order_items VALUES (12, 5010, 109, 3, 599.00, 0.00);
INSERT INTO order_items VALUES (13, 5011, 102, 1, 79999.00, 10.00);
INSERT INTO order_items VALUES (14, 5012, 103, 1, 2999.00, 0.00);
INSERT INTO order_items VALUES (15, 5012, 112, 1, 1999.00, 5.00);
INSERT INTO order_items VALUES (16, 5013, 110, 1, 499.00, 0.00);
INSERT INTO order_items VALUES (17, 5014, 101, 1, 55999.00, 12.00);
INSERT INTO order_items VALUES (18, 5015, 105, 1, 1499.00, 0.00);
INSERT INTO order_items VALUES (19, 5015, 104, 2, 899.00, 5.00);
INSERT INTO order_items VALUES (20, 5016, 106, 1, 2499.00, 10.00);
INSERT INTO order_items VALUES (21, 5018, 111, 2, 699.00, 0.00);
INSERT INTO order_items VALUES (22, 5019, 108, 1, 1799.00, 0.00);
INSERT INTO order_items VALUES (23, 5021, 103, 3, 2999.00, 0.00);
INSERT INTO order_items VALUES (24, 5022, 102, 1, 79999.00, 5.00);
INSERT INTO order_items VALUES (25, 5023, 107, 1, 799.00, 0.00);
INSERT INTO order_items VALUES (26, 5024, 112, 2, 1999.00, 0.00);
INSERT INTO order_items VALUES (27, 5025, 110, 1, 499.00, 0.00);
INSERT INTO order_items VALUES (28, 5025, 111, 1, 699.00, 0.00);

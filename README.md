# sql-ecommerce-analysis
#  E-Commerce Sales Analysis — SQL Project

## Overview
This project analyzes sales, customer behavior, and product performance for an e-commerce platform inspired by Indian market players like **Flipkart** and **Amazon India**. It demonstrates intermediate SQL skills including data cleaning, multi-table JOINs, aggregations, subqueries, and window functions.

---

##  Database Schema

The database consists of 5 related tables:

```
suppliers ──< products ──< order_items >── orders >── customers
```

| Table | Description |
|---|---|
| `customers` | Customer profile, city, registration date |
| `orders` | Order header — date, status, payment method |
| `order_items` | Line items per order — product, quantity, price |
| `products` | Product catalog with category and supplier |
| `suppliers` | Supplier information |

---

##  Project Structure

```
sql-ecommerce-analysis/
├── README.md
├── schema/
│   └── create_tables.sql        ← Table definitions with FK constraints
├── data/
│   └── sample_data.sql          ← Realistic sample data (incl. dirty records)
├── queries/
│   ├── 01_data_cleaning.sql     ← Identifying nulls, invalid values, duplicates
│   ├── 02_sales_analysis.sql    ← Revenue, trends, payment analysis
│   └── 03_customer_insights.sql ← Segmentation, loyalty, churn analysis
└── insights/
    └── summary.md               ← Key findings and business recommendations
```

---

##  SQL Concepts Demonstrated

| Concept | Where Used |
|---|---|
| `JOIN` (INNER, LEFT) | All query files |
| `GROUP BY` + aggregates | 02_sales_analysis, 03_customer_insights |
| `HAVING` | 03_customer_insights — loyal customers |
| Subqueries | 03_customer_insights — top product per customer |
| `CASE` statements | 03_customer_insights — customer segmentation |
| Window function (`RANK`) | 03_customer_insights — top product ranking |
| `UNION ALL` | 01_data_cleaning — data quality report |
| `DATE_FORMAT` | 02_sales_analysis — monthly trend |
| NULL handling | 01_data_cleaning, 03_customer_insights |

---

##  Business Questions Answered

### Sales Analysis
- Which product categories generate the most revenue?
- What is the monthly revenue trend?
- Which cities have the highest order volume?
- What is the most preferred payment method?
- Which products have the highest return/cancellation rates?

### Customer Insights
- Who are our most loyal (repeat) customers?
- Who are our highest lifetime-value customers?
- Which customers have never placed an order (churn risk)?
- How can customers be segmented by purchase behavior?
- Which customers buy across multiple categories?

### Data Quality
- Which records have NULL email/phone values?
- Are there any orphan orders (no customer linked)?
- Are there any invalid status values in the orders table?

---

##  How to Run

1. **Set up the database** (MySQL or PostgreSQL recommended):
   ```sql
   CREATE DATABASE ecommerce_analysis;
   USE ecommerce_analysis;
   ```

2. **Create tables:**
   ```bash
   mysql -u root -p ecommerce_analysis < schema/create_tables.sql
   ```

3. **Load sample data:**
   ```bash
   mysql -u root -p ecommerce_analysis < data/sample_data.sql
   ```

4. **Run queries** in your SQL client (MySQL Workbench, DBeaver, or VS Code SQLTools):
   - Start with `queries/01_data_cleaning.sql`
   - Then `queries/02_sales_analysis.sql`
   - Then `queries/03_customer_insights.sql`

---

##  Tools & Environment

- **Database:** MySQL 8.0+ / PostgreSQL 14+
- **SQL Client:** MySQL Workbench / DBeaver / VS Code SQLTools
- **Data:** Synthetic dataset inspired by Indian e-commerce market

---

## Key Findings

See [`insights/summary.md`](insights/summary.md) for the full findings and business recommendations.

**Highlights:**
- Electronics is the top revenue category
- UPI dominates as the preferred payment method
- 5 registered customers have never ordered — re-engagement opportunity
- 1 orphan order and 1 invalid status record found during data cleaning

---

##  Author

**Supritha**  
Aspiring Business Analyst | SQL • Power BI • Python  
 Bengaluru, India  
[GitHub Profile](https://github.com/your-username)

-

## 📌 Related Projects

- [Food Delivery Operations Analysis — SQL](https://github.com/your-username/sql-food-delivery-analysis)

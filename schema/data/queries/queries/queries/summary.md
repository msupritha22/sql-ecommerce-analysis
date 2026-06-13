# Key Business Insights — E-Commerce Sales Analysis

## Data Quality Findings
- **3 customers** have missing email addresses → recommend making email mandatory at registration
- **2 customers** have no phone number on file
- **1 order** (Order #5017) has no linked customer → possible guest checkout or data entry error
- **1 order** (Order #5020) has an invalid status `'UNKNOWN'` → needs correction in source system

## Sales Highlights
- **Electronics** is the top revenue-generating category, driven by high-ticket items like iPhones and TVs
- **UPI** is the most preferred payment method, accounting for the majority of delivered orders — aligns with India's digital payments trend
- Monthly revenue shows a steady upward trend from Jan to Jul 2024

## Customer Insights
- **Customer 1001 (Priya Sharma)** is the most loyal customer with 4 delivered orders
- **5 customers** registered but have never placed an order — prime targets for re-engagement campaigns
- **Bengaluru and Mumbai** generate the highest revenue among all cities
- Cross-category buyers represent an opportunity for bundle/upsell strategies

## Recommendations
1. Fix NULL customer_id in Order #5017 by implementing mandatory login at checkout
2. Launch email re-engagement campaigns for customers with no orders
3. Offer UPI-exclusive cashback offers to further boost this payment channel
4. Investigate high return/cancellation rate products and review their quality or listing descriptions

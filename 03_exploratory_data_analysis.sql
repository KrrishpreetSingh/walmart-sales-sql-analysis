-- =========================================
-- Exploratory Data Analysis (EDA)
-- Walmart Sales SQL Project
-- =========================================

-- =========================================
-- 1. Total Orders
-- =========================================

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM walmart_sales;

-- =========================================
-- 2. Total Customers
-- =========================================

SELECT COUNT(DISTINCT customer_name) AS total_customers
FROM walmart_sales;

-- =========================================
-- 3. Total Revenue
-- =========================================

SELECT ROUND(SUM(sales),2) AS total_revenue
FROM walmart_sales;

-- =========================================
-- 4. Total Profit
-- =========================================

SELECT ROUND(SUM(profit),2) AS total_profit
FROM walmart_sales;

-- =========================================
-- 5. Average Order Value
-- =========================================

SELECT ROUND(SUM(sales)/COUNT(DISTINCT order_id),2) AS average_order_value
FROM walmart_sales;

-- =========================================
-- 6. Number of Categories
-- =========================================

SELECT COUNT(DISTINCT category) AS total_categories
FROM walmart_sales;

-- =========================================
-- 7. Categories Present
-- =========================================

SELECT DISTINCT category
FROM walmart_sales
ORDER BY category;

-- =========================================
-- 8. Number of Products
-- =========================================

SELECT COUNT(DISTINCT product_name) AS total_products
FROM walmart_sales;

-- =========================================
-- 9. Number of States
-- =========================================

SELECT COUNT(DISTINCT state) AS total_states
FROM walmart_sales;

-- =========================================
-- 10. Number of Cities
-- =========================================

SELECT COUNT(DISTINCT city) AS total_cities
FROM walmart_sales;

-- =========================================
-- 11. Date Range
-- =========================================

SELECT
MIN(order_date) AS first_order,
MAX(order_date) AS last_order
FROM walmart_sales;

-- =========================================
-- 12. Shipping Time
-- =========================================

SELECT
MIN(DATEDIFF(ship_date,order_date)) AS minimum_shipping_days,
MAX(DATEDIFF(ship_date,order_date)) AS maximum_shipping_days,
ROUND(AVG(DATEDIFF(ship_date,order_date)),2) AS average_shipping_days
FROM walmart_sales;

-- =========================================
-- 13. Quantity Distribution
-- =========================================

SELECT
quantity,
COUNT(*) AS number_of_orders
FROM walmart_sales
GROUP BY quantity
ORDER BY quantity;

-- =========================================
-- 14. Sales Statistics
-- =========================================

SELECT
MIN(sales) AS minimum_sale,
MAX(sales) AS maximum_sale,
ROUND(AVG(sales),2) AS average_sale
FROM walmart_sales;

-- =========================================
-- 15. Profit Statistics
-- =========================================

SELECT
MIN(profit) AS minimum_profit,
MAX(profit) AS maximum_profit,
ROUND(AVG(profit),2) AS average_profit
FROM walmart_sales;
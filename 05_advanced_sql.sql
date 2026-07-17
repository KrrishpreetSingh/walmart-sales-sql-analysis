-- =========================================
-- Advanced SQL
-- Walmart Sales SQL Project
-- =========================================

-- =====================================================
-- 1. Rank states by total sales
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales,
    RANK() OVER(ORDER BY SUM(sales) DESC) AS sales_rank
FROM walmart_sales
GROUP BY state;

-- =====================================================
-- 2. Rank products by profit
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit,
    DENSE_RANK() OVER(ORDER BY SUM(profit) DESC) AS profit_rank
FROM walmart_sales
GROUP BY product_name;

-- =====================================================
-- 3. Top 3 products in each category
-- =====================================================

WITH product_rank AS
(
    SELECT
        category,
        product_name,
        ROUND(SUM(sales),2) AS total_sales,
        DENSE_RANK() OVER
        (
            PARTITION BY category
            ORDER BY SUM(sales) DESC
        ) AS product_rank
    FROM walmart_sales
    GROUP BY category, product_name
)

SELECT *
FROM product_rank
WHERE product_rank <= 3
ORDER BY category, product_rank;

-- =====================================================
-- 4. Running sales total over time
-- =====================================================

SELECT
    order_date,
    ROUND(SUM(sales),2) AS daily_sales,
    ROUND(
        SUM(SUM(sales)) OVER
        (
            ORDER BY order_date
        ),2
    ) AS running_sales
FROM walmart_sales
GROUP BY order_date
ORDER BY order_date;

-- =====================================================
-- 5. Monthly sales trend
-- =====================================================

SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales),2) AS monthly_sales
FROM walmart_sales
GROUP BY
YEAR(order_date),
MONTH(order_date)
ORDER BY year, month;

-- =====================================================
-- 6. Month-over-month sales growth
-- =====================================================

WITH monthly_sales AS
(
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        ROUND(SUM(sales),2) AS sales
    FROM walmart_sales
    GROUP BY
    YEAR(order_date),
    MONTH(order_date)
)

SELECT
    *,
    LAG(sales) OVER
    (
        ORDER BY year, month
    ) AS previous_month_sales
FROM monthly_sales;

-- =====================================================
-- 7. Highest order in every state
-- =====================================================

WITH state_orders AS
(
    SELECT
        state,
        order_id,
        sales,
        ROW_NUMBER() OVER
        (
            PARTITION BY state
            ORDER BY sales DESC
        ) AS rn
    FROM walmart_sales
)

SELECT *
FROM state_orders
WHERE rn = 1;

-- =====================================================
-- 8. Customer Lifetime Value
-- =====================================================

SELECT
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales),2) AS lifetime_sales,
    ROUND(SUM(profit),2) AS lifetime_profit
FROM walmart_sales
GROUP BY customer_name
ORDER BY lifetime_sales DESC;

-- =====================================================
-- 9. Customers spending above average
-- =====================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY customer_name
HAVING SUM(sales) >
(
    SELECT AVG(customer_sales)
    FROM
    (
        SELECT SUM(sales) AS customer_sales
        FROM walmart_sales
        GROUP BY customer_name
    ) t
);

-- =====================================================
-- 10. Profit contribution by category
-- =====================================================

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(
        SUM(profit) * 100 /
        (SELECT SUM(profit) FROM walmart_sales),
        2
    ) AS contribution_percentage
FROM walmart_sales
GROUP BY category
ORDER BY contribution_percentage DESC;
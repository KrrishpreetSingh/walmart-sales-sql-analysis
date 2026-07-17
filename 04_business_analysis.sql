-- =========================================
-- Business Analysis
-- Walmart Sales SQL Project
-- =========================================

-- =====================================================
-- 1. Which category generates the highest sales?
-- =====================================================

SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY category
ORDER BY total_sales DESC;

-- =====================================================
-- 2. Which category generates the highest profit?
-- =====================================================

SELECT
    category,
    ROUND(SUM(profit),2) AS total_profit
FROM walmart_sales
GROUP BY category
ORDER BY total_profit DESC;

-- =====================================================
-- 3. Which states contribute the highest sales?
-- =====================================================

SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================
-- 4. Which states generate the highest profit?
-- =====================================================

SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM walmart_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- =====================================================
-- 5. Top 10 cities by sales
-- =====================================================

SELECT
    city,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================
-- 6. Top 10 customers by total purchase value
-- =====================================================

SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================
-- 7. Top 10 customers by profit generated
-- =====================================================

SELECT
    customer_name,
    ROUND(SUM(profit),2) AS total_profit
FROM walmart_sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- =====================================================
-- 8. Top 10 best-selling products
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales
FROM walmart_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- =====================================================
-- 9. Top 10 most profitable products
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM walmart_sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- =====================================================
-- 10. Top 10 loss-making products
-- =====================================================

SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_loss
FROM walmart_sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_loss
LIMIT 10;

-- =====================================================
-- 11. Which category has the highest average order value?
-- =====================================================

SELECT
    category,
    ROUND(AVG(sales),2) AS average_order_value
FROM walmart_sales
GROUP BY category
ORDER BY average_order_value DESC;

-- =====================================================
-- 12. Which category has the highest average profit?
-- =====================================================

SELECT
    category,
    ROUND(AVG(profit),2) AS average_profit
FROM walmart_sales
GROUP BY category
ORDER BY average_profit DESC;

-- =====================================================
-- End of Business Analysis
-- =====================================================
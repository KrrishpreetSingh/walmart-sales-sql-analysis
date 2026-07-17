-- =========================================
-- Data Validation
-- Walmart Sales SQL Project
-- =========================================

-- 1. Count total records
show tables;
SELECT COUNT(*) AS total_records
FROM walmart_data;

-- 2. Check for null values
SELECT *
FROM walmart_sales
WHERE order_id IS NULL
   OR order_date IS NULL
   OR ship_date IS NULL
   OR customer_name IS NULL
   OR country IS NULL
   OR city IS NULL
   OR state IS NULL
   OR category IS NULL
   OR product_name IS NULL
   OR sales IS NULL
   OR quantity IS NULL
   OR profit IS NULL;

-- Check duplicate order ids
-- Note: Duplicate Order IDs are expected because a single order can contain multiple products.
SELECT
    order_id,
    COUNT(*) AS count_orders
FROM walmart_sales
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 4. Check negative profit
-- Note: Data validation identified negative profit transactions. 
-- After inspection, these were retained because they represent genuine loss-making sales rather than data errors.
SELECT *
FROM walmart_sales
WHERE profit < 0;

-- 5. Check invalid sales
SELECT *
FROM walmart_sales
WHERE sales <= 0;

-- 6. Check quantity
SELECT DISTINCT quantity
FROM walmart_sales
ORDER BY quantity;

-- 7. Check date format
SELECT
    order_date,
    ship_date
FROM walmart_sales
LIMIT 10;

-- =========================================
-- Data Cleaning
-- Walmart Sales SQL Project
-- =========================================

-- Objective:
-- Perform necessary data cleaning and transformation while preserving
-- valid business records.

-- =========================================
-- 1. Check for leading/trailing spaces
-- =========================================

SELECT *
FROM walmart_sales
WHERE customer_name <> TRIM(customer_name)
   OR country <> TRIM(country)
   OR city <> TRIM(city)
   OR state <> TRIM(state)
   OR category <> TRIM(category)
   OR product_name <> TRIM(product_name);

-- If any rows are returned, execute:
UPDATE walmart_sales
SET
    customer_name = TRIM(customer_name),
    country = TRIM(country),
    city = TRIM(city),
    state = TRIM(state),
    category = TRIM(category),
    product_name = TRIM(product_name)
WHERE customer_name <> TRIM(customer_name)
   OR country <> TRIM(country)
   OR city <> TRIM(city)
   OR state <> TRIM(state)
   OR category <> TRIM(category)
   OR product_name <> TRIM(product_name);

-- =========================================
-- 2. Convert date columns to DATE datatype
-- =========================================

-- Check current data types

DESCRIBE walmart_sales;

-- Add temporary DATE columns

ALTER TABLE walmart_sales
ADD COLUMN order_date_new DATE,
ADD COLUMN ship_date_new DATE;

-- Convert DD-MM-YYYY format to SQL DATE

UPDATE walmart_sales
SET
    order_date_new = STR_TO_DATE(order_date, '%d-%m-%Y'),
    ship_date_new = STR_TO_DATE(ship_date, '%d-%m-%Y');

-- Verify conversion

SELECT
    order_date,
    order_date_new,
    ship_date,
    ship_date_new
FROM walmart_sales
LIMIT 10;

-- Remove old VARCHAR columns

ALTER TABLE walmart_sales
DROP COLUMN order_date,
DROP COLUMN ship_date;

-- Rename converted columns

ALTER TABLE walmart_sales
CHANGE order_date_new order_date DATE,
CHANGE ship_date_new ship_date DATE;

-- =========================================
-- 3. Verify converted dates
-- =========================================

SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order,
    MIN(ship_date) AS earliest_shipment,
    MAX(ship_date) AS latest_shipment
FROM walmart_sales;

-- =========================================
-- 4. Business Validation
-- =========================================

-- Negative profit transactions are retained.
-- These represent genuine loss-making sales
-- and are important for profitability analysis.

SELECT COUNT(*) AS negative_profit_transactions
FROM walmart_sales
WHERE profit < 0;

-- Sales less than or equal to zero are retained for review.
-- These may represent returns, refunds or promotional transactions.

SELECT COUNT(*) AS non_positive_sales
FROM walmart_sales
WHERE sales <= 0;

-- =========================================
-- Data Cleaning Completed
-- =========================================
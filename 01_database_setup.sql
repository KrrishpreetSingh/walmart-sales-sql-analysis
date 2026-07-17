-- =========================================
-- Database Setup
-- Walmart Sales SQL Project
-- =========================================

-- Create Database

CREATE DATABASE IF NOT EXISTS walmart_db;

-- Select Database

USE walmart_db;

-- =========================================
-- Create Walmart Sales Table
-- =========================================

CREATE TABLE walmart_sales (
    order_id VARCHAR(30),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    customer_name VARCHAR(100),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2),
    quantity INT,
    profit DECIMAL(10,2)
);

-- =========================================
-- Verify Table Structure
-- =========================================

DESCRIBE walmart_sales;
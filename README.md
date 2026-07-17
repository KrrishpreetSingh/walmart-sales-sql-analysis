# Walmart Sales SQL Analysis

## Project Overview

This project analyzes Walmart sales data using **MySQL** to uncover meaningful business insights related to sales performance, profitability, customer behavior, and regional trends. The analysis follows a structured workflow, beginning with database creation and data preparation, followed by exploratory data analysis, business analysis, and advanced SQL techniques.

---

## Objectives

- Create and manage a relational database using MySQL.
- Validate and prepare raw sales data for analysis.
- Perform exploratory data analysis (EDA).
- Answer real-world business questions using SQL.
- Apply advanced SQL concepts such as Common Table Expressions (CTEs) and Window Functions.
- Derive actionable insights from transactional retail data.

---

## Tech Stack

- **Database:** MySQL
- **Language:** SQL
- **Dataset:** Walmart Sales Dataset (CSV)
- **IDE:** MySQL Workbench
- **Version Control:** Git & GitHub

---

## Dataset Information

The dataset contains Walmart retail transaction records with the following fields:

| Column |
|---------|
| Order ID |
| Order Date |
| Ship Date |
| Customer Name |
| Country |
| City |
| State |
| Category |
| Product Name |
| Sales |
| Quantity |
| Profit |

---

## Project Structure

```text
├── 01_database_setup.sql
├── 02_data_preparation.sql
├── 03_exploratory_data_analysis.sql
├── 04_business_analysis.sql
├── 05_advanced_sql.sql
├── walmart_sales.csv
└── README.md
```

---

## SQL Concepts Used

Throughout this project, the following SQL concepts have been applied:

- Database Creation
- Table Creation
- Data Validation
- Data Cleaning
- Aggregate Functions
- GROUP BY
- HAVING
- ORDER BY
- Date Functions
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()

---

## Project Workflow

### 1. Database Setup

- Created the Walmart database.
- Designed the sales table using appropriate data types.
- Imported the Walmart sales dataset.

---

### 2. Data Preparation

Performed several data quality checks including:

- Checking total records
- Identifying NULL values
- Detecting duplicate Order IDs
- Validating sales, quantity and profit values
- Verifying date fields
- Trimming unnecessary spaces where applicable

---

### 3. Exploratory Data Analysis

Performed descriptive analysis to understand the dataset by calculating:

- Total Orders
- Total Customers
- Total Revenue
- Total Profit
- Average Order Value
- Sales Statistics
- Profit Statistics
- Shipping Time Analysis
- Category Distribution
- Product Distribution
- Geographic Distribution

---

### 4. Business Analysis

Answered important business questions including:

- Which product category generates the highest sales?
- Which category generates the highest profit?
- Which states contribute the highest revenue?
- Which cities generate the highest sales?
- Who are the top customers by revenue?
- Which customers generate the highest profit?
- Which products generate the highest sales?
- Which products generate the highest profit?
- Which products incur the highest losses?
- Which category has the highest average order value?

---

### 5. Advanced SQL Analysis

Implemented advanced SQL techniques including:

- Ranking states by sales
- Ranking products by profit
- Top 3 products within each category
- Running sales total using Window Functions
- Monthly sales trend analysis
- Month-over-month sales comparison using LAG()
- Highest-value order in every state
- Customer Lifetime Value (CLV)
- Customers spending above average
- Profit contribution by category

---

## Skills Demonstrated

- SQL Programming
- MySQL Database Management
- Data Validation
- Data Cleaning
- Exploratory Data Analysis
- Business Analytics
- Window Functions
- Common Table Expressions (CTEs)
- Analytical Thinking
- Problem Solving

---

## Key Learnings

Through this project, I gained hands-on experience in:

- Designing relational databases
- Writing efficient SQL queries
- Cleaning and validating transactional data
- Performing exploratory and business analysis
- Using Window Functions and CTEs to solve analytical problems
- Translating raw business data into actionable insights

---

## How to Run the Project

1. Clone this repository.
2. Open MySQL Workbench.
3. Execute `01_database_setup.sql`.
4. Import the `walmart_sales.csv` dataset into the `walmart_sales` table.
5. Execute the remaining SQL files in numerical order.

---

## Future Improvements

- Resolve the CSV import issue to include the complete dataset.
- Build an interactive Power BI dashboard using the same database.
- Optimize queries using Views and Indexes.
- Extend the project with stored procedures and performance optimization.

---

## Author

**Krrishpreet Singh**

B.Tech Automobile Engineering | Delhi Technological University (DTU)

GitHub: https://github.com/KrrishpreetSingh

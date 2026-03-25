# Revenue Leakage & Discount Abuse Analysis

### End-to-End Data Analytics Project (SQL | Python | Power BI)

## Project Overview

This project focuses on identifying **revenue leakage and discount abuse** in a retail sales dataset. The objective was to analyze how discounts and refunds impact overall revenue and identify high-risk areas affecting business profitability.

The project follows a complete data analytics workflow starting from data cleaning to business insight generation and dashboard creation.

Primary analysis was performed using **SQL**, supported by Python for data preparation and Power BI for visualization.

---

## Business Problem

Retail businesses often lose revenue due to excessive discounts, refunds, and inefficient pricing practices. Detecting these leakages is important for improving profitability and operational control.

This project answers key business questions such as:

* How much revenue is lost due to discounts and refunds?
* Which countries and products contribute most to leakage?
* Are there high-risk transactions indicating discount abuse?
* How can transactions be categorized based on risk?

---

## Tools & Technologies Used

**SQL (Primary Tool)** → Data analysis and business query solving
**Python (Pandas, NumPy)** → Data cleaning and preprocessing
**Power BI** → Dashboard creation and visualization
**CSV Dataset** → Retail sales data

---

## Project Workflow

The project was completed in the following steps:

**Step 1 – Data Cleaning (Python)**
Handled missing values, corrected data types, and prepared clean dataset for analysis.

**Step 2 – Data Modeling**
Since the original dataset contained a single table, it was transformed into a **Star Schema model** for better analytical structure.

Created:

Fact Table:

* fact_sales (transactional sales data)

Dimension Tables:

* dim_customer (customer details)
* dim_product (product details)
* dim_date (date information)

This created **one-to-many relationships** between dimension tables and fact table to support Power BI analysis.

**Step 3 – SQL Analysis (Primary Stage)**

SQL was used to:

* Calculate revenue leakage KPIs
* Perform country and product analysis
* Detect high discount transactions
* Identify risky sales patterns
* Rank leakage contributors
* Categorize risk using CASE statements
* Perform JOIN operations across fact and dimension tables

**Step 4 – Dashboard Creation**

Power BI dashboard was created to visualize:

* Revenue KPIs
* Leakage trends
* Country analysis
* Product analysis
* Risk transactions

---

## Key SQL Concepts Demonstrated

* GROUP BY aggregations
* JOIN operations
* CASE statements
* Window Functions (RANK)
* KPI calculations
* Business metric calculations

---

## Key Business Insights

Some important findings from the analysis:

* A measurable percentage of revenue is lost due to discounts and refunds.
* Discounts contribute more to leakage compared to refunds.
* Few countries contribute majority of revenue leakage.
* Certain product categories consistently show higher discount losses.
* A small number of transactions contribute disproportionately to leakage.
* High discount transactions were identified as potential abuse cases.
* Risk levels were assigned to transactions based on discount thresholds.

---

## Data Model

To support analysis, a **Star Schema** model was created:

Fact Table:

* fact_sales

Dimension Tables:

* dim_customer
* dim_product
* dim_date

This structure improves query performance and supports analytical reporting.

(Star schema diagram included in repository)

---

## Dashboard Preview

Power BI dashboard shows:

* Revenue vs Leakage KPIs
* Country leakage distribution
* Product category analysis
* Risk transaction identification

(Dashboard screenshots available in repository)

---

## Repository Structure

Dataset → Cleaned retail dataset
Python_Data_Cleaning → Data preprocessing notebook
SQL_Analysis → SQL queries used for analysis
SQL_Query_Outputs → Important query results
PowerBI_Dashboard → Dashboard file and images
Data_Model → Star schema design

---

## How to Run This Project

1 Run Python notebook for data cleaning
2 Execute SQL queries for analysis
3 Open Power BI dashboard file
4 Review insights and visualizations

---

## Project Outcome

This project demonstrates the ability to:

* Clean and prepare real-world data
* Perform business-focused SQL analysis
* Design basic analytical data models
* Create dashboards for decision making
* Convert raw data into actionable insights

---

## Project Files

Dataset: Due to GitHub file size limitations, a sample cleaned dataset is include in this repository. The complete dataset used for analysis is available here:[Full Dataset - https://drive.google.com/file/d/1eH2C5JnAMv-6wZALpWNkqplkUX4VsUmz/view?usp=sharing]

Power BI Dashboard File: The Power BI dashboard file(.pbix) is available here: [Power BI Dashboard - https://drive.google.com/file/d/1gt8vY6dtfTVL5Vt9do_Bvu1dfwlq_JBP/view?usp=sharing]

Note: All SQL queries, Python data cleaning steps, dashboard screenshots and data model are available inside this repository.

## Author

**Sagar Sarode
Data Analyst | SQL | Power BI | Python

---



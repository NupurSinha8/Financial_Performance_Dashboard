# Financial_Performance_Dashboard
Interactive financial performance analysis project using Excel, SQL Server, and Power BI.
Title: Financial Performance Dashboard (Excel · SQL · Power BI)
Overview: Purpose of the project (analyze sales, profit, COGS, and discounts across countries, products, and time).
Tech Stack: Excel, SQL Server, Power BI.
Steps: Data Cleaning (Excel), Data Loading (SQL Server), SQL Queries for analysis, Dashboard (Power BI)
Key Insights: Sales, Profit Margin, Discount % vs Control, KPIs.
Key Learnings: 1. Data Cleaning & Preparation (Excel)
Learned how to clean raw financial data by handling missing values, formatting numbers, and standardizing dates.
Experienced the importance of correct data types (numeric, date, text) for smooth loading into SQL and Power BI.
Understood how historical data (2013–14) can be updated to reflect current analysis (2023–24).
2. Data Management (SQL SSMS)
Created SQL tables and imported financial data using Import Flat File feature.
Dealt with challenges like handling negative values (losses) and date parsing.
Practiced SQL queries for: Total sales, profit, COGS, and discount calculations. Profit Margin % and Discount % validation against Power BI measures. Time-series analysis using DATENAME, MONTH, and ORDER BY.
Understood the need for surrogate columns (e.g., Month Number) for correct sorting.
3.Data Modeling (Power BI) - Built a Calendar table to enable proper time intelligence functions (YTD, MTD, trends).
Learned relationships between fact table (financial data) and dimension tables (date, products, countries).
Created DAX measures for: Total Sales, Total Profit, Total Discounts
4. Visualization & Insights - Designed interactive visuals to analyze financial performance by country, product, and time period.
Built KPI Cards for quick executive insights: Sales, Profit, Discounts%, Profit Margin% vs Target, Discount% vs Control Limit
Used advanced visuals like Waterfall Chart (Sales → Discounts → Net Sales), Line & Column Chart (Discount % vs Profit Margin), and Heatmap (Discount trends across products/time).
Added slicers (Year, Country, Product, Segment) for interactivity.
5. Business & Analytical Insights - Understood how discount strategies impact profitability.
Identified variations in sales and profit trends across countries and product lines.
Learned how to set control limits/targets for monitoring (e.g., Discount % ≤ 10%, Profit Margin ≥ 15%).
Strengthened ability to translate raw data into decision-support insights.

<img width="906" height="506" alt="image" src="https://github.com/user-attachments/assets/42b9ebb8-0674-4e35-90f6-7d48d39f26ae" />


Profit Margin % = Profit ÷ Sales

Discount % = Discounts ÷ Gross Sales

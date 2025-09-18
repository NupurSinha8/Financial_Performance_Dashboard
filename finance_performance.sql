select * from [dbo].[data];

SELECT CAST(Date AS DATE) AS CleanDate
FROM [dbo].[data];

CREATE TABLE dbo.financial_data (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Segment NVARCHAR(100),
    Country NVARCHAR(100),
    Product NVARCHAR(150),
    Discount_Band NVARCHAR(50),
    Units_Sold INT,
    Manufacturing_Price DECIMAL(18,2),
    Sale_Price DECIMAL(18,2),
    Gross_Sales DECIMAL(18,2),
    Discounts DECIMAL(18,2),
    Sales DECIMAL(18,2),
    COGS DECIMAL(18,2),
    Profit DECIMAL(18,2),
    Date DATE, 
    Month_Name NVARCHAR(20),
    Year INT,
    Month_Number INT
);

ALTER TABLE [dbo].[data]
ADD CleanDate AS CAST(Date AS DATE);

select * from [dbo].[data];
 
select COUNT(*) from data;
select top 10 * from data;

---Sales by Country and Year
select country, Year, round(SUM(sales),2) as Total_Sales, round(SUM(Profit),2) as Total_Profit
from data
group by Country, Year 
order by Year, Country;

---Sales by Product
select product, round(SUM(sales),2) as Total_Sales, round(SUM(Profit),2) as Total_Profit
from data
group by Product
order by Total_Sales desc;

---Sales and Profit trend by Year
select year, 
round(SUM(sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profit, 
ROUND(sum(COGS),2) as Total_COGS 
from data
group by Year
order by year;

select * from data;
---Monthly Sales and Profit
select YEAR, Month_Name as Month,
round(SUM(sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profit
from data
group by year, Month_Number, Month_Name
order by year, Month_Number;

---Top 5 countries by profit
select top 5 country, 
round(SUM(sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profit
from data
group by Country
order by Total_Profit desc;

---Top 5 products by sales
select top 5 Product,
round(SUM(sales),2) as Total_Sales, 
round(SUM(Profit),2) as Total_Profit
from data
group by Product
order by Total_Sales desc;

---Segment-wise Sales & profitability
select Segment, round(SUM(Sales),2) as Total_Sales,
round(sum(Profit),2) as Total_Profit,
round(sum(Profit) * 100 / nullif(sum(sales),0), 2) as Profit_Margin_Percent
from data
group by segment
order by Total_Profit desc;

---Discount Impact Analysis
SELECT Country,
round(SUM(Discounts),2) AS Total_Discounts,
round(SUM(Sales),2) AS Total_Sales,
round(SUM(Profit),2) AS Total_Profit,
ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Sales),0),2) AS ProfitMarginPercent
FROM data
GROUP BY Country
ORDER BY Total_Discounts DESC;


---Total Discounts %
select SUM(Discounts) * 100 / nullif(sum(Gross_Sales), 0) as Discount_Per
from data;

---Profit Margin %
SELECT SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0) AS ProfitMarginPercent
FROM data;

select * from data;


---Loss making transactions
select * from data
where profit < 0
order by Profit desc;

---YOY Sales Growth
with yearly as 
(select Year, round(SUM(Sales),2) as Total_Sales
from data
group by Year)
select YEAR, Total_Sales, 
        LAG(Total_Sales) over (order by year) as Prev_YearSales,
        round(((Total_Sales - LAG(Total_Sales) over (order by year)) * 100) /
        nullif (LAG(Total_Sales) over (order by year),0),2) as YOY_Growth_PerCent
from yearly;


---Product Performance By Country
select country, product, 
round(SUM(Sales),2) AS Total_Sales,
round(SUM(Profit),2) AS Total_Profit
from data
group by country, product
order by country, product, Total_Sales desc;

select * from data;
---COGS Vs Sales - Efficiency Check
select country,
round(sum(sales),2) as Total_Sales,
round(sum(COGS),2) as Total_COGS,
round(sum(COGS) * 100 / nullif(sum(sales),0),2) as COGS_PerCent
from data
group by country
order by COGS_PerCent;



















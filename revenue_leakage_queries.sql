-- PROJECT: Revenue Leakage & Discount Abuse Analysis

-- SECTION 1: KPI ANALYSIS

-- Query 1 Total Revenue
SELECT SUM(Revenue) total_revenue
FROM fact_sales;

-- Query 2 Total Discount
SELECT SUM(Discount) total_discount
FROM fact_sales;

-- Query 3 Total Refund
SELECT SUM(RefundAmount) total_refund
FROM fact_sales;

-- Query 4 Total Leakage
SELECT SUM(Discount)+ABS(SUM(RefundAmount)) total_leakage
FROM fact_sales;

-- Query 5 Leakage Percentage
SELECT 
(sum(Discount)+ABS(sum(RefundAmount)))*100 / sum(Revenue) as leakage_percent 
from fact_sales;

-- SECTION 2: ROOT CAUSE

-- Query 6 Discount vs Refund
SELECT 
sum(Discount) as discount_loss, ABS(sum(RefundAmount)) as refund_loss 
from fact_sales;

-- Query 7 Net Revenue
SELECT 
sum(Revenue)-(sum(Discount)+ABS(sum(RefundAmount))) as net_revenue 
from fact_sales;

-- SECTION 3: COUNTRY ANALYSIS

-- Query 8 Country revenue
SELECT 
c.Country, 
sum(f.Revenue) Revenue 
from fact_sales f 
JOIN dim_customer c 
on f.CustomerID=c.CustomerID 
group by c.Country 
order by Revenue desc;

-- Query 9 Country leakage
SELECT 
c.Country, 
sum(f.Discount)+ABS(sum(f.RefundAmount))leakage 
from fact_sales f 
JOIN dim_customer c 
on f.CustomerID=c.CustomerID 
group by c.Country 
order by leakage desc;

-- Query 10 Country leakage %
SELECT 
c.Country, 
(sum(f.Discount)+ABS(sum(f.RefundAmount)))*100 / sum(f.Revenue) leakage_percent 
from fact_sales f 
JOIN dim_customer c 
on f.CustomerID=c.CustomerID 
group by c.Country 
order by leakage_percent desc;

-- SECTION 4 PRODUCT ANALYSIS

-- Query 11 Product leakage
SELECT 
p.Description,
sum(f.Discount)+ABS(sum(f.RefundAmount)) leakage 
from fact_sales f 
JOIN dim_product p 
on f.StockCode=p.StockCode 
group by p.Description 
order by leakage desc limit 10;

-- Query 12 Product discount
SELECT 
p.Description,
sum(f.Discount) discount_loss 
from fact_sales f 
JOIN dim_product p 
on f.StockCode=p.StockCode 
group by p.Description 
order by discount_loss desc limit 10;

-- SECTION 5 TIME ANALYSIS

-- Query 13 Monthly revenue
SELECT 
d.Month, 
sum(Revenue) revenue 
from fact_sales f 
JOIN dim_date d 
ON f.InvoiceDate=d.FullDate 
group by d.Month 
order by d.Month;

-- Query 14 Monthly leakage
SELECT 
d.Month, 
sum(f.Discount)+ABS(sum(f.RefundAmount)) leakage 
from fact_sales f 
JOIN dim_date d 
ON f.InvoiceDate=d.FullDate 
group by d.Month 
order by d.Month;

-- SECTION 6 RISK DETECTION

-- Query 15 High discount transactions
SELECT *
FROM fact_sales
WHERE discount > 1000 limit 20;

-- Query 16 High refund transactions
SELECT *
FROM fact_sales
WHERE RefundAmount < -500;

-- Query 17 Top leakage transactions
SELECT *,
(discount+ABS(RefundAmount)) leakage
FROM fact_sales
ORDER BY leakage DESC limit 20;

-- Query 18 Risk categorization
SELECT TransactionID,
CASE
WHEN discount >1000 THEN 'High Risk'
WHEN discount >500 THEN 'Medium Risk'
ELSE 'Low Risk'
END risk_level
FROM fact_sales limit 20;

-- SECTION 7 ADVANCED ANALYSIS

-- Query 19 Customer leakage
SELECT 
c.CustomerID as customer,
SUM(f.Discount)+ABS(SUM(f.RefundAmount)) leakage
FROM fact_sales f
JOIN dim_customer c
ON f.CustomerID=c.CustomerID
GROUP BY c.CustomerID limit 20;

-- Query 20 Country ranking
SELECT 
c.Country, 
sum(f.Discount)+ABS(sum(f.RefundAmount)) leakage, 
RANK() OVER( order by sum(f.Discount)+ABS(sum(f.RefundAmount)) desc) country_rank 
from fact_sales f 
JOIN dim_customer c 
on f.CustomerID=c.CustomerID 
group by c.Country;

-- Query 21 Leakage contribution
SELECT 
c.Country,
sum(f.Discount)+ABS(sum(f.RefundAmount)) as leakage,
ROUND((sum(f.Discount)+ABS(sum(f.RefundAmount)))*100.0 / sum(sum(f.Discount)+ABS(sum(f.RefundAmount))) OVER(),2)
as contribution_percent
from fact_sales f 
JOIN dim_customer c 
on f.CustomerID=c.CustomerID 
group by c.Country 
order by contribution_percent desc;

-- Query 22 Average discount
SELECT AVG(discount)
FROM fact_sales;


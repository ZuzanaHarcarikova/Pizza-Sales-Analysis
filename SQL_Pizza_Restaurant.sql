-- PIZZA RESTAURANT SALES QUERIES

use pizza_project;  
select * from cleaned_pizza_sales;

-- 1. KPI   

-- Total Revenues
select format(sum(total_price),2) AS 'Total Revenues'
from cleaned_pizza_sales;

-- Total Pizzas Sold
select format(sum(quantity),2) as 'Total Pizzas Sold'
from cleaned_pizza_sales;

-- Total Orders
select format(count(distinct order_id),2) as 'Total Orders'
from cleaned_pizza_sales; 

-- 2. Trend analysis

-- Monthly Revenue
SELECT 
    DATE_FORMAT(order_date, '%M') AS Month,
    FORMAT(SUM(total_price), 2) AS 'Total Revenue'
FROM cleaned_pizza_sales
GROUP BY DATE_FORMAT(order_date, '%M'), MONTH(order_date)
ORDER BY MONTH(order_date);

-- Trend of Revenue based on weekday
SELECT 
    DATE_FORMAT(order_date, '%W') AS DayOfWeek,
    FORMAT(SUM(total_price), 2) AS 'Total Revenue'
FROM cleaned_pizza_sales
GROUP BY WEEKDAY(order_date), DATE_FORMAT(order_date, '%W')
ORDER BY WEEKDAY(order_date);

-- Trend of Revenue based on daytime
SELECT 
    HOUR(order_time) AS HourOfDay,
    FORMAT(SUM(total_price), 2) AS 'Total Revenue'
FROM cleaned_pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HourOfDay;

-- 3.Categorical analysis

-- Total Revenue by Category
SELECT 
    pizza_category AS Category,
    FORMAT(SUM(total_price), 2) AS 'Total Revenue',
    CONCAT(ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM cleaned_pizza_sales),2),'%') AS 'Revenue Share'
FROM cleaned_pizza_sales
GROUP BY pizza_category
ORDER BY SUM(total_price) DESC;

-- Total Revenue by Size
SELECT 
    pizza_category AS Category,
    FORMAT(SUM(total_price), 2) AS 'Total Revenue',
    CONCAT(ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM cleaned_pizza_sales), 2), '%') AS 'Revenue Share'
FROM cleaned_pizza_sales
GROUP BY pizza_category
ORDER BY SUM(total_price) DESC;

-- 4.Descriptive Statistics

-- Average quantity sold
SELECT 
    ROUND(AVG(quantity), 2) AS 'Average Quantity Sold'
FROM cleaned_pizza_sales;

-- Average Revenue per Order
SELECT 
    ROUND(AVG(order_total), 2) AS 'Average Revenue per Order'
FROM (
    SELECT order_id, SUM(total_price) AS order_total
    FROM cleaned_pizza_sales
    GROUP BY order_id
) AS order_summary;

-- Average Revenue per Day
SELECT 
    format(AVG(daily_total),2) AS 'Average Daily Revenue'
FROM (
    SELECT order_date, SUM(total_price) AS daily_total
    FROM cleaned_pizza_sales
    GROUP BY order_date
) AS daily_summary;

-- 5 TOP Pizza based on Revenues
SELECT 
    pizza_name AS 'Pizza Name',
    FORMAT(SUM(total_price), 2) AS 'Total Revenue',
    CONCAT(ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM cleaned_pizza_sales), 2), '%') AS 'Revenue Share'
FROM cleaned_pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) DESC
LIMIT 5;

-- 5 LAST Pizza based on Revenues
SELECT 
    pizza_name AS 'Pizza Name',
    FORMAT(SUM(total_price), 2) AS 'Total Revenue',
    CONCAT(ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM cleaned_pizza_sales), 2), '%') AS 'Revenue Share'
FROM cleaned_pizza_sales
GROUP BY pizza_name
ORDER BY SUM(total_price) ASC
LIMIT 5;

-- TOP 5 Pizza based on Quantity
SELECT 
    pizza_name AS 'Pizza Name',
    format(SUM(quantity),2) AS 'Total Quantity Sold'
FROM cleaned_pizza_sales
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC
LIMIT 5;

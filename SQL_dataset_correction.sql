-- Create database and table
CREATE DATABASE pizza_project;
USE pizza_project;
CREATE TABLE pizza_sales (
pizza_id INT,          
 order_id INT,           
 pizza_name_id VARCHAR(100),
 quantity INT,    
 order_date DATE,      
 order_time DATE,     
 unit_price INT,      
 total_price INT,       
 pizza_size VARCHAR(100),       
 pizza_category VARCHAR(100),   
 pizza_ingredients VARCHAR(100), 
 pizza_name VARCHAR(100)
 );
 
describe cleaned_pizza_sales;
-- PROBLEM #1: Column 'order_date' has still TEXT format, because there are two formats of date 1/1/2015 and 1-1-2015

-- 1. Turn off safe mode

-- 2. Add column type DATE
ALTER TABLE cleaned_pizza_sales
ADD COLUMN order_date_dt DATE;

-- 3. Replace dashes with slashes
UPDATE cleaned_pizza_sales
SET order_date = REPLACE(order_date, '-', '/')
WHERE order_date LIKE '%-%';

-- 4. Convert text dates to DATE using STR_TO_DATE
UPDATE cleaned_pizza_sales
SET order_date_dt = STR_TO_DATE(order_date, '%e/%c/%Y');
-- %e = deň (1–31, bez nuly)
-- %c = mesiac (1–12, bez nuly)
-- %Y = rok (4 cifry)

-- 5. Delete original column with mixed values and TEXT format
ALTER TABLE cleaned_pizza_sales
DROP COLUMN order_date;

-- 6. Rename new column to order_date
ALTER TABLE cleaned_pizza_sales
CHANGE COLUMN order_date_dt order_date DATE;

-- PROBLEM #2: Redundant column 'MyUnknownColumn'
ALTER TABLE cleaned_pizza_sales
DROP COLUMN MyUnknownColumn;


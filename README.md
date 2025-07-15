# Pizza-Sales-Analysis
Pizza restaurant analysis using Python + SQL + Power BI

# Table of Contents

1. Introduction
2. Overview Dashboard
3. Dataset
4. Python for EDA
5. SQL for data correction
6. SQL + Power BI for Visualisation
8. Usage

## Introduction
This project is here to show that:

1. I can write SQL queries that make sense and answer real questions,
2. I understand the data well enough to turn it into a clear visual story,
3. And I can use Python when executing Exploratory Data Analysis

## Overview Dashboard
<img width="2000" height="1156" alt="Sales_Dashboard" src="https://github.com/user-attachments/assets/2ed59e9b-89b5-4e10-872e-8d3b79562e98" />
[View filed in Repository](./PDF export PowerBI_Sales_Dashboard_Pizza_Restaurant_PDFVisualisation.pdf)

## Dataset

I have downloaded the dataset from the platform Kaggle. This dataset contains detailed information about pizza orders, including specifics about the pizza variants, quantities, pricing, dates, times, and categorization details.

Source: https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset/data

[Download from Repository](./pizza_sales.csv)

## Python EDA

I have performed exploratory data analysis (EDA) using Python, i.e.
  1. I verified the structure of the data to analyze.
  2. I identified data types and chose appropriate analysis methods.
  3. I determined whether I need to handle NULL values. No NULL values were found.
  4. I determined whether I need to perform data type conversions. The order date has a datatype of OBJECT; therefore, conversion will be necessary.
  5. Replaced the values in the size column from short codes s, m, and l to their full forms: Small, Medium, and Large. This step will ensure clarity and readability, clearer presentation in reports and charts, improved interpretability for others, and consistency across the project.

The output from Python is a CSV file, cleaned_pizza_sales.csv. I will utilize this cleaned dataset to load into Power BI for creating an interactive dashboard.

[View my Python file](./EDA.ipynb)

[Download cleaned_pizza_sales.csv from Repository](./cleaned_pizza_sales.csv)

## SQL

I used SQL queries to inspect the structure of the existing cleaned_pizza_sales table. I identified:

1. Problem with the order_date column, as it was stored as text with inconsistent date formats (1/1/2015 and 1-1-2015). To fix this, I standardized the date format in the original order_date column by replacing dashes with slashes and converted the corrected text dates into proper DATE format using STR_TO_DATE.

2. Redundant column, which was removed to clean up redundant data.

This process improved data quality by ensuring dates are stored consistently as DATE types and removing redundant data columns.
I used SQL queries on the cleaned_pizza_sales table within the pizza_project database to perform a comprehensive analysis.

[View my SQL Script](./SQL_dataset_correction.sql)

## SQL + Power BI

1. Key Performance Indicators (KPIs): Calculated total revenues, total pizzas sold, and total number of unique orders to get an overall snapshot of sales performance.

2. Trend Analysis: Analyzed revenue trends by month, day of the week, and hour of the day to identify patterns in customer purchasing behavior over time.

3. Categorical Analysis: Summarized revenue by pizza category and size, showing each category’s contribution to total sales for a better understanding of popular products.

4. Descriptive Statistics: Computed average quantities sold per order, average revenue per order, and average daily revenue to understand typical sales metrics.

5. Top and Bottom Products: Identified top 5 and bottom 5 pizzas by revenue, as well as top 5 pizzas by quantity sold, to highlight the best and worst performing items.

[View my SQL Script](./SQL_Pizza_Restaurant.sql)

[Download my PowerBI from Repository](./PowerBI_file_Sales_Dashboard_Pizza_Restaurant.pbix)

## Power BI highlights:

1. In the Power BI dashboard, the chart showing monthly revenues is set to remain static and does not change when filters are applied to other visuals. This behavior is intentional and beneficial because it provides a consistent reference point for overall monthly sales trends, regardless of the filtered data, and users can compare filtered results against the total monthly revenues to better understand the impact of filters.

2. I used the DAX language to create new columns that support the visuals displaying trends, such as revenue development over the week and month. These columns enable more detailed time-based analysis in the charts.

3. Additionally, I created measures using DAX to calculate average revenues per day, per order, and per order line, which provide key performance metrics for the dashboard.

## Usage
These queries provided me with detailed insights into sales performance, customer behavior trends, and product popularity, supporting data-driven decision-making for the pizza restaurant. The dashboard's interactivity allows users to filter data according to months in a year.






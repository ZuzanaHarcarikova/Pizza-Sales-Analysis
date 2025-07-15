# Pizza-Sales-Analysis
Pizza restaurant analysis using Python + SQL + Power BI


This project is here to show that:

1. I can write SQL queries that make sense and answer real questions,

2. I understand the data well enough to turn it into a clear visual story,

3. And I can use Python when executing Exploratory Data Analysis

# Table of Contents
1. Introduction

1. Overview Dashboard

3. Dataset

I have downloaded the dataset from the platform Kaggle. This dataset contains detailed information about pizza orders, including specifics about the pizza variants, quantities, pricing, dates, times, and categorization details.

Source: https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset/data

5. Python EDA

I have performed exploratory data analysis (EDA) using Python.
  1. I have quickly verified the structure of the data to analyze.
  2. I have identified data types and chosed appropriate analysis methods.
  3. I have determine whether I need to handle NULL values. No NULL values were found.
  4. I have determined wheter I need to perform type conversions. As there are date formats with datatype OBJECT, conversion will be necessary.
  5. I replaced the values in the size column from short codes s, m, and l to their full forms: Small, Medium, and Large. This step will ensure clarity and readability, better presentation      in reports and charts, improved interpretability for others and consistency across the project.
  6. The output from Python is a CSV file, cleaned_pizza_sales.csv. I will utilize this cleaned dataset to load into Power BI for creating an interactive dashboard.


6. SQL
I used SQL queries on the cleaned_pizza_sales table within the pizza_project database to perform a comprehensive analysis.

The queries cover:

Key Performance Indicators (KPIs):
Calculated total revenues, total pizzas sold, and total number of unique orders to get an overall snapshot of sales performance.

Trend Analysis:
Analyzed revenue trends by month, day of the week, and hour of the day to identify patterns in customer purchasing behavior over time.

Categorical Analysis:
Summarized revenue by pizza category and size, showing each category’s contribution to total sales for a better understanding of popular products.

Descriptive Statistics:
Computed average quantities sold per order, average revenue per order, and average daily revenue to understand typical sales metrics.

Top and Bottom Products:
Identified top 5 and bottom 5 pizzas by revenue, as well as top 5 pizzas by quantity sold, to highlight the best and worst performing items.

These queries provided me with detailed insights into sales performance, customer behavior trends, and product popularity, supporting data-driven decision-making for the pizza restaurant.

8. Power Query

9. Usage




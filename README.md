# Walmart_Sales_Analysis
![image](https://github.com/amankt-web/Walmart_Sales_Analysis/assets/100958983/d5b937ae-9d6c-49ce-877a-4889ee5dd7b4)

# About
The primary objective of this project is to conduct a comprehensive analysis of Walmart's sales data with the aim of identifying insights and patterns that can contribute to increased business productivity. By leveraging historical sales data, the project seeks to provide actionable recommendations to enhance Walmart's operational efficiency, optimize inventory management, and improve overall business performance.
# Purposes Of The Project
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.
# Analysis List
1. Product Analysis
   Conduct analysis on the data to understand the different product lines, the products lines performing best and the product lines that need to be improved.
2. Sales Analysis
    This analysis aims to answer the question of the sales trends of product. The result of this can help use measure the effectiveness of each sales strategy the business applies and what 
    modificatoins are needed to gain more sales.
3. Customer Analysis
    This analysis aims to uncover the different customers segments, purchase trends and the profitability of each customer segment.
# Approach Used
1. Data Wrangling
2. Feature Engineering
3. EDA(Explorartory Data Analysis)
4. Conclusion

# Businness Question
# Genral Question
 1. How many unique cities does the data have?
 2. In which city is each branch?

# Product
  1. How many unique product lines does the data have?
  2. What is the most common payment method?
  3. What is the most selling product line?
  4. What is the total revenue by month?
  5. What month had the largest COGS?
  6. What product line had the largest revenue?
  7. What is the city with the largest revenue?
  8. What product line had the largest VAT?
  9. Which branch sold more products than average product sold?
  10. What is the most common product line by gender?
  11. What is the average rating of each product line?

# Sales
  1. Number of sales made in each time of the day per weekday
  2. Which of the customer types brings the most revenue?
  3. Which city has the largest tax percent/ VAT (Value Added Tax)?
  4. Which customer type pays the most in VAT?

# Customer
  1. How many unique customer types does the data have?
  2. How many unique payment methods does the data have?
  3. What is the most common customer type?
  4. Which customer type buys the most?
  5. What is the gender of most of the customers?
  6. What is the gender distribution per branch?
  7. Which time of the day do customers give most ratings?
  8. Which time of the day do customers give most ratings per branch?
  9. Which day fo the week has the best avg ratings?
  10. Which day of the week has the best average ratings per branch?

# Code 
For rest of the code to see then visit to WalmartSalesAnlaysis.sql and
for the data which i take from kaggle is there on Walmart_data.csv

-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;


    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

CREATE DATABASE IF NOT EXISTS salesDataWalmart;

CREATE TABLE IF NOT EXISTS sales (
      invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
      branch  VARCHAR(5) NOT NULL,
      city VARCHAR(30) NOT NULL,
      customer_type VARCHAR(30) NOT NULL,
      gender VARCHAR(10) NOT NULL,
      product_line VARCHAR(100) NOT NULL,
      unit_price DECIMAL(10,2) NOT NULL,
      quantity INT NOT NULL,
      VAT FLOAT NOT NULL,
      total DECIMAL(12, 4) NOT NULL,
      date DATETIME NOT NULL,
      time TIME NOT NULL,
      payment_method VARCHAR(15) NOT NULL,
      cogs DECIMAL (10, 2) NOT NULL, 
      gross_margin_pct FLOAT,
      gross_income DECIMAL(12, 4) NOT NULL, 
      rating FLOAT
);






-- FEATURE ENGINEERING -----
-- time_of_day--

SELECT 
  time,
  (CASE 
     WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
     WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
     ELSE "Evening"
  END
  ) AS time_of_date
    
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE sales
SET time_of_day = (
   CASE 
        WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
  END  
);

-- day_name----
SELECT
  date,
  DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
UPDATE sales
SET day_name = DAYNAME(date);

-- MONTH NAME ---

SELECT 
   date,
   MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

-- ---------------------------------------------------------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------------------------------------------------------- 
-- -------------------------------------------GENERIC QUESTIONS----------------------------------------------------------------------------------
-- How many unique cities does the data have?
SELECT 
 DISTINCT 
 city FROM sales;
 
 
 -- In which city is each branch?
 select
 DISTINCT city , branch
 FROM sales;

-- ------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------- PRODUCT QUESTIONS -------------------------------------------------------------------------------------
-- How many unique product lines does the data have?
SELECT 
   count(distinct product_line)
 from sales;
-- What is the most common payment method?
select 
 payment_method,
 count(payment_method)AS cnt
 from sales
 group by payment_method
 order by cnt desc;
 
-- What is the most selling product line?
select 
 product_line,
 count(product_line)AS pln
 from sales
 group by product_line
 order by pln desc;

-- What is the total revenue by month?
select 
 month_name as month,
 sum(total)  as total_revenue
 from sales
 group by month_name
 order by total_revenue desc;
 
-- What month had the largest COGS?

select 
 month_name as month,
 sum(cogs) as cog 
 from sales
 group by month
 order by cog desc;

-- What product line had the largest revenue?
select 
 product_line,
 sum(total)AS total_revenue
 from sales
 group by product_line
 order by total_revenue desc;
 
-- What is the city with the largest revenue?
select 
 branch, 
 city,
 sum(total)AS total_revenue
 from sales
 group by city, branch
 order by total_revenue desc;

-- What product line had the largest VAT?
select 
 product_line,
 AVG(VAT)AS Vat
 from sales
 group by product_line
 order by Vat desc;
 
-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- Which branch sold more products than average product sold?

select 
 branch, 
 sum(quantity)
 from sales
 group by branch
 having sum(quantity) > (select avg(quantity) from sales);
 
-- What is the most common product line by gender?

select
  gender,
  product_line,
  count(gender) as total_cnt
  from sales
  group by gender, product_line
  order by total_cnt desc;

-- what is the average rating of each product line?
select
 product_line,
 avg(rating) as rate
 from sales
 group by product_line
 order by rate desc;
 
 -- ---------------------------------------------------------------------------------------------------------------------------------------------
 -- ---------------------------------------------------Sales-------------------------------------------------------------------------------
 -- Number of sales made in each time of the day per weekday?
	select
     time_of_day,
     count(*) as total_sales
     from sales
	 where day_name="Tuesday"
     group by time_of_day
     order by total_sales desc;
-- Which of the customer types brings the most revenue?
select 
customer_type,
sum(total) as revenue
from sales
group by customer_type
order by revenue desc;
 
-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select
 city ,
 avg(VAT) as vat
 from sales
 group by city
 order by vat desc;
 
-- Which customer type pays the most in VAT?

select
 customer_type,
 avg(VAT) as vat
 from sales
 group by customer_type
 order by vat desc;
 
 -- ----------------------------------------------------------------------------------------------------------------------------------------------
 -- ----------------------------------Cutomer ----------------------------------------------------------------------------------------------------
 -- How many unique customer types does the data have? 
 select
 distinct
 customer_type
 from sales;
 -- How many unique payment methods does the data have?
 
select 
  distinct
  payment_method
  from sales;

-- What is the most common customer type?
select 
  customer_type,
  count(*) as count
  from sales
  group by customer_type
  order by count desc;
-- Which customer type buys the most?
select 
  customer_type,
  count(*) 
  from sales
  group by customer_type;

-- What is the gender of most of the customers?
select 
gender, 
count(*) as gend_cnt
from sales
group by gender
order by gend_cnt desc;

-- What is the gender distribution per branch?
select 
branch,
gender, 
count(*) as gend_dist
from sales
group by branch,  gender
order by gend_dist desc;
-- Which time of the day do customers give most ratings?
select 
time_of_day,
avg(rating) as most_rating
from sales
group by time_of_day
order by most_rating desc;
-- Which time of the day do customers give most ratings per branch?
select 
branch,
time_of_day,
avg(rating) as most_rating
from sales
group by branch, time_of_day
order by most_rating desc;
-- Which day of the week has the best avg ratings?
select 
day_name,
avg(rating) as avg_rating
from sales
group by  day_name
order by avg_rating desc;
-- Which day of the week has the best average ratings per branch?
select 
branch,
day_name,
avg(rating) as avg_rating
from sales
group by branch, day_name
order by avg_rating desc;

-- ----------------------------------------------------------------------------------------------------------------------------------------------



  
 





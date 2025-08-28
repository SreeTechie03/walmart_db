use walmart_db;
select * from walmart;

select count(*) from walmart;
select 
   payment_method,
   count(*)
from walmart
Group by payment_method 
order by payment_method asc;

select Max(quantity) from walmart;

-- Bussiness Problems

-- Q1. What are the different payment methods, and how many transactions and items were sold with each method?

select 
   payment_method,
   count(*) as no_payments,
   sum(quantity) as no_qty_sold
from walmart
Group by payment_method 
order by payment_method asc;

-- Q2. : Which category received the highest average rating in each branch?
select * from 
(select 
   branch,
   category,
   Avg(rating) as avg_rating,
   rank() over(partition by branch order by avg(rating) desc) as rnk
from walmart
group by 1,2) t
where rnk =1;

-- Q3 :  What is the busiest day of the week for each branch based on transaction volume?
SELECT *
FROM (
    SELECT 
        branch,
        DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%y'), '%W') AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER (PARTITION BY branch ORDER BY COUNT(*) DESC) AS rnk
    FROM walmart
    GROUP BY branch, day_name
) t
WHERE rnk = 1;


-- Q4: Calculate the total quantity of items sold per payment method
select payment_method,
sum(quantity) as no_qty_sold
from walmart
group by payment_method;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city

select 
 city,
 category,
 min(rating) as min_rating,
 max(rating) as max_rating,
 avg(rating) as avg_rating
from walmart
group by city, category;


-- Q6: Calculate the total profit for each category
SELECT 
    category,
    SUM(unit_price * quantity * profit_margin) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;













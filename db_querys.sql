use walmart_db;

Select * from walmart limit 100;
select count(*)  from walmart;

select 
     payment_method, 
     count(*)  
from walmart
group by payment_method;

select Count(distinct branch) branch from walmart;

select max(quantity) from walmart;


select 
	payment_method,
    count(*) as no_payments,
    sum(quantity) as no_qty_sold 
from walmart
group by payment_method 
ORDER BY no_payments desc;
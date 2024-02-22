
use [Pizza DB]


select * from pizza_sales

-- Total revenue
select sum(total_price) as Total_Revenue from pizza_sales

-- Average order 

select (sum(total_price)/count(distinct order_id)) as Average_order from pizza_sales

-- Total Pizza sold

select sum(quantity) Total_pizza_sold from pizza_sales

-- Total order

select count(distinct order_id) as Total_order from pizza_sales

-- Average Number of Pizza Per Order

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as avg_pizzaPerOrder from pizza_sales

-- Daily trend for pizza orders

select
	datename(dw,order_date) as Weekdays, 
	count(distinct order_id) as Total_order 

from pizza_sales
group by datename(dw,order_date);

-- Monthly tread for pizza orders

select
	datename(mm,order_date) as Month, 
	count(distinct order_id) as Total_order
from pizza_sales
group by datename(mm,order_date);

-- % of sales by pizza Category

select 
	pizza_category, 
	cast(sum(total_price) as decimal(10,2)) as total_revenue,
	cast((sum(total_price)/(select sum(total_price)from pizza_sales)*100) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_category;

-- % of sales by pizza size
select 
	pizza_size, 
	cast(sum(total_price) as decimal(10,2)) as total_revenue,
	cast((sum(total_price)/(select sum(total_price)from pizza_sales)*100) as decimal(10,2)) as PCT
from pizza_sales
group by pizza_size;

-- total number of pizzaa sold by pizza category
select 
	pizza_category,
	sum(quantity) as totalQuantity

from pizza_sales
group by pizza_category
order by totalQuantity desc;

-- top 5 pizza by revenue

select 
	top 5 pizza_name, SUM(total_price) as total_revenue

from pizza_sales
group by pizza_name
order by total_revenue desc; 

-- bottom 5 pizza name

select 
	top 5 pizza_name, SUM(total_price) as total_revenue

from pizza_sales
group by pizza_name
order by total_revenue asc; 

-- top 5 pizza name by Q

select 
	top 5 pizza_name, SUM(quantity) as total_Quantity

from pizza_sales
group by pizza_name
order by total_Quantity desc; 

-- btm 5 pizza name by Q

select 
	top 5 pizza_name, SUM(quantity) as total_Quantity

from pizza_sales
group by pizza_name
order by total_Quantity asc; 

-- top 5 pizza name by Order

select 
	top 5 pizza_name, count(distinct order_id) as total_Order

from pizza_sales
group by pizza_name
order by total_Order desc; 

-- btm 5 pizza name by Order

select 
	top 5 pizza_name, count(distinct order_id) as total_Order

from pizza_sales
group by pizza_name
order by total_Order asc; 
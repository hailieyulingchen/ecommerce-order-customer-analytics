--Top Category Revenue
select 
product_category,
round(sum(price), 2) as revenue
from orders_product
group by product_category
order by revenue desc;

--Top Category Orders
select 
product_category,
count(distinct order_id) as total_orders
from orders_product
group by product_category
order by total_orders desc;

--Average Product Price by Category
select
product_category,
round(avg(price), 2) as avg_price
from orders_product
group by product_category
order by avg_price desc;

--Monthly Revenue Trend by Category
select
order_month,
product_category,
round(sum(price), 2) as total_revenue,
count(distinct order_id) as total_orders
from orders_product
group by product_category
order by order_month;
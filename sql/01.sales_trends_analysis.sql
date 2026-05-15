-- Monthly Order Trend
select 
order_month,
count(distinct order_id) as total_orders
from customers_orders_payments
group by order_month
order by order_month;

-- Monthly Revenue Trend
select 
order_month,
sum(payment_value) as total_revenue
from customers_orders_payments
group by order_month
order by order_month;

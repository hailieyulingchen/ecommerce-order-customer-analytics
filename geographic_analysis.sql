-- Top States by Revenue
select customer_state,
count(distinct order_id) as total_orders,
sum(payment_value) as total_revenue,
round(sum(payment_value) * 1.0/count(distinct order_id),2) as avg_order_value
from customers_orders_payments
group by customer_state
order by total_revenue desc;
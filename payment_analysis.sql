-- Payment Type Distribution
select 
payment_type,
count(*) as total_payments
from customers_orders_payments
group by payment_type
order by total_payments desc;

--Payment Revenue Share
select
payment_type,
sum(payment_value) as total_revenue
from customers_orders_payments
group by payment_type
order by total_revenue desc;

-- Installment Behavior
SELECT
payment_installments,
count(distinct order_id) as total_orders
from customers_orders_payments
group by payment_installments
order by payment_installments;


--Installment Value Relationship
select 
installments,
avg(total_order_value) as avg_order_value
from
(select 
order_id,
sum(payment_value) as total_order_value,
max(payment_installments) as installments
from customers_orders_payments
group by order_id)
group by installments
order by installments desc;

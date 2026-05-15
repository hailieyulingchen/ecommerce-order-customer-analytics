create view  customers_orders_payments as
select 
o.order_id,
c.customer_id,
c.customer_city,
c.customer_state,

o.order_status,
o.order_purchase_timestamp,
strftime('%Y-%m', o.order_purchase_timestamp) as month,
p.payment_type,
p.payment_installments,
p.payment_value

from orders  o
join customers c
on o.customer_id = c.customer_id
join payments p
on o.order_id = p.order_id
where o.order_status = 'delivered';

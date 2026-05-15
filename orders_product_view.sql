create view orders_product as
select
o.order_id,
o.order_purchase_timestamp,
strftime('%Y-%m', o.order_purchase_timestamp) as order_month,

i.product_id,
i.price,
i.freight_value,

REPLACE(t.product_category_name_english, '_', ' ') as product_category
from orders o
join items i
on o.order_id = i.order_id
join products p
on i.product_id = p.product_id
left join translation t
on p.product_category_name = t.product_category_name

where o.order_status = 'delivered'
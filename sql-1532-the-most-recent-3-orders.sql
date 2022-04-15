with res as 
(select order_id, order_date, customer_id, dense_rank() over (partition by customer_id order by order_date desc) as rnk
from orders
order by customer_id)

select c.name as customer_name, r.customer_id, r.order_id, r.order_date 
from res r, customers c
where c.customer_id = r.customer_id
and rnk in (1, 2, 3)
order by 1, 2, 4 desc

select o.customer_id, c.name 
from product p, orders o, customers c
where p.product_id = o.product_id and o.customer_id = c.customer_id
group by 1
having sum(case when month(o.order_date) = 6 then p.price * o.quantity end) >= 100 and 
       sum(case when month(o.order_date) = 7 then p.price * o.quantity end) >= 100

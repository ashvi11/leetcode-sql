select customer_id 
from Customer c
group by 1
having count(distinct c.product_key) = (select count(distinct product_key) from Product)


# Note: We have a foreign key restriction on the customer table- that is we have the column product_key in Customer table
# If not then,

select customer_id
from customer
where product_key in (select product_key from product)
group by customer_id
having count(distinct product_key) = (select count(*) from product)

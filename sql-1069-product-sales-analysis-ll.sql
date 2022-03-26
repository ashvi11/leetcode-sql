select s.product_id, sum(s.quantity) as total_quantity 
from Sales s 
group by s.product_id

# there are two tables, does not mean join is needed- there is no point of join in this query

# Approach 1
select product_id, product_name  
from Product
where product_id not in (select product_id 
                         from sales 
                         where sale_date not between '2019-01-01' and '2019-03-31')
 
 # Approach 2

select p.product_id, p.product_name
from Product p join Sales s using(product_id)
group by s.product_id
having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31'

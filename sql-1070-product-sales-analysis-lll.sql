
select product_id,`year`as first_year,quantity,price
from(select *, rank()over(partition by product_id order by year asc) as 'rank1'
from Sales) temp
where rank1 = 1

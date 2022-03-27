select seller_id 
from (select seller_id, sum(price), rank() over (order by sum(price) desc) as 'rank' from Sales group by 1) temp 
where temp.rank = 1

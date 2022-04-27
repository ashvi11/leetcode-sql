# Approach 1

with res as (select *, rank() over(partition by product_id order by change_date desc) as rnk from Products
where datediff('2019-08-16', change_date) >= 0)

select distinct p.product_id, ifnull(r.new_price, 10) as price from Products p left join res r 
on p.product_id = r.product_id and rnk = 1



#Approach 2

with res as
    (select product_id, max(change_date) as most_recent
    from Products
    where datediff('2019-08-16', change_date) >= 0
    group by 1)
    
select product_id, new_price as price 
from Products 
where (product_id, change_date) in (select * from res)
union
select product_id, 10 as price 
from Products
where product_id not in (select product_id from res)

#leetcode discuss

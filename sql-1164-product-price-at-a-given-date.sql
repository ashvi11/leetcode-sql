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

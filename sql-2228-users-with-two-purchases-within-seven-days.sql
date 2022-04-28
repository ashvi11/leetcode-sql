#aproach 1
with res as
(select *, lag(purchase_date) over(partition by user_id order by purchase_date) as lag_date from Purchases)

select distinct user_id 
from res
where datediff(purchase_date, lag_date) <= 7


#Approach 2
select distinct p1.user_id 
from Purchases p1, Purchases p2
where datediff(p1.purchase_date, p2.purchase_date) between 0 and 7 
      and p1.purchase_id != p2.purchase_id
      and p1.user_id = p2.user_id
order by 1

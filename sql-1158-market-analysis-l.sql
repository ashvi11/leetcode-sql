select u.user_id as buyer_id, u.join_date, count(o.order_id) as orders_in_2019
from Users u left join Orders o on u.user_id = o.buyer_id
and year(order_date) = 2019
group by 1

#here, if I put where year(order_date) = 2019, it will not return rows with null values, hence 
#we have to put it in join on clause

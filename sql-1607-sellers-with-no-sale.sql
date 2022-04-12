select seller_name 
from Seller 
where seller_id not in (select o.seller_id from Orders o, Seller s
                        where o.seller_id = s.seller_id
                        and sale_date like '2020-%')
order by 1

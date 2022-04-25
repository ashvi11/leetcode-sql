#recursive CTE- used here like a for loop

with recursive res as(
    select 1 as value
    union
    select value+1 from res
    where value < (select max(customer_id) from Customers)
    )
    
select value as ids 
from res 
where value not in (select customer_id from Customers)

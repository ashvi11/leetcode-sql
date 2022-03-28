 with res as (
     select *, rank() over (partition by customer_id order by order_date) as 'rank1' from delivery)
 
select round(sum(count_imm)/count(delivery_id)*100,2) as immediate_percentage 
from 
(select delivery_id,
case when 
order_date = customer_pref_delivery_date then 1 
else 0
end
as count_imm
from res 
where rank1 = 1) temp

# same as previous (1173), but here we are choosing only minimum date for each customer, so giving rank 1 to min date, then choosing rows 
# where rank = 1 to calculate

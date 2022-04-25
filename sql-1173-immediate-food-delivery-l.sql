
# Approach 1
#shorter version of approach 2
select round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end)/count(*)*100, 2) as immediate_percentage
from Delivery

# Approach 2
select round(sum(count_imm)/count(delivery_id)*100,2) as immediate_percentage 
from 
(select delivery_id,
case when 
order_date = customer_pref_delivery_date then 1 
else 0
end
as count_imm
from Delivery) temp

# created a temp table which stores 1 if delivery is immediate, else 0. Sum of 1's would be total number of immediate deliveries. 
# So, we sum that and count total number of rows in the table since delivery_id is the primary key. Then division

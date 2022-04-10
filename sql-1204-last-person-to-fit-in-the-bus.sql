with res as 
(select turn, person_id, person_name, weight,
sum(weight) over(order by turn) as total_weight
from Queue)

select person_name 
from res
where total_weight <= 1000
order by turn desc
limit 1

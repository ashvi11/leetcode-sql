with res as 
  (select user_id, visit_date, lead(visit_date, 1,'2021-1-1') over(partition by user_id order by visit_date) as lead_date
  from UserVisits)

select user_id, max(datediff(lead_date, visit_date)) as biggest_window 
from res
group by 1

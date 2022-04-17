select id, sum(total) as num from 
((select requester_id as id, count(requester_id) as total
from RequestAccepted
group by 1)
union all
(select accepter_id as id, count(accepter_id)as total
from RequestAccepted
group by 1)) temp
group by 1
order by 2 desc
limit 1

select contest_id, round(count(r.user_id)/(select count(*) from Users)*100,2) as percentage 
from Register r 
group by 1
order by 2 desc, 1

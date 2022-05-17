with res as (select username, activity, startDate, endDate, rank() over(partition by username order by startDate desc) as rnk,
             count(*) over(partition by username) as ct 
             from UserActivity)

select username, activity, startDate, endDate
from res
where rnk = 2 or (ct = 1 and rnk = 1)

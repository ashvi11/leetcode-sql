with res as (select viewer_id as id, count(distinct article_id) as article_count from Views group by view_date, 1)
select distinct id 
from res 
where article_count > 1 
order by 1


with res as (select viewer_id as id, count(distinct article_id) as article_count from Views group by view_date, 1)
select distinct id 
from res 
where article_count > 1 
order by 1

# created another table- res which has count of people who viewd distict articles on the same date- then selected those ids which had count > 2

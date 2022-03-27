select author_id as id 
from Views 
where author_id = viewer_id 
group by 1 
order by 1

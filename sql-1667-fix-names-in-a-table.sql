select user_id, concat(upper(left(name,1)), lower(right(name, length(name)-1))) as name 
from Users 
order by 1

select user_id, concat(upper(substring(name,1,1)), lower(substring(name,2,100))) as name 
from Users 
order by 1

# two solutions- can use either

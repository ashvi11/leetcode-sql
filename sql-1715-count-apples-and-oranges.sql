select sum(ifnull(b.apple_count+c.apple_count,b.apple_count)) as apple_count, 
       sum(ifnull(b.orange_count+c.orange_count,b.orange_count)) as orange_count
from Boxes b left join Chests c using(chest_id)

select activity 
from (select activity, dense_rank() over (order by count(id) desc) as 'rank1', dense_rank() over (order by count(id)) as 'rank2' from Friends group by activity) temp
where temp.rank1 != 1 and temp.rank2 != 1

# inner table:
# 1st column- activity name
# 2nd column- rank of activity in which highest number of students participates is 1, 2nd highest is 2, etc.- rank1 
# 3rd column- rank of activity in which lowest number of students participates is 1, 2nd lowest is 2, etc.- rank2
# we do not want those activites where rank1 != 1 and rank2 != 1

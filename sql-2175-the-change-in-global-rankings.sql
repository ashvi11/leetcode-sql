
# Approach 1- cast ROW_NUMBER() as signed int
select t.team_id, name, 
    cast(row_number() over(order by t.points desc, name) as signed)
    - cast(row_number() over(order by t.points+p.points_change desc, name) as signed)
    as rank_diff
from TeamPoints t, PointsChange p
where t.team_id = p.team_id

# Approach 2- cast RANK() as signed int
# I don't know why rank() works, because of the way it handles ties
select t.team_id, name, 
    cast(rank() over(order by t.points desc, name) as signed)
    - cast(rank() over(order by t.points+p.points_change desc, name) as signed)
    as rank_diff
from TeamPoints t, PointsChange p
where t.team_id = p.team_id

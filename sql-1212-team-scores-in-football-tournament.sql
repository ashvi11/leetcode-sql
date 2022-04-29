with res as (
   select match_id, host_team, m.host_goals, guest_team, m.guest_goals,
     (case 
     when host_goals > guest_goals then 3
     when host_goals = guest_goals then 1
     else 0
     end) as host_score,
     (case when guest_goals > host_goals then 3
     when host_goals = guest_goals then 1
     else 0
     end) as guest_score
from Matches m
order by 1
),

res2 as (
select match_id, host_team, host_score from res
union
select match_id, guest_team, guest_score from res
order by 2
)

select team_id, team_name, ifnull(sum(host_score),0) as num_points
from Teams t left join res2 on t.team_id = res2.host_team
group by 2
order by 3 desc, 1

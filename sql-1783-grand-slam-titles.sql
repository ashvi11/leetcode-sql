#Approach 1a
select player_id, player_name,
sum(case when p.player_id = Wimbledon then 1 else 0 end)+sum(case when p.player_id = Fr_open then 1 else 0 end)+sum(case when p.player_id = US_open then 1 else 0 end)+
sum(case when p.player_id = Au_open then 1 else 0 end) as grand_slams_count
from Championships c, Players p
where player_id = Wimbledon or player_id = Fr_open or player_id = US_open or player_id = Au_open
group by player_id

#Approach 1b
sum(case when p.player_id = Wimbledon then 1 else 0 end)+sum(case when p.player_id = Fr_open then 1 else 0 end)+sum(case when p.player_id = US_open then 1 else 0 end)+
sum(case when p.player_id = Au_open then 1 else 0 end) as grand_slams_count
from Championships c, Players p
group by player_id
having grand_slams_count > 0

#Approach 2- Naive
with res as
  (select year, Wimbledon as player_id from Championships
  union all
  select year, Fr_open as player_id from Championships
  union all
  select year, US_open as player_id from Championships
  union all
  select year, Au_open as player_id from Championships)

select r.player_id, p.player_name, count(*) as grand_slams_count 
from res r join Players p using(player_id)
group by player_id

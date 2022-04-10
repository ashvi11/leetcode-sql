#Approach 1- faster
select country_name,
(case when avg(weather_state) <= 15 then 'Cold'
 when avg(weather_state) >= 25 then 'Hot'
 else 'Warm' 
 end) as weather_type
 from Countries c, Weather w
 where c.country_id = w.country_id
 and day like '2019-11%'
 group by 1


#Approach 2- WINDOW FUNCTION
with res as (select country_id, weather_state, day, 
avg(weather_state) over(partition by country_id) as avg_temp from Weather 
where day like '2019-11%')

select country_name,
(case when avg_temp <= 15 then 'Cold'
when avg_temp >= 25 then 'Hot'
else 'Warm'
end) as weather_type 
from res r, Countries c where r.country_id = c.country_id
group by 1

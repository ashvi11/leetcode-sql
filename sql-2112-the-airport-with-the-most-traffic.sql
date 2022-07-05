with res as
(select departure_airport, flights_count from Flights
union all
select arrival_airport, flights_count from Flights),

res2 as (select departure_airport, sum(flights_count) as sum_count from res
              group by 1)
              
select departure_airport as airport_id from res2 where sum_count = (select max(sum_count) from res2) 

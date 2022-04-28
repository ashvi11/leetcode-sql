select d.driver_id, count(distinct p.ride_id) as cnt
from Rides d left join Rides p on d.driver_id = p.passenger_id
group by 1

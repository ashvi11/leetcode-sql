# Approach 1
select distinct c1.seat_id 
from Cinema c1, Cinema c2
where abs(c1.seat_id - c2.seat_id) = 1
and c1.free = 1 and c2.free = 1
order by seat_id




# Approach 2- WINDOW FUNCTION
(select seat_id from 
(select seat_id, free, lead(free, 1) over() as offset_1 from Cinema)temp1
where free = offset_1 and free = 1)
union
(select seat_id from
(select seat_id, free, lag(free, 1) over() as offset_1 from Cinema)temp2
where free = offset_1 and free = 1)
order by 1

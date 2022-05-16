select distinct p1.id as p1, p2.id as p2, abs(p1.x_value-p2.x_value)*abs(p1.y_value-p2.y_value) as area
from Points p1, Points p2
where p1.id < p2.id
  and abs(p1.x_value-p2.x_value)*abs(p1.y_value-p2.y_value) != 0
order by 3 desc, 1, 2

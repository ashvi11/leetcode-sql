with res as 
(select P1.x as x1, P1.y as y1, P2.x as x2, P2.y as y2
from Point2D P1 left join Point2D P2 on P1.x != P2.x or P2.y != P1.y )


select round(sqrt(power(x2-x1, 2) + power(y2-y1, 2)),2) as shortest 
from res
order by 1
limit 1

#Make a table like this by using the able join, then find shortest distance by using order by, limit 1

#| x  | y  | x  | y  | distance           |
#|----|----|----|----|--------------------|
#| 0  | 0  | -1 | -1 | 1.4142135623730951 |
#| -1 | -2 | -1 | -1 | 1                  |
#| -1 | -1 | 0  | 0  | 1.4142135623730951 |
#| -1 | -2 | 0  | 0  | 2.23606797749979   |
#| -1 | -1 | -1 | -2 | 1                  |
#| 0  | 0  | -1 | -2 | 2.23606797749979   |

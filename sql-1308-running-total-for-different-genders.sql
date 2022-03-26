select gender, day, sum(score_points) over (partition by gender order by day) as 'total' 
from Scores

# partition by gender because we wanted to get scores of males and females separately, order by day because we wanted to see scores incrementally

with res as(select user_id, gender, 
            row_number() over(partition by gender order by user_id) as rn
from Genders)

select user_id, gender 
from res 
order by rn, gender, user_id

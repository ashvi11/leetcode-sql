with res as
(select id, name, managerId, row_number() over(partition by managerId) as rn
from Employee)

select name from Employee where id in (select distinct managerId from res where rn >= 5)

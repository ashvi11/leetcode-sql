
with res as (select salary, dense_rank() over (order by salary desc) as rnk 
from Employee)

select 
case when count(*) >= 1 then salary
else null
end
as SecondHighestSalary
from res where rnk = 2

# here, we are saying that if there are 1 or more rows with rank = 2, then output salary, else output null

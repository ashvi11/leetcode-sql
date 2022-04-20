#Approach 1- row_number()- self
with res as
(select id, name, managerId, row_number() over(partition by managerId) as rn
from Employee)

select name from Employee where id in (select distinct managerId from res where rn >= 5)

#Approach 2- having- leetcode discuss
select name 
from Employee 
where id in (select managerId from Employee group by 1 having count(distinct id) >= 5)

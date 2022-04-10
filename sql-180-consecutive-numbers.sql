#Approach 1
select distinct l1.Num as ConsecutiveNums 
from Logs l1, Logs l2, Logs l3
where l1.Id = l2.Id-1 and l2.Id = l3.Id-1 and l1.Num = l2.Num and l2.Num = l3.Num

#In this approach, we create 3 tables, and join by Id, Id-1 and Id-2

#Approach 2 LEAD() or LAG()
select distinct num as ConsecutiveNums 
from 
(select id, num, lead(num, 1) over() as offset_1, lead(num, 2) over() as offset_2
from Logs) temp
where num = offset_1 and num = offset_2

#In this approach, we are making 2 lead columns with offset 1 and offset 2(because we want 3 consesutive numbers) and if original num, and there two
#lead values are same at any point, that means there are 3 consecutive numbers.



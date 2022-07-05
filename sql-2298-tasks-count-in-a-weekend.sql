
#Approach 1
with res as(select task_id, dayofweek(submit_date) as week_d from Tasks)

select sum(case when week_d = 1 or week_d = 7 then 1 else 0 end) as weekend_cnt,
       sum(case when week_d != 1 and week_d != 7 then 1 else 0 end) as working_cnt
from res

#Approach 2
with res as(select task_id, dayofweek(submit_date) as week_d from Tasks)

select sum(case when week_d = 1 or week_d = 7 then 1 else 0 end) as weekend_cnt,
       sum(case when week_d != 1 and week_d != 7 then 1 else 0 end) as working_cnt
from res

#Approach 3
#get count of total tasks, total tasks in weekend, then subtract to get total tasks during working days

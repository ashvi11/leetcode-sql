
select user_id, user_name, 

credit + ifnull(sum(case when user_id =paid_by then -amount
                         when user_id = paid_to then amount end),0) as credit,
                              
                    (case when credit + ifnull(sum(case when user_id = paid_by then -amount
                          when user_id = paid_to then amount end),0) 
                          < 0 then 'Yes' else 'No' end) as credit_limit_breached
                          
from Users left join Transactions 
on user_id = paid_by or user_id = paid_to
group by 1

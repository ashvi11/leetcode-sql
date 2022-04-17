
select customer_id, count(visit_id) as count_no_trans
from (select v.visit_id, v.customer_id, t.transaction_id
      from  Visits v left join  Transactions t
      using(visit_id)) temp
where transaction_id is null
group by 1

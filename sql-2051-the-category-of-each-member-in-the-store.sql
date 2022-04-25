with res as (select member_id, name, count(v.visit_id) as visit_count, count(p.visit_id) as purchase_count
from Members m left join Visits v using(member_id) left join Purchases p using(visit_id)
group by 1)

select member_id, name, 
(case when visit_count = 0 then 'Bronze'
    when (purchase_count / visit_count)*100 < 50 then 'Silver'
    when (purchase_count / visit_count)*100 between 50 and 79 then 'Gold'
    when (purchase_count / visit_count)*100 >= 80 then 'Diamond'
end) as category
from res

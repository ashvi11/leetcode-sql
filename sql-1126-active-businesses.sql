
with res as
(select *, avg(occurences) over(partition by event_type) as avg_occ from Events)

select business_id from res where occurences > avg_occ group by 1
having count(business_id) > 1

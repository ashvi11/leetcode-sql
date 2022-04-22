# Approach 1
select least(from_id, to_id) as person1, greatest(from_id, to_id) as person2, count(*) as call_count, sum(duration) as total_duration
from Calls
group by 1, 2


# Approach 2
with res as (select from_id as person1, to_id as person2, duration from calls 
             union all
             select to_id as person1, from_id as person2, duration from calls)

select person1, person2, count(*) as call_count, sum(duration) as total_duration 
from res 
where person1 < person2
group by 1, 2


# Approach 3
SELECT
	CASE WHEN from_id < to_id THEN from_id
	ELSE to_id END AS person1,
	CASE WHEN from_id > to_id THEN from_id
	ELSE to_id END as person2,
    count(*) as call_count,
    sum(duration) as total_duration
FROM Calls
GROUP BY 1, 2

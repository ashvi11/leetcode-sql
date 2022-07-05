(select '[0-5>' as bin, sum(case when duration < 300 then 1 else 0 end) as total from Sessions)
union
(select '[5-10>' as bin, sum(case when duration between 300 and 599 then 1 else 0 end) as total from Sessions)
union
(select '[10-15>' as bin, sum(case when duration between 600 and 899 then 1 else 0 end) as total from Sessions)
union
(select '15 or more' as bin, sum(case when duration >= 900 then 1 else 0 end) as total from Sessions)

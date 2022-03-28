
(select u.name as results from MovieRating mr, Users u 
where u.user_id = mr.user_id 
group by mr.user_id 
order by count(mr.user_id) desc, 1 asc limit 1)
union all
(select m.title as results from MovieRating mr, Movies m
where m.movie_id = mr.movie_id and mr.created_at like '2020-02%' 
group by mr.movie_id 
order by round(avg(mr.rating),1) desc, 1 asc limit 1)

with res1 as 
    (select exam_id, student_id, score, dense_rank() over(partition by exam_id order by score desc) as rnk_desc,
    dense_rank() over(partition by exam_id order by score) as rnk_asc 
    from Exam),
res2 as 
    (select distinct student_id 
     from res1 
     where rnk_desc = 1 or rnk_asc = 1)
     
select distinct student_id, student_name 
from Exam join Student using(student_id)
where student_id not in (select * from res2)
order by 1

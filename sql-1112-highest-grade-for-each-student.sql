select student_id, min(course_id) as course_id, grade from
(select *, RANK() over (partition by student_id order by grade desc) as 'rank' from Enrollments order by 1) temp 
where temp.rank = 1 
group by 1 
order by 1

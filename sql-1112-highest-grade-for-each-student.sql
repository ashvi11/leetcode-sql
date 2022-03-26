select student_id, min(course_id) as course_id, grade from
(select *, RANK() over (partition by student_id order by grade desc) as 'rank' from Enrollments) temp 
where temp.rank = 1 
group by 1 
order by 1

# temp is same as Enrollments but with rank. We want to find in which subject each student as got highest marks- so partition by student_id, and in case
# of a tie- that is student with id 2 scored 95 in two subject- 2, 3. So we choose subjet with smaller course_id which is 2. Hence min(course_id). 
# Since we used aggregated function min(), we should group it (group by). Then, order by student_id as per question.

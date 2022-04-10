
select dept_name, ifnull(count(s.student_id),0) as student_number 
from Student s right join Department d
on s.dept_id = d.dept_id
group by 1 
order by 2 desc, 1

# group by d.dept_id also works

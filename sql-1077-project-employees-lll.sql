select project_id, employee_id 
from (select p.project_id, e.employee_id, e.experience_years, 
rank() over (partition by p.project_id order by e.experience_years desc) as 'rank1' from Project p, Employee e where p.employee_id = e.employee_id)temp
where rank1 = 1

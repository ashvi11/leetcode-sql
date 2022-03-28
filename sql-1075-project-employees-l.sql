select p.project_id, round(avg(e.experience_years),2) as average_years
from Project p, Employee e 
where e.employee_id = p.employee_id
group by project_id

select manager.employee_id, manager.name, count(e.reports_to) as reports_count, round(sum(e.age)/count(e.age)) as average_age 
from Employees e, Employees manager 
where e.reports_to = manager.employee_id 
group by manager.employee_id 
order by 1

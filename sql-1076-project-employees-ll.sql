select project_id from
(select project_id, count(project_id), rank() over (order by count(employee_id) desc) as 'rank1' from Project group by project_id) temp
where rank1 = 1 

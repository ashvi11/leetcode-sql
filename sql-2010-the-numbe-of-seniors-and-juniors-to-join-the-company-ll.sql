Approach 1-
with junior_senior as (
    select employee_id, experience, sum(salary) over(partition by experience order by salary rows between unbounded preceding and current row) as running_salary
    from Candidates
    order by experience, running_salary
    )
    
select employee_id
from junior_senior
where experience = 'Senior' and running_salary <= 70000 
union
select employee_id
from junior_senior
where experience = 'Junior' and running_salary <= 70000- (select ifnull(max(running_salary),0) from junior_senior where experience = 'Senior' and running_salary <= 70000)

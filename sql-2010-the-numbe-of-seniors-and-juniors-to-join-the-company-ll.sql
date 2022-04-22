# Approach 1-
# shorter version of approach 
# shorter version of approach 2 and 3. For more detailed information, see approach 3

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


# Approach 2-
# shorter version of approach 3. For more detailed information, see approach 3
# make a table with partition between junior and senior
# make a table hired_senior which will hire(count) all seniors with running salary <= 70,000
# make a table hired_junior which will hire(count) all juniors with running salary <= remaining_budget
# union both these table

with junior_senior as (
    select employee_id, experience, 
    sum(salary) over(partition by experience order by salary rows between unbounded preceding and current row) as running_salary
    from Candidates
    order by experience, running_salary),
    
hired_seniors as (
    select employee_id
    from junior_senior
    where running_salary <= 70000 and experience = 'Senior'),

hired_juniors as (
    select employee_id
    from junior_senior
    where running_salary <= 70000-(select ifnull(max(running_salary),0) from junior_senior where running_salary <= 70000 and experience = 'Senior') and experience = 'Junior')

select * from hired_seniors
union
select * from hired_juniors


# Approach 3-
# make a table senior and a table junior with running salaries- 2 tables here
# make a table hired_senior which will hire(count) all seniors with running salary <= 70,000- 1 table
# make a table remaining_salary which will calculate how much budget is remaining afte hiring the last person from senio table- 1 table
# make a table hired_junior which will hire(count) all juniors with running salary <= remaining_budget- 1 table
# union both count tables

with seniors as
  (select employee_id, salary, sum(salary) over(order by salary rows between unbounded preceding and current row) as running_salary
  from Candidates c
  where experience = 'Senior'
  order by salary),

hired_seniors as
  (select employee_id
  from seniors
  where running_salary <= 70000),

remaining_budget as 
  (select 70000 - ifnull(max(running_salary),0) as remaining
  from seniors
  where running_salary <= 70000),

juniors as
  (select employee_id, salary, sum(salary) over(order by salary rows between unbounded preceding and current row) as running_salary
  from Candidates c
  where experience = 'Junior'
  order by salary),

hired_juniors as
  (select employee_id 
  from juniors cross join remaining_budget
  where running_salary <= remaining)

select * from hired_seniors
union
select * from hired_juniors



# Approach 1-
# make a table senior and a table junior with running salaries- 2 tables here
# make a table hired_senior which will hire(count) all seniors with running salary <= 70,000- 1 table
# make a table remaining_salary which will calculate how much budget is remaining afte hiring the last person from senio table- 1 table
# make a table hired_junior which will hire(count) all juniors with running salary <= remaining_budget- 1 table
# join both count tables

with seniors as
  (select employee_id, salary, sum(salary) over(order by salary rows between unbounded preceding and current row) as running_salary
  from Candidates c
  where experience = 'Senior'
  order by salary),

hired_seniors as
  (select count(distinct employee_id) as accepted_seniors
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
  (select count(distinct employee_id) as accepted_juniors 
  from juniors cross join remaining_budget
  where running_salary <= remaining)

select 'Senior' as experience, accepted_seniors as accepted_candidates from hired_seniors
union
select 'Junior' as experience, accepted_juniors as accepted_candidates from hired_juniors



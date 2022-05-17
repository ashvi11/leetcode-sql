# Approach 1- NOT USING GROUP BY- directly do partition by and find max within that partition
select company_id, employee_id, employee_name,
(case when max(salary) over(partition by company_id) < 1000 then salary
when max(salary) over(partition by company_id) between 1000 and 10000 then round(salary-salary*24/100,0)
else round(salary-salary*49/100,0)
end) as salary
from Salaries

# Approach 2- USING GROUP BY- get max salary for each company and then map it using join
with res1 as (select company_id, max(salary) as max_sal from Salaries
group by company_id)

select Salaries.company_id, Salaries.employee_id, Salaries.employee_name,
(case when max_sal < 1000 then salary
when max_sal between 1000 and 10000 then round(salary-salary*24/100,0)
else round(salary-salary*49/100,0)
end) as salary
from Salaries left join res1
on Salaries.company_id = res1.company_id

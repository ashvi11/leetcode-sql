select employee_id, 
(case when employee_id % 2 != 0 and name not like 'M%' then salaryelse 0 end) as bonus
from Employees

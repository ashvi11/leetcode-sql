# Approach 1- Recursive CTE
with recursive cte as
(select employee_id, employee_name, manager_id from Employees where employee_id = 1
union
select e.employee_id, e.employee_name, e.manager_id from Employees e, cte c
where c.employee_id = e.manager_id)
 
select employee_id from cte where employee_id != 1

# Approach 2- self- not ideal- very naive
select employee_id 
from Employees 
where manager_id = 1 and employee_id != 1
union
select employee_id 
from Employees 
where manager_id in (select employee_id from Employees where manager_id = 1 and employee_id != 1)
union
select employee_id 
from Employees 
where manager_id in (select employee_id from Employees where manager_id in (select employee_id from Employees where manager_id = 1 and employee_id != 1))

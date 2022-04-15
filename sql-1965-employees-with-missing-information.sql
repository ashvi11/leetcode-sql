
#Approach 1- Outer Join both tables, select rows with null name or null salary
select employee_id from 
  (select * from Employees e left join Salaries s using(employee_id)
  union 
  select * from Employees e right join Salaries s using(employee_id)) temp
where name is null or salary is null
order by 1

#Approach 2- Union on two tables- both has employee ids not in the other table
select * from 
(select employee_id from Employees where employee_id not in (select employee_id from Salaries)
union
select employee_id from Salaries where employee_id not in (select employee_id from Employees)) temp
order by 1

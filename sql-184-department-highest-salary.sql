select d.name as Department, temp.name as Employee, temp.Salary from 
Department d,
(select id, name, salary, departmentId, RANK() over (partition by departmentId order by salary desc) as 'rank' from Employee) temp 
where d.id = temp.departmentId and temp.rank = 1;

# Here, I have partitioned rank by department, that is, I want only 1 ranked salary from each department. So I created a 'temp' table which is same as
# Employee table but with rank. And instead of joining Employee table, I joined this table with a condition rank = 1

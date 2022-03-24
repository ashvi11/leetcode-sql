
select name, bonus 
from Employee e left join Bonus b on e.empId = b.empId 
where b.Bonus < 1000 or b.Bonus is null

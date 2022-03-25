select emp.name as Employee
from Employee manager, Employee emp 
where manager.id = emp.managerId and manager.salary < emp.salary

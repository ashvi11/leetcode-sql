select name as Customers 
from Customers C 
where C.id not in (select customerId from Orders);

#naive and incorrect approach:
select name as Customers from Customers where name not in (select name from Customers c, Orders o where c.id = o.customerId)

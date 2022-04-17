# Approach 1- self
select name 
from SalesPerson 
where sales_id not in (select sales_id  from Orders o, Company c where o.com_id = c.com_id and c.name = 'RED')


# Approach 2- self
select name 
from SalesPerson 
where name not in (select sp.name from SalesPerson sp, Company c, Orders o  where c.com_id = o.com_id and sp.sales_id = o.sales_id and c.name = "RED")

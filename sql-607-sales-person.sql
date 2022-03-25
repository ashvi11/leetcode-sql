select name 
from SalesPerson 
where name not in (select sp.name from SalesPerson sp, Company c, Orders o  where c.com_id = o.com_id and sp.sales_id = o.sales_id and c.name = "RED")

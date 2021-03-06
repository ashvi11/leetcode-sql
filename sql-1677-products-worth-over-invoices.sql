
select p.name, ifnull(sum(i.rest),0) as rest, ifnull(sum(i.paid),0) as paid, ifnull(sum(i.canceled),0) as canceled, ifnull(sum(i.refunded),0) as refunded 
from Product p left join Invoice i on p.product_id = i.product_id 
group by 1 
order by 1


# used left join because we wanted products even if they are not on invoices- this will make their value null in the restult, 
# so used ifnull() to convert it to 0

select w.name as warehouse_name, sum(width*length*height*w.units) as volume 
from Products p, Warehouse w
where p.product_id = w.product_id
group by w.name

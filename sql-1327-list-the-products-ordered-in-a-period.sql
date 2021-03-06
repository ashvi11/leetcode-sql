select p.product_name, sum(o.unit) as unit from Products p, Orders o 
where p.product_id = o.product_id and o.order_date between '2020-02-01' and '2020-02-29'
group by 1
having sum(o.unit) >= 100

# can also use where o.order_date like '2020-02%' instead of between- this also works

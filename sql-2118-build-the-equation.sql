with res as(
select power,
    (case when power = 1 then
        (case when factor >= 0 then concat('+',factor,'X')
        when factor < 0 then concat('-',abs(factor),'X') 
        end)
    when power = 0 then
        (case when factor >= 0 then concat('+',factor)
        when factor < 0 then concat('-',abs(factor)) 
        end)
    else
        (case when factor >= 0 then concat('+',factor,'X','^',power)
        when factor < 0 then concat('-',abs(factor),'X','^',power) 
        end)
    end) as terms
from Terms)

SELECT concat(group_concat(terms order by power desc separator ""),'=0') AS equation
FROM res;

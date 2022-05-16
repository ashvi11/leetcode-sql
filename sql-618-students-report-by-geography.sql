with America as
    (select name, row_number() over(order by name) as rn from Student
    where continent = 'America'),
Asia as
    (select name, row_number() over(order by name) as rn from Student
    where continent = 'Asia'),
Europe as
    (select name, row_number() over(order by name) as rn from Student
    where continent = 'Europe')
    
select America.name as America, Asia.name as Asia, Europe.name as Europe
from America left join Asia using(rn) left join Europe using(rn)

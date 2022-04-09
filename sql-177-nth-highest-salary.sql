    with res as (select salary, dense_rank() over (order by salary desc) as rnk 
    from Employee)

    select 
    case when count(*) >= 1 then salary
    else null
    end
    as getNthHighestSalary
    from res where rnk = n
    
    # here, if there are more than 1 rows with rank = n, show salary, else show null
 

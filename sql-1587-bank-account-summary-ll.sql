select name, sum(amount) as balance 
from Transactions t, Users u
where t.account = u.account
group by 1
having sum(amount) > 10000

select account_id, day, sum(case when type = 'Deposit' then amount else -1*amount end) over(partition by account_id order by day) as balance
from Transactions
order by 1, 2

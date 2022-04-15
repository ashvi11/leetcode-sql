select * 
from Users
where regexp_like(mail, '^[a-z]+[a-z0-9_.-]*@leetcode[.]com')

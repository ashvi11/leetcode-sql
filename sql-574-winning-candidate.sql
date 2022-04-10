#Approach 1

with res as
(select c.name , count(v.id) as total from Candidate c, Vote v 
where c.id = v.candidateId
group by v.candidateId)

select name from res order by total desc limit 1

#Approach 2- WINDOW FUNCTION

with res as 
(select c.name, rank() over (order by count(v.id) desc) as rnk from Candidate c, Vote v 
where c.id = v.candidateId
group by v.candidateId)

select name from res where rnk = 1

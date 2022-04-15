select question_id as survey_log from
(select question_id, 
count(case when action = 'answer' then question_id else null end)/ 
count(case when action = 'show' then question_id else null end) 
as total
from SurveyLog 
group by 1) temp
order by total desc, 1 asc
limit 1

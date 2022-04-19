# approach 1
select left_operand, operator, right_operand,
(case 
 when operator = '<' then
    case when v1.value < v2.value then 'true' else 'false' end
when operator = '>' then
    case when v1.value  > v2.value then 'true' else 'false' end
else 
     case when v1.value  = v2.value then 'true' else 'false' end
 end) as value
from Expressions e, Variables v1, Variables v2 
where v1.name = e.left_operand and v2.name = e.right_operand

#approach 2 (same but using if())
select left_operand, operator, right_operand,
(case 
 when operator = '<' then
     if(v1.value < v2.value,'true','false')
when operator = '>' then
    if(v1.value > v2.value,'true','false')
else 
     if(v1.value = v2.value,'true','false')
 end) as value
from Expressions e, Variables v1, Variables v2 
where v1.name = e.left_operand and v2.name = e.right_operand

select score, DENSE_RANK() OVER (order by score desc) as 'rank' 
from Scores;

# use '' quotes to name the column rank- otherwise it'll throw syntax error

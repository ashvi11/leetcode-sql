select min(log_id) as start_id, max(log_id) as end_id 
from
    (select log_id, row_number()over(order by log_id) as rn, 
     log_id- row_number()over(order by log_id) as flag
    from logs) temp1
group by flag


# WE CAN ALSO USE rank() INSTEAD OF row_number()
#Here, we are looking at 3 columns- log_id, row number, and their difference(flag). 
#Row numbers are continuous. So, if two log_ids are continuous, their difference with row_number will be equal. Eg:
#+------------+--------------+----------------+
#| log_id     | rn           |flag            |
#+------------+--------------+----------------+
#| 1          | 1           | 0               |
#| 2          | 2           | 0               |
#| 3          | 3           | 0               |
#| 7          | 4           | 3               |
#| 8          | 5           | 3               |
#| 10         | 6           | 4               | 
#+------------+--------------+----------------+

#Here we see that 1,2,3 are continuous, so their flag is 0. This way, we will group by flag and get min and max values of that group.

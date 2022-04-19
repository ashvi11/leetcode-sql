select ifnull(round(count(distinct ra.requester_id, ra.accepter_id)/count(distinct fr.sender_id, fr.send_to_id),2),0) as accept_rate  
from RequestAccepted ra, FriendRequest fr

#count from 1 table, count from other table, division, round, ifnull

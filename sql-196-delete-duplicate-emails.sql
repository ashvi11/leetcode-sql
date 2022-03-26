
DELETE p1
FROM Person p1, person p2
WHERE p1.email = p2.email and p1.id > p2.id;

# if p1's id is higher than p2's id, deleter that row from p1

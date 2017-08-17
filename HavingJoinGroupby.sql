SELECT h.hacker_id, h.name, count(h.hacker_id) as challenge_count
FROM hackers as h
INNER JOIN challenges as c
ON h.hacker_id = c. hacker_id
group by h.hacker_id, h.name

having 
    count(h.hacker_id) =
        (SELECT MAX(temp.hacker_count)
            FROM (SELECT count(hacker_id) as hacker_count
                 FROM challenges
                 group by hacker_id) temp)
    or
    
    count(h.hacker_id) in 
        (SELECT temp2.hacker_count2
            FROM(SELECT count(hacker_id) hacker_count2
                from challenges 
                group by hacker_id) temp2
            group by temp2.hacker_count2
            having count(temp2.hacker_count2) = 1)
                 
                 
order by challenge_count desc, h.hacker_id 

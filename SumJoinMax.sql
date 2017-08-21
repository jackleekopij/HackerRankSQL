SELECT joint.hack, h.name, sum(joint.max_score) total_score --Return the values, hacker_id, name and sum of max scores
FROM (SELECT s.hacker_id as hack,  max(s.score) max_score   -- Create a nested select to return the id and max score
    FROM SUBMISSIONS s                              
    WHERE s.score >0                                        -- Ensure value is greater than zero
    GROUP BY s.hacker_id, s.challenge_id                    -- Aggregate by hacker_id, and challenge_id
    ) joint
INNER JOIN HACKERS h          
ON joint.hack = h.hacker_id                                  -- Join to the hacker table to get names
GROUP BY joint.hack, h.name                                  -- Group by both the hacker_id and name. Should be one to one relation
ORDER BY total_score desc, joint.hack                        -- Order by appropriate value

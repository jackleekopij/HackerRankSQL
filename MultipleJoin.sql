
SELECT h.hacker_id, h.name  -- Return hacker_id and name
   FROM Submissions as s
   INNER JOIN Challenges as c                   -- DO inner join on challenge_id
   ON s.challenge_id = c.challenge_id
   INNER JOIN Difficulty as d 
   ON c.Difficulty_level = d.Difficulty_level   -- Do inner join to adddifficulty level
   INNER JOIN Hackers as h
   ON s.hacker_id = h.hacker_id                 -- Do inner join to add hacker_id
   where s.score = d.score and c.difficulty_level = d.difficulty_level -- Only return values when hacker scor is equal to the boundary condition.
                                                                       -- and the two difficulty levels are meet. IMPORTANT for the question.
   GROUP BY h.hacker_id, h.name                 --
   HAVING count(s.hacker_id) > 1                -- Only take hackers that recieved 100% in more than 1 test.
   ORDER BY  count(s.hacker_id) desc, h.hacker_id asc     -- Oder by the number of counts of comptetions scored 100 on and then by hacker_id
   

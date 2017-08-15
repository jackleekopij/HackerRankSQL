SELECT w.id, wp.age, w.coins_needed, w.power              -- Select the id, age, coins_needed and power
FROM Wands w
INNER JOIN Wands_Property wp
ON w.code = wp.code and                                   -- Join on multiple properties. Start with the the codes. 
w.coins_needed = (select min(coins_needed) from Wands w1 join Wands_Property wp1 on (w1.code = wp1.code) and (w1.power = w.power) and (wp1.age = wp.age))
-- Then do a further join to get where the coins_needed in the wand table are equal to min coins needed from the joined table.
WHERE wp.is_evil = 0
ORDER BY w.power desc, wp.age desc

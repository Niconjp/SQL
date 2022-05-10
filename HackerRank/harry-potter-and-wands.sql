/* https://www.hackerrank.com/challenges/harry-potter-and-wands/problem */

SELECT W.id,WP.age,W.coins_needed,W.power 
FROM Wands W
INNER JOIN Wands_Property WP
ON WP.code = W.code
WHERE WP.is_evil = 0 AND W.coins_needed = (SELECT MIN(W2.coins_needed) 
                                           FROM Wands W2
                                           INNER JOIN Wands_Property WP2
                                           ON WP2.code = W2.code 
                                           WHERE WP2.age = WP.age AND W2.power = W.power)
ORDER BY W.power DESC, WP.age DESC

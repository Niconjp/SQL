/* https://www.hackerrank.com/challenges/full-score/problem */

SELECT H.hacker_id,H.name 
FROM Hackers H

INNER JOIN Submissions S
ON S.hacker_id = H.hacker_id

INNER JOIN Challenges C
ON C.challenge_id = S.challenge_id

INNER JOIN Difficulty D
On D.difficulty_level = C.difficulty_level

WHERE S.score = D.score AND D.difficulty_level = C.difficulty_level
GROUP BY H.hacker_id,H.name
HAVING count(S.hacker_id) > 1
ORDER BY count(S.hacker_id) DESC, S.hacker_id ASC

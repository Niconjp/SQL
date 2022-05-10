/* https://www.hackerrank.com/challenges/contest-leaderboard/problem */

SELECT H.hacker_id,H.name,SUM(NS.score) AS TS 
FROM(SELECT S.hacker_id,max(S.score) AS score
     FROM Submissions S
     WHERE score != 0
     GROUP BY S.hacker_id,S.challenge_id) as NS

INNER JOIN Hackers H
ON H.hacker_id = NS.hacker_id
GROUP BY H.hacker_id,H.name
ORDER BY TS DESC, H.hacker_id ASC

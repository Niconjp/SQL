/* https://www.hackerrank.com/challenges/challenges/problem */

SELECT H.hacker_id,H.name,count(C.challenge_id) AS tc
FROM Hackers H
INNER JOIN Challenges C
ON C.hacker_id = H.hacker_id
GROUP BY H.hacker_id,H.name
HAVING 
      tc = (SELECT max(nt.mx)
            FROM (SELECT count(Challenge_id) AS mx 
                  FROM Challenges  
                  GROUP BY hacker_id 
                  ORDER BY hacker_id) as nt)
      OR tc IN  (SELECT tn.ct
                 FROM (SELECT count(*) AS ct
                       FROM Challenges
                       GROUP BY hacker_id) tn
                 GROUP BY tn.ct
                 HAVING COUNT(tn.ct) = 1)
ORDER BY tc DESC,H.hacker_id

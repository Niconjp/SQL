/* https://www.hackerrank.com/challenges/placements/problem */


SELECT S.Name
FROM Students S

INNER JOIN Friends F
ON S.ID = F.ID

INNER JOIN packages P
ON F.ID = P.ID

INNER JOIN packages P2
ON F.Friend_id = P2.ID

WHERE P.Salary < P2.Salary
ORDER BY P2.Salary;

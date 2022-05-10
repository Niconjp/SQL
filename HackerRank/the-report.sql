/* https://www.hackerrank.com/challenges/the-report/problem */

SELECT IF(G.Grade<8,'NULL',S.Name),G.Grade,S.Marks 
FROM Grades G
INNER JOIN Students S
ON S.marks Between G.Min_Mark AND G.Max_Mark
ORDER BY G.Grade DESC,S.NAME 

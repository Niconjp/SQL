/* https://www.hackerrank.com/challenges/earnings-of-employees/problem */

SELECT (months * salary) AS e,COUNT(*) 
FROM Employee 
GROUP BY e 
ORDER BY e DESC LIMIT 1;

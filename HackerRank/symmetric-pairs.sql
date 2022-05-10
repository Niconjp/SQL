/* https://www.hackerrank.com/challenges/symmetric-pairs/problem */

SELECT F1.X,F1.Y 
FROM Functions F1

INNER JOIN Functions F2
ON F1.X = F2.Y AND F2.X = F1.Y

GROUP BY F1.X,F1.Y
HAVING COUNT(F1.X)>1 OR F1.X<F1.Y
ORDER BY F1.X

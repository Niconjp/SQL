/* https://www.codewars.com/kata/58167fa1f544130dcf000317/sql */

/* SQL Statistics: MIN, MEDIAN, MAX */

/* 5 kyu */

SELECT 
  MIN(score), 
  percentile_cont(0.5) WITHIN GROUP (ORDER BY score) AS median, 
  MAX(score) 
FROM result

/* https://www.codewars.com/kata/589cf45835f99b2909000115/sql */

/* Calculating Running Total */

/* 5 kyu */

SELECT 
  CAST(created_at AS date) AS DATE,
  COUNT(*) AS COUNT,
  CAST(SUM(count(created_at)) OVER (ORDER BY CAST(created_at AS date) ROW UNBOUNDED PRECEDING) AS int) AS total
FROM posts
GROUP BY DATE
ORDER BY DATE

/* https://www.codewars.com/kata/582cb0224e56e068d800003c/sql */

/* 8 kyu */

/* Keep Hydrated! */

SELECT
  id,
  hours,
  FLOOR(hours * 0.5) AS liters
FROM 
  cycling

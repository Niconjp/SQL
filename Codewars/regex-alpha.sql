/* https://www.codewars.com/kata/594257d4db68b6e99200002c/sql */

/* SQL: Regex AlphaNumeric Split */

/*  6 kyu */

SELECT 
  project,
  REGEXP_REPLACE(address, '[[:digit:]]', '','g') AS letters,
  REGEXP_REPLACE(address, '[[:alpha:]]', '','g') AS numbers
FROM
  repositories

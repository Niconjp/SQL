/* https://www.codewars.com/kata/5943a58f95d5f72cb900006a/sql */

/* SQL: Right and Left */

/* 7 kyu */

SELECT
  LEFT(project,commits) AS project,
  RIGHT(address,contributors) AS address
FROM
  repositories

/* https://www.codewars.com/kata/5809575e166583acfa000083 */

/* SQL Basics: Simple table totaling. */

/* 6 kyu */


SELECT ROW_NUMBER() OVER(ORDER BY points DESC) AS rank,
      (CASE
          WHEN clan = '' THEN '[no clan specified]'
          ELSE clan
          END),SUM(points) AS total_points,COUNT(name) AS total_people
FROM people
GROUP BY clan,points

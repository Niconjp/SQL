/* https://www.codewars.com/kata/593ef0e98b90525e090000b9/sql */

/* SQL Basics - Monsters using CASE */

/* 6 kyu */

SELECT T.id,
       T.heads,
       B.legs,
       T.arms,
       B.tails,
       (CASE WHEN T.heads > T.arms OR B.tails > B.legs THEN 'BEAST'
             ELSE 'WEIRDO'
        END) AS species
FROM top_half AS T
INNER JOIN bottom_half AS B
ON B.id = T.id
ORDER BY species

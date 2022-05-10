/* https://www.codewars.com/kata/58164ddf890632ce00000220/sql */

/* SQL Basics: Simple HAVING */

/* 6 kyu */

SELECT age,count(age) AS total_people
FROM people
GROUP BY AGE
HAVING count(age) >= 10

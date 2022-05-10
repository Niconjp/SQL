/* https://www.codewars.com/kata/5817b124e7f4576fd00020a2/sql */

/* Relational division: Find all movies two actors cast in together */

/* 5 kyu */


SELECT title 
FROM film F
INNER JOIN  (SELECT film_id,count(film_id) AS countm 
             FROM film_actor
             WHERE actor_id = 105 OR actor_id = 122
             GROUP BY film_id) FA
ON FA.film_id = F.film_id
WHERE FA.countm >= 2
ORDER BY F.title ASC


/* optimization */

SELECT f.title
FROM film f
JOIN film_actor fa on fa.film_id = f.film_id
WHERE fa.actor_id IN (105,122)
GROUP BY f.film_id
HAVING COUNT(*) = 2
ORDER BY f.title ASC

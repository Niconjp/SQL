/* https://www.codewars.com/kata/5818bde9559ff58bd90004a2/sql */


/* Challenge: Two actors who cast together the most */

/* 4 kyu */

SELECT CONCAT(A.first_name,' ',A.last_name) AS first_actor,
       CONCAT(A2.first_name,' ',A2.last_name) AS second_actor,
       F.title AS title
INNER JOIN (SELECT NT.a1 AS a1,
                   NT.a2 AS a2,
                   NT2.film_id AS film_id
            FROM
                (SELECT COUNT(*) as Count,
                        FA1.actor_id AS a1,
                        FA2.actor_id AS a2
                FROM film_actor FA1
                INNER JOIN film_actor FA2
                ON FA2.film_id = FA1.film_id
                WHERE FA1.actor_id < FA2.actor_id
                GROUP BY a1,a2
                ORDER BY Count DESC
                LIMIT 1)NT
             INNER JOIN (SELECT FA1.actor_id AS a1,
                                FA2.actor_id AS a2,
                                FA1.film_id AS film_id
                         FROM film_actor FA1
                         INNER JOIN film_actor FA2
                         ON FA2.film_id = FA1.film_id
                         WHERE FA1.actor_id < FA2.actor_id 
                         )NT2
              ON NT2.a1 = NT.a1
              WHERE NT.a1 = NT2.a1 AND NT.a2 = NT2.a2
              GROUP BY NT.a1,NT.a2,NT2.film_id) FT
ON FT.a1 = A.actor_id 

INNER JOIN actor A2
ON A2.actor_id = FT.a2

INNER JOIN film F
ON F.film_id = FT.film_id

/* optimization */

with top_pair as (
  select a1.actor_id as id1, a2.actor_id as id2
  from film_actor a1
    inner join film_actor a2 on a1.film_id=a2.film_id
  where a1.actor_id <> a2.actor_id
  group by a1.actor_id, a2.actor_id
  order by count(a1.film_id) desc
  limit 1
)
select
(select first_name || ' ' || last_name from actor where actor_id = tp.id1) as first_actor,
(select first_name || ' ' || last_name from actor where actor_id = tp.id2) as second_actor,
  f.title as title
from top_pair tp
    inner join film_actor fa1 on tp.id1 = fa1.actor_id
    inner join film_actor fa2 on tp.id2 = fa2.actor_id
    inner join film f on fa1.film_id=f.film_id and fa2.film_id=f.film_id

/* https://www.codewars.com/kata/580918e24a85b05ad000010c/sql */

/* SQL Basics: Simple JOIN with COUNT */

/* 7 kyu */

SELECT p1.id,p1.name,count(t2.id) AS toy_count 
FROM people p1 
INNER JOIN toys t2
ON t2.people_id = p1.id
GROUP BY p1.id

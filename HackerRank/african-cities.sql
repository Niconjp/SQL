/* https://www.hackerrank.com/challenges/african-cities/problem */

SELECT C.name 
FROM CITY C
INNER JOIN country co
ON co.code = c.countrycode
WHERE co.continent = 'Africa'

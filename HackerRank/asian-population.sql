/* https://www.hackerrank.com/challenges/asian-population/problem */

SELECT SUM(c.POPULATION) 
FROM CITY C
INNER JOIN country co
ON co.code = c.countrycode
WHERE co.continent = 'Asia'

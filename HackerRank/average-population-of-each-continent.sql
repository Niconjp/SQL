/* https://www.hackerrank.com/challenges/average-population-of-each-continent/problem */

SELECT CO.CONTINENT,FLOOR(AVG(C.population)) 
FROM CITY C
INNER JOIN country co
ON co.code = c.countrycode
GROUP BY CO.continent

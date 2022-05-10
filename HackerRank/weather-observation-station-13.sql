/* https://www.hackerrank.com/challenges/weather-observation-station-13/problem */

SELECT TRUNCATE(SUM(S),4)
FROM (SELECT LAT_N AS S 
      FROM STATION 
      WHERE LAT_N BETWEEN 38.7880 AND 137.2345
      ) AS B

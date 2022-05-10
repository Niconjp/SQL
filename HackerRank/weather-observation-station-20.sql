/* https://www.hackerrank.com/challenges/weather-observation-station-20/problem */

SELECT Truncate(LAT_N,4)
FROM
    (SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS r
     FROM STATION 
     ) AS s
WHERE r = (SELECT ROUND((COUNT(LAT_N)+1)/2,0) 
           FROM STATION
           );

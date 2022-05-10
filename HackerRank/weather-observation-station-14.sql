/* https://www.hackerrank.com/challenges/weather-observation-station-14/problem */ 

SELECT TRUNCATE(LAT_N,4) AS S 
FROM STATION 
WHERE LAT_N < 137.2345 
ORDER BY S DESC LIMIT 1;

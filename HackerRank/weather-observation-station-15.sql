/* https://www.hackerrank.com/challenges/weather-observation-station-15/problem */

SELECT ROUND(LONG_W,4) AS S 
FROM STATION 
WHERE LAT_N < 137.2345 
ORDER BY LAT_N DESC LIMIT 1;

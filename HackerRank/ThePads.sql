/* https://www.hackerrank.com/challenges/the-pads/problem */

SELECT CONCAT(Name,"(",left(Occupation,1),")") FROM OCCUPATIONS ORDER BY Name;
SELECT "There are a total of ",count(Occupation) AS Oc,LOWER(CONCAT(Occupation,"s.")) FROM OCCUPATIONS GROUP BY Occupation ORDER BY Oc,Occupation

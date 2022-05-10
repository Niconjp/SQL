/* https://www.hackerrank.com/challenges/the-blunder/problem */

SELECT CEIL((avg(salary) - avg(replace(Salary,0,'')))) 
FROM EMPLOYEES;

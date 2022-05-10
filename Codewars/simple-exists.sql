/* https://www.codewars.com/kata/58113a64e10b53ec36000293/sql */

/* SQL Basics: Simple EXISTS */

/* 6 kyu */

SELECT D.id,D.name 
FROM departments AS D
WHERE EXISTS (SELECT * 
              FROM sales AS S 
              WHERE D.id = S.department_id AND S.price > 98.000)

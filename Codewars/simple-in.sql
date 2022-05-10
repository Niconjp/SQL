/* https://www.codewars.com/kata/58113c03009b4fcc66000d29/sql */

/* SQL Basics: Simple IN */

/* 6 kyu */

SELECT D.id,
       D.name
FROM departments D
WHERE D.id IN(SELECT S.department_id 
              FROM sales S 
              WHERE D.id = S.department_id AND price > 98.000)

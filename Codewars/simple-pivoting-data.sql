/* https://www.codewars.com/kata/58126aa90ea99769e7000119/sql */

/* SQL Basics: Simple PIVOTING data */

/* 5 kyu */

CREATE EXTENSION tablefunc;

SELECT * 
FROM  crosstab(
  'SELECT P.name, detail, COUNT(D.id)
  FROM products P
  INNER JOIN details D
  ON P.id = D.product_id
  GROUP BY P.name, D.detail
  ORDER BY 1,2')
  AS ct (name text,bad bigint,good bigint,ok bigint);

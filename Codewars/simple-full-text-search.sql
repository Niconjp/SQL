/* https://www.codewars.com/kata/581676828906324b8b00059e/sql */

/* SQL Basics: Simple FULL TEXT SEARCH */

/* 6 kyu */

SELECT id,name,price 
FROM product
WHERE to_tsvector(name) @@ to_tsquery('Awesome')

/* https://www.codewars.com/kata/5811315e04adbbdb5000050e/sql */

/* SQL Basics: Simple NULL handling */

/* 6 kyu */

SELECT id,coalesce(NULLIF(name,''),'[product name not found]') AS name,price,coalesce(NULLIF(card_name,''),'[card name not found]') AS card_name,
       card_number,transaction_date
FROM eusales
WHERE price > 50 

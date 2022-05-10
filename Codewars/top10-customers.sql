/* https://www.codewars.com/kata/580d08b5c049aef8f900007c/sql */

/* SQL Basics: Top 10 customers by total payments amount */

/* 6 kyu */

SELECT C.customer_id,C.email,PC.payments_count,TTA.total_amount
FROM customer C

INNER JOIN 
(SELECT RANK() OVER(ORDER BY total_amount DESC) as RANK,*
FROM
(SELECT cast(SUM(amount) AS FLOAT ) total_amount,customer_id
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC) TA) TTA
ON TTA.customer_id = C.customer_id

INNER JOIN
(select count(customer_id) as payments_count ,customer_id
FROM payment
GROUP BY customer_id) PC
ON PC.customer_id = TTA.customer_id

WHERE RANK <= 10
ORDER BY TTA.total_amount DESC

/* optimization */

SELECT
  customer.customer_id,
  customer.email,
  COUNT(payment.payment_id) AS payments_count,
  CAST(SUM(payment.amount) AS float) AS total_amount
FROM customer
JOIN payment
  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10

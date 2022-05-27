# https://www.codewars.com/kata/58111f4ee10b5301a7000175/sql

# 7 kyu

# SQL Basics: Simple GROUP BY

SELECT
  age,
  COUNT(*) AS people_count
FROM
  people
GROUP BY
  age

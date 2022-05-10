/* https://www.codewars.com/kata/582001237a3a630ce8000a41/sql */

/* Using Window Functions To Get Top N per Group */

/* 5 kyu */

SELECT C.id AS category_id,C.category,P.title,P.views,P.id AS post_id
FROM categories C
left JOIN (SELECT * FROM (select category_id,RANK() OVER(PARTITION BY category_id ORDER BY views DESC,id ASC) AS RANK,views,id,title 
            FROM posts          
           ) PP
           WHERE PP.RANK <=2
          ) P
ON P.category_id = C.id
ORDER BY C.category,P.Views DESC, post_id ASC

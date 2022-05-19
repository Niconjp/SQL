/* https://advancedsqlpuzzles.com/ */

/* PUZZLE #1 */

/* Shopping Carts */

DROP TABLE IF EXISTS #Cart1;
DROP TABLE IF EXISTS #Cart2;
GO

CREATE TABLE #Cart1
(Item VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE #Cart2
(
Item VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO #Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO #Cart2 VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

/*  */

SELECT 
    C1.Item AS 'Item Cart 1', 
    C2.Item AS 'Item Cart 2'
FROM 
    #cart1 C1
FULL OUTER JOIN #cart2 C2
    ON C2.Item = C1. Item;

/* https://www.hackerrank.com/challenges/draw-the-triangle-2/problem */

/* MS SQL Server */

DECLARE @var int                
SELECT @var = 1                  
WHILE @var <= 20                  
BEGIN                             
PRINT replicate('* ', @var)       
SET @var = @var + 1               
END

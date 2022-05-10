/* https://www.hackerrank.com/challenges/print-prime-numbers/problem */

/* MS SQL Server */

DECLARE @I INT=2
DECLARE @PRIME INT=0
DECLARE @OUTPUT TABLE (NUM INT)
WHILE @I<=1000
BEGIN
    DECLARE @J INT = @I-1
    SET @PRIME=1
    WHILE @J>1
    BEGIN
        IF @I % @J=0
        BEGIN
            SET @PRIME=0
        END
        SET @J=@J-1
    END
    IF @PRIME =1
    BEGIN
        INSERT @OUTPUT VALUES (@I)
    END
    SET @I=@I+1
END
SELECT string_agg(NUM, '&') FROM @OUTPUT;

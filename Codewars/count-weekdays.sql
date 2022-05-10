/* https://www.codewars.com/kata/58241d05e7a162c5b100010f */

/* Count Weekdays */

/* 5 kyu */

CREATE OR REPLACE FUNCTION weekdays(DATE, DATE) returns INTEGER
AS
$$
BEGIN
return COUNT(days)::INT
FROM generate_series(least($1, $2),greatest($1, $2), '1 day')
AS days
WHERE extract(DOW FROM days) NOT IN (0,6);
END;
$$ 
language plpgsql;

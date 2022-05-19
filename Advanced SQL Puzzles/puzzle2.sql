/* https://advancedsqlpuzzles.com/ */

/* PUZZLE #2 */

/* Managers and Employees */

DROP TABLE IF EXISTS #Employees;
GO

CREATE TABLE #Employees
(
EmployeeID  INTEGER PRIMARY KEY,
ManagerID   INTEGER,
JobTitle    VARCHAR(100),
Salary      INTEGER
);
GO

INSERT INTO #Employees VALUES
(1001,NULL,'President',185000),(2002,1001,'Director',120000),
(3003,1001,'Office Manager',97000),(4004,2002,'Engineer',110000),
(5005,2002,'Engineer',142000),(6006,2002,'Engineer',160000);
GO


/*  */

WITH depthLevel AS (
    SELECT EmployeeID,
         ManagerID,
         JobTitle,
         Salary,
         0 AS Depth
    FROM 
      #Employees
    WHERE 
      ManagerID IS NULL
 
UNION ALL
 
    SELECT E2.EmployeeID,
         E2.ManagerID,
         E2.JobTitle,
         E2.Salary,
         Depth+1 AS Depth
    FROM 
      #Employees E2
    JOIN depthLevel DL
      ON DL.EmployeeID = E2.ManagerID
)

SELECT *
FROM
  depthLevel

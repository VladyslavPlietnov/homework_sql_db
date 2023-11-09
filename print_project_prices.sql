SELECT ID AS NAME,( (
    SELECT SUM(SALARY)
    FROM project_worker
    WHERE ID = PROJECT_ID
)*DATEDIFF(FINISH_DATE, START_DATE)/30) AS PRICE 
FROM project;
SELECT DATEDIFF(FINISH_DATE, START_DATE), ID
FROM project
GROUP BY ID;
SELECT*FROM project;

CREATE TABLE length_of_project(
    ID INT PRIMARY KEY, 
    DAYS INT, 
    FOREIGN KEY(ID) REFERENCES project(ID)
);
INSERT length_of_project VALUES(1, NULL);
INSERT length_of_project VALUES(2, NULL);
INSERT length_of_project VALUES(3, NULL);
INSERT length_of_project VALUES(4, NULL);
INSERT length_of_project VALUES(5, NULL);
INSERT length_of_project VALUES(6, NULL);
INSERT length_of_project VALUES(7, NULL);
INSERT length_of_project VALUES(8, NULL);
INSERT length_of_project VALUES(9, NULL);
INSERT length_of_project VALUES(10, NULL);

UPDATE length_of_project 
SET DAYS = (
    SELECT DATEDIFF(FINISH_DATE, START_DATE)
FROM project
WHERE length_of_project.ID = project.ID
);
SELECT*
FROM length_of_project
WHERE DAYS = (SELECT MAX(DAYS)
FROM length_of_project);

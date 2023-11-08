SELECT COUNT(CLIENT_ID), CLIENT_ID
FROM project
GROUP BY CLIENT_ID;

CREATE TABLE client_number(
    CLIENT_ID INT PRIMARY KEY, 
    COUNT_NUMBER INT, 
    FOREIGN KEY(CLIENT_ID) REFERENCES project(CLIENT_ID)
);
INSERT INTO client_number VALUES(1, NULL);
INSERT INTO client_number VALUES(2, NULL);
INSERT INTO client_number VALUES(3, NULL);
INSERT INTO client_number VALUES(4, NULL);
INSERT INTO client_number VALUES(5, NULL);

UPDATE client_number
SET COUNT_NUMBER = (
    SELECT COUNT(CLIENT_ID)
    FROM project
    WHERE project.CLIENT_ID = client_number.CLIENT_ID 
 );
 SELECT*FROM client_number;

SELECT*
FROM client
WHERE id = (
    SELECT CLIENT_ID
    FROM client_number
    WHERE COUNT_NUMBER = (
        SELECT MAX(COUNT_NUMBER)
        FROM client_number
    ) AND id = CLIENT_ID
);

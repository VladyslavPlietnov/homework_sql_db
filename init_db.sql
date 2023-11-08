CREATE TABLE worker (
    id INT PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL,
    CHECK (NAME LIKE '__%'),
    BIRTHDAY DATE, 
    CHECK (BIRTHDAY >= '1901.01.01'),
    LEVEL VARCHAR(10),
    CHECK(LEVEL = 'Trainee' 
    OR LEVEL = 'Junior' 
    OR LEVEL = 'Middle' 
    OR LEVEL = 'Senior'),
    SALARY INT,
    CHECK (SALARY >=100 AND SALARY <=100000)
);
INSERT INTO worker VALUES (2, 'Telepusik', '1901.12.07', 'Senior',50000);
SELECT * FROM worker;
INSERT INTO worker VALUES (3, 'Luntik', '1902.12.07', 'Senior',50000);
INSERT INTO worker VALUES (4, 'Luntik', '1902.12.07', 'Trainee',101);
INSERT INTO worker VALUES (5, 'Li', '1902.12.07', 'Trainee',101);

INSERT INTO worker VALUES (6, 'Mickey Mouse', '1902.09.07', 'Junior',200);
INSERT INTO worker VALUES (7, 'SpongeBob Square Pants', '1999.11.11', 'Junior',207);
INSERT INTO worker VALUES (8, 'Homer J. Simpson', '1989.07.23', 'Junior',193);
INSERT INTO worker VALUES (9, 'Donald Duck', '1934.03.27', 'Middle',37500);
INSERT INTO worker VALUES (10, 'Pikachu', '1996.10.17', 'Middle',42100);
INSERT INTO worker VALUES (11, 'Eric Cartman ', '1997.06.18', 'Senior',100000);

CREATE TABLE client (
    id INT PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL,
    CHECK (NAME LIKE '__%')
);
 INSERT INTO client VALUES(1,'Jeff Bezos');
 INSERT INTO client VALUES(2,'Bill Gates');
 INSERT INTO client VALUES(3,'Elon Musk');
 INSERT INTO client VALUES(4,'Mark Zuckerberg');
 INSERT INTO client VALUES(5,'Billie Eilish');
 SELECT * FROM client;

CREATE TABLE project (
    ID INT PRIMARY KEY,
    CLIENT_ID INT,
    FOREIGN KEY(CLIENT_ID) REFERENCES client(id) ON DELETE CASCADE,
    START_DATE DATE,
    FINISH_DATE DATE
);

INSERT INTO project VALUES(1, 5, '2025.07.01','2025.11.30');
INSERT INTO project VALUES(2, 5, '2025.07.01','2027.11.30');
INSERT INTO project VALUES(3, 5, '2025.07.01','2025.11.30');
INSERT INTO project VALUES(4, 2, '1937.07.01','1939.11.30');
INSERT INTO project VALUES(5, 2, '1985.01.01','1985.09.30');
INSERT INTO project VALUES(6, 3, '2000.04.01','2003.07.30');
INSERT INTO project VALUES(7, 1, '2014.01.01','2017.11.30');
INSERT INTO project VALUES(8, 4, '2011.03.01','2013.11.30');
INSERT INTO project VALUES(9, 1, '2009.04.01','2012.11.30');
INSERT INTO project VALUES(10, 2, '2020.07.10','2025.11.30');
SELECT * FROM project;

CREATE TABLE project_worker (
    PROJECT_ID INT,
    WORKER_ID INT,
    PRIMARY KEY(PROJECT_ID,WORKER_ID),
    FOREIGN KEY(PROJECT_ID) REFERENCES project(ID), 
    FOREIGN KEY(WORKER_ID) REFERENCES worker(id)
);

INSERT INTO project_worker VALUES(5,2);
INSERT INTO project_worker VALUES(1,4);
INSERT INTO project_worker VALUES(10,4);
INSERT INTO project_worker VALUES(1,7);
INSERT INTO project_worker VALUES(10,10);
INSERT INTO project_worker VALUES(5,9);
INSERT INTO project_worker VALUES(7,9);
INSERT INTO project_worker VALUES(10,8);
INSERT INTO project_worker VALUES(7,5);
INSERT INTO project_worker VALUES(8,10);
INSERT INTO project_worker VALUES(9,6);
INSERT INTO project_worker VALUES(1,3);
INSERT INTO project_worker VALUES(9,3);
INSERT INTO project_worker VALUES(10,2);
INSERT INTO project_worker VALUES(8,2);
INSERT INTO project_worker VALUES(10,7);
INSERT INTO project_worker VALUES(1,6);
INSERT INTO project_worker VALUES(8,8);
INSERT INTO project_worker VALUES(9,11);
INSERT INTO project_worker VALUES(10,11);
INSERT INTO project_worker VALUES(2,4);
INSERT INTO project_worker VALUES(6,2);
INSERT INTO project_worker VALUES(4,2);
INSERT INTO project_worker VALUES(3,4);
INSERT INTO project_worker VALUES(6,3);
INSERT INTO project_worker VALUES(3,11);
INSERT INTO project_worker VALUES(4,7);
INSERT INTO project_worker VALUES(2,3);

SELECT *FROM project_worker ORDER BY PROJECT_ID;
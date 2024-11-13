-- DDL
CREATE DATABASE UI;

USE UI;

BACKUP DATABASE UI
TO DISK = 'path';

RESTORE DATABASE UI
FROM DISK = 'path';

DROP DATABASE UI;

CREATE TABLE EMP
(
	eid INT PRIMARY KEY,
	ename VARCHAR(20) NOT NULL,
	eadd VARCHAR(20) DEFAULT 'cairo',
	hiredate DATE DEFAULT GETDATE(), --builtin function, get date gets current system date.
	salary INT DEFAULT 5000,
	age INT,
	dnum INT
);

ALTER TABLE EMP ADD overtime INT;
ALTER TABLE EMP DROP COLUMN overtime;
ALTER TABLE EMP ALTER COLUMN overtime BIGINT;

DROP TABLE EMP; --this deletes both data and meta data.

-- DML
-- insert update delete
INSERT INTO EMP
VALUES (1, 'Ahmed', 'Alex', '1/1/2000', 12500, 21, NULL);

INSERT INTO EMP
VALUES (2, 'Mohamed', 'Arish', '1/1/2000', 12500, 23, NULL),(3, 'Ali', 'Cairo', '1/1/2000', 12500, 24, NULL);
	--  ^^ inserts several employees at the same time ^^

UPDATE EMP
SET eadd = 'Mansoura'; -- updates all rows

UPDATE EMP
SET eadd = 'Ismailia'
WHERE eid = 2;

UPDATE EMP
SET eadd = 'Alex', salary+=8500
WHERE eid = 2;

DELETE FROM EMP
WHERE eid = 1;

DELETE FROM EMP; -- deletes all rows

-- DQL
-- select
SELECT *
FROM EMP; -- select all rows from employee table

SELECT *
FROM EMP
WHERE eadd = 'Arish';

SELECT eid, ename
FROM EMP;

SELECT eid, ename
FROM EMP
WHERE eadd = 'Arish';

SELECT ename+' '+eadd as namePlusAddress
FROM EMP;

SELECT *
FROM EMP
ORDER BY age DESC;

SELECT DISTINCT salary
FROM EMP;

SELECT * FROM EMP
WHERE salary IS NOT NULL;

SELECT *
FROM EMP
WHERE eadd = 'Arish' OR eadd = 'Alex';

SELECT *
FROM EMP
WHERE eadd = 'Arish' AND age > 20;

SELECT * 
FROM EMP
WHERE eadd in ('Cairo', 'Arish', 'Alex');

SELECT *
FROM EMP
WHERE age BETWEEN 20 AND 25;


USE Company_SD;

-- 1
--a
SELECT Dependent.Dependent_name, Dependent.Sex
FROM Dependent INNER JOIN Employee
ON Dependent.ESSN = Employee.SSN
WHERE Dependent.Sex = 'F' AND Employee.SEX = 'F'
UNION
-- b
SELECT Dependent.Dependent_name, Dependent.Sex
FROM Dependent INNER JOIN Employee
ON Dependent.ESSN = Employee.SSN
WHERE Dependent.Sex = 'M' AND Employee.SEX = 'M';

-- 2
SELECT Pname, SUM(Hours) AS [Total Hours]
FROM Works_for INNER JOIN Project
ON Pno = Pnumber
GROUP BY Pname

-- 3
SELECT Departments.*
FROM Departments INNER JOIN Employee
ON Dno = Dnum
WHERE SSN = (SELECT MIN(SSN) FROM Employee)

-- 4
SELECT Dname, MAX(ISNULL(Salary, 0)) AS [Max], MIN(ISNULL(Salary, 0)) AS [Min], AVG(ISNULL(Salary, 0)) AS [Average]
FROM Departments INNER JOIN Employee
ON Dno = Dnum
GROUP BY Dname;

--5
SELECT Fname +' '+ Lname AS [Manager Name]
FROM Employee LEFT OUTER JOIN Dependent
ON SSN = Dependent.ESSN
WHERE Dependent.ESSN IS NULL
AND SSN IN (SELECT MGRSSN FROM Departments);

-- 6
SELECT Dnum, Dname, COUNT(SSN)
FROM Departments INNER JOIN Employee
ON Dno = Dnum
GROUP BY Dname, Dnum
HAVING AVG(ISNULL(Salary, 0)) < (SELECT AVG(ISNULL(Salary, 0)) FROM Employee);

-- 7
SELECT Fname+' '+Lname, Pname
FROM Works_for INNER JOIN Employee
ON ESSn = SSN
INNER JOIN Project
ON Pno = Pnumber
ORDER BY Dno, Lname, Fname

-- 8 2500 3750
SELECT Salary FROM Employee
WHERE Salary >= ( SELECT MAX(Salary) FROM Employee
					WHERE Salary < (SELECT MAX(Salary) FROM Employee) )

-- 9
SELECT Fname+' '+Lname AS [Full Name]
FROM Employee, Dependent
WHERE Fname+' '+Lname = Dependent_name

-- 10
SELECT Fname+' '+Lname AS [Full Name], SSN
FROM Employee
WHERE EXISTS ( SELECT * FROM Dependent WHERE SSN = ESSN );

-- 11
INSERT INTO Departments
VALUES ('DEPT IT', 100, 112233, 1-11-2006);

--12
-- a
UPDATE Departments
SET MGRSSN = 968574
WHERE Dnum = 100;
-- b
UPDATE Departments
SET MGRSSN = 102672
WHERE Dnum = 20;
-- c
UPDATE Employee
SET Superssn = 102672
WHERE SSN = 102660

-- 13
DELETE FROM Dependent
WHERE ESSN = 223344;

DELETE FROM Works_for
WHERE ESSN = 223344;

UPDATE Departments
SET MGRSSN = 112233
WHERE MGRSSN = 223344;

UPDATE Employee
SET Superssn = 112233
WHERE Superssn = 223344;

DELETE FROM Employee
WHERE SSN = 223344;

-- 14
UPDATE Employee
SET Salary *= 1.3
WHERE SSN IN ( SELECT ESSN
				FROM Works_for INNER JOIN Project
				ON Pno = Pnumber AND Pname = 'Al Rabwah');
				
USE Company_SD;

-- 1
SELECT Dname, Dnum, Fname+' '+Lname AS FullName, SSN 
FROM Departments INNER JOIN Employee
ON Departments.MGRSSN = Employee.SSN;

-- 2
SELECT Dname, Pname
FROM Departments INNER JOIN Project
ON Project.Dnum = Departments.Dnum;

-- 3
SELECT Fname+' '+Lname AS Ename, Dependent.*
FROM Dependent INNER JOIN Employee
ON Dependent.ESSN = Employee.SSN;

-- 4
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE City = 'Cairo' OR City = 'Alex';

-- 5
SELECT *
FROM Project
WHERE Pname LIKE 'a%';

-- 6
SELECT *
FROM Employee
WHERE Dno = 30 AND SALARY BETWEEN 1000 AND 2000;

-- 7
SELECT Fname+' '+Lname AS Ename
FROM Employee INNER JOIN Works_for
ON Employee.SSN = Works_for.ESSn AND Hours >= 10
INNER JOIN Project
ON Works_for.Pno = Project.Pnumber AND Pname = 'AL Rabwah';

-- 8
SELECT Emp.Fname+' '+Emp.Lname AS Ename, Super.Fname+' '+Super.Lname as SupervisorName
FROM Employee Emp INNER JOIN Employee Super
ON Super.SSN = EMP.Superssn
WHERE Super.Fname = 'Kamel' AND Super.Lname = 'Mohamed';

-- 9
SELECT Fname+' '+Lname AS Ename, Pname
FROM Employee INNER JOIN Works_for
ON Works_for.ESSn = Employee.SSN 
INNER JOIN Project
ON Project.Pnumber = Works_for.Pno 
ORDER BY Pname;

-- 10
SELECT Pnumber, Dname, Lname, Address, Bdate
FROM Departments INNER JOIN Project
ON Departments.Dnum = Project.Dnum AND Project.City = 'Cairo'
INNER JOIN Employee
ON Departments.MGRSSN = Employee.SSN;

-- 11
SELECT Employee.*
FROM Departments INNER JOIN Employee
ON Departments.MGRSSN = Employee.SSN;

-- 12
SELECT *
FROM Employee LEFT OUTER JOIN Dependent
ON Dependent.ESSN = Employee.SSN;

-- DML
-- 1
DELETE FROM Employee
WHERE SSN = 102672;

INSERT INTO Employee
VALUES ('Mohamed', 'Ayman', 102672, '4/12/2002', 'North Sinai Arish', 'M', 3000, 112233, 30);

SELECT *
FROM Employee
WHERE SSN = 102672;

-- 2
DELETE FROM Employee
WHERE SSN = 102660;

INSERT INTO Employee (Fname, Lname, SSN, Bdate, Address, Sex, Dno)
VALUES ('Ammar', 'Atef', 102660, '5/4/1948', 'Solomon Islands', 'M', 30);

SELECT *
FROM Employee
WHERE SSN = 102660;

-- 3
UPDATE Employee
SET Salary *= 1.2
WHERE SSN = 102672;





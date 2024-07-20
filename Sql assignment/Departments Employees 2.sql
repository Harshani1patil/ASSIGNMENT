CREATE TABLE Departments 
(
  Code INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  Budget decimal NOT NULL 
);

CREATE TABLE Employees
 (
  SSN INTEGER PRIMARY KEY,
  Name varchar(255) NOT NULL ,
  LastName varchar(255) NOT NULL ,
  Department INTEGER NOT NULL , 
  foreign key (department) references Departments(Code) 
);

INSERT INTO Departments(Code,Name,Budget) 
VALUES(14,'IT',65000),
	  (37,'Accounting',15000),
	  (59,'Human Resources',240000),
	  (77,'Research',55000);

INSERT INTO Employees(SSN,Name,LastName,Department) 
VALUES('123234877','Michael','Rogers',14),
	  ('152934485','Anand','Manikutty',14),
	  ('222364883','Carol','Smith',37),
	  ('326587417','Joe','Stevens',37),
	  ('332154719','Mary-Anne','Foster',14),
	  ('332569843','George','ODonnell',77),
	  ('546523478','John','Doe',59),
	  ('631231482','David','Smith',77),
	  ('654873219','Zacary','Efron',59),
	  ('745685214','Eric','Goldsmith',59),
	  ('845657245','Elizabeth','Doe',14),
	  ('845657246','Kumar','Swamy',14),
      ( 11 , 'Quality Assurance' , 40000),
      ( '847219811' , 'Mary' , 'Moore' , 11);
      
 /* 1 */     
select lastname from employees;

/* 2 */
select distinct lastname from employees;

/* 3 */
select * from employees where lastname="smith";

/* 4 */
select * from employees where lastname in ("smith", "doe");

/* 5 */
select * from employees where department=14;

/* 6 */
select * from employees where department in (37,77);

/* 7 */
select * from employees where lastname like "%s";

/* 8 */
select sum(department) from employees;

/* 9 */
SELECT Department, COUNT(*)
  FROM Employees
  GROUP BY Department;
  
 /*13*/ 
SELECT * FROM Departments WHERE Budget >
  (
    SELECT AVG(Budget)
    FROM Departments
  );
  
 /* 18 */ 
UPDATE Employees SET Department = 14 WHERE Department = 77;

/* 19 */
delete from employees where department = 14;

/* 20 */
DELETE FROM Employees
  WHERE Department IN
  (
    SELECT Code FROM Departments
      WHERE Budget >= 60000
  );
  
   /* 21 */
delete from employees;


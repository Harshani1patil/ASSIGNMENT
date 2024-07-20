create database manufacturer;
use manufacturer;

CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name)
values(1,'Sony'),
	  (2,'Creative Labs'),
	  (3,'Hewlett-Packard'),
	  (4,'Iomega'),
	  (5,'Fujitsu'),
	  (6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer)
 VALUES(1,'Hard drive',240,5),
	   (2,'Memory',120,6),
	   (3,'ZIP drive',150,4),
	   (4,'Floppy disk',5,6),
	   (5,'Monitor',240,1),
	   (6,'DVD drive',180,2),
	   (7,'CD drive',90,2),
	   (8,'Printer',270,3),
	   (9,'Toner cartridge',66,3),
	   (10,'DVD burner',180,2),
       ( 11, 'Loudspeakers' , 70 , 2 );
       
/* 01 */       
select name from products;

/* 02 */
select name,price from products;

 /* 03 */
select name from products where price <=200;

/* 04 */
SELECT * FROM Products WHERE Price BETWEEN 60 AND 120;

/* 05 */
SELECT Name, Price * 100 FROM Products;

/* 06 */
SELECT AVG(Price) FROM Products;

/* 07 */
SELECT AVG(Price) FROM Products WHERE Manufacturer=2;

/* 08 */
SELECT COUNT(*) FROM Products WHERE Price >= 180;

/* 09 */
SELECT Name, Price 
     FROM Products
     WHERE Price >= 180
     ORDER BY Price DESC, Name;
     
/* 10 */     
SELECT * FROM Products, Manufacturers WHERE Products.Manufacturer = Manufacturers.Code;
 
 /* 11 */
SELECT Products.Name, Price, Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code;
   
   /* 12 */
SELECT AVG(Price), Manufacturer
    FROM Products
GROUP BY Manufacturer;

/* 13 */
SELECT AVG(Price), Manufacturers.Name
   FROM Products, Manufacturers
   WHERE Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name;
   
   /* 14 */
SELECT AVG(Price), Manufacturers.Name
   FROM Products INNER JOIN Manufacturers
   ON Products.Manufacturer = Manufacturers.Code
   GROUP BY Manufacturers.Name
   HAVING AVG(Price) >= 150;   
   
  /* 15 */ 
SELECT Name, Price
   FROM Products
   WHERE Price = (SELECT MIN(Price) FROM Products);
   
   /* 18 */
   INSERT INTO Products( Code, Name , Price , Manufacturer)
  VALUES ( 11, 'Loudspeakers' , 70 , 2 );
   
   /* 19 */
   UPDATE Products
   SET Name = 'Laser Printer'
   WHERE Code = 8;
   
   
   
   

  




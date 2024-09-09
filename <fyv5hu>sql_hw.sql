/* WORLD DATABASE QUESTIONS: */
USE world; 

/* Question 1*/
SELECT Name FROM `country` WHERE Continent = 'South America';

/* Question 2*/
SELECT Population from country WHERE Name = 'Germany'; 

/* Question 3*/
SELECT Name FROM city WHERE CountryCode = 'JPN'; 

/* Question 4*/
SELECT Name 
FROM country 
WHERE continent = 'Africa' 
ORDER BY country.population DESC LIMIT 3; 

/* Question 5*/
SELECT Name, LifeExpectancy
FROM country 
WHERE country.population BETWEEN 1000000 and 5000000; 

/* Question 6*/
SELECT country.Name FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T'; 



/* CHINOOK DATABASE QUESTIONS */;

USE Chinook_AutoIncrement; 

/* Question 7 */
SELECT Title FROM Album WHERE ArtistId = '1';

/* Question 8 */
SELECT FirstName, Lastname, Email FROM Customer WHERE Country = 'Brazil';

/* Question 9 */
SELECT Name FROM Playlist; 

/* Question 10 */
SELECT COUNT(TrackId) AS TotalTracks FROM Track
Join Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';

/* Question 11 */
SELECT FirstName, LastName FROM Employee WHERE ReportsTO = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND Lastname = 'Edwards'); 

/* Question 12 */
SELECT Customer.CustomerId, Customer.Firstname, Customer.LastName, SUM(Invoice.Total) AS TotalSales FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName; 



/* PART II: CREATE YOUR OWN DATABASE */

USE fyv5hu; 

CREATE TABLE Purchase (
  PurchaseId INT PRIMARY KEY AUTO_INCREMENT,
  Item VARCHAR(120) NOT NULL, 
  Price DECIMAL(10,2) NOT NULL
); 

CREATE TABLE Album (
  AlbumId INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(150) NOT NULL, 
  Year YEAR NOT NULL
); 

CREATE TABLE Artist (
  ArtistId INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(120),
  LastName VARCHAR(120)
);

CREATE TABLE Orders (
  OrdersId INT PRIMARY KEY AUTO_INCREMENT,
  PurchaseId INT, ArtistId INT, 
  OrderDate DATE NOT NULL, 
  Quantity INT NOT NULL, 
  TotalAmount DECIMAL (10,2) NOT NULL
); 

INSERT INTO Purchase (Item, Price) VALUES
('33 Vinyl', 32.99), 
('CD', 11.99), 
('Casette', 15.99), 
('Radio', 35.00), 
('Record Player', 49.99),
('Walkman', 19.99); 

INSERT INTO Album (Title, Year) VALUES
('Thriller', 1982),
('The Dark Side of the Moon', 1973),
('Rumours', 1977),
('Because the Internet', 2013),
('Yeezus', 2013);
  
INSERT INTO Artist (FirstName, LastName) VALUES
('Michael', 'Jackson'),
('Pink', 'Floyd'),
('Fleetwood', 'Mac'),
('Childish', 'Gambino'),
('Kanye', 'West');

INSERT INTO Orders (OrdersId, PurchaseId, ArtistId, OrderDate, Quantity, TotalAmount) VALUES
(1, 1, 2, '2024-09-08', 1, 32.99),
(2,	3,	4,	'2024-09-07', 2,	31.98),
(3,	3,	1,	'2024-09-08',	3,	47.97),	
(4,	2,	5,	'2024-09-07',	1,	11.99),	
(5,	1,	3,	'2024-09-06',	1,	32.99);


SELECT PurchaseId FROM Orders WHERE TotalAmount BETWEEN 45 AND 60; 
SELECT FirstName, LastName FROM Artist; 
SELECT OrdersId from Orders WHERE OrderDate = '2024-09-06'



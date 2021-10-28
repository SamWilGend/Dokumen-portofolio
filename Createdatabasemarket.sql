CREATE DATABASE market

USE market

CREATE TABLE Customer(
Email varchar(255) PRIMARY KEY ,
Name varchar(255) NOT NULL,
Phone varchar(255) NOT NULL,
Adress varchar(255) NOT NULL
)

CREATE TABLE ShoppingBasket(
ID char(12) PRIMARY KEY CHECK(ID LIKE 'P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]P[0-9]'),
CustumerEmail varchar(255) FOREIGN KEY REFERENCES Customer(Email)
)

CREATE TABLE Book(
ISBN varchar(255) PRIMARY KEY,
PublisherName varchar(255),
AuthorName varchar(255),
AuthorAdress varchar(255),
Tahun int NOT NULL CHECK (Tahun>=2000),
Title varchar(255) NOT NULL,
Price numeric(19,0) NOT NULL CHECK (Price>1000 and Price<10000)
)

CREATE TABLE ShoppingBasketBook(
ShoppingBasketID char(12) FOREIGN KEY REFERENCES ShoppingBasket(ID),
BookISBN varchar(255) FOREIGN KEY REFERENCES Book(ISBN),
jumlah int NOT NULL
)

INSERT INTO Customer VALUES(
'samuelwijaya21@gmail.com',
'Samuel wijaya',
'087765478910',
'jln.manggis'
)

INSERT INTO Customer VALUES(
'kevin9@gmail.com',
'Kevin',
'08976756870',
'jln.rambutan'
)

INSERT INTO Customer VALUES(
'dikaratna@gmail.com',
'dika',
'08667438299',
'jln.holly'
)

INSERT INTO Customer VALUES(
'diki@gmail.com',
'diki',
'0876557868',
'jln.kerhamonisan'
)

INSERT INTO Customer VALUES(
'rian@gmail.com',
'rian',
'08766445537',
'jln.satria'
)

INSERT INTO ShoppingBasket VALUES(
'P23826784983',
'samuel wijaya'
)

INSERT INTO ShoppingBasket VALUES(
'P24563782930',
'kevin'
)

INSERT INTO ShoppingBasket VALUES(
'P23645783928',
'dika'
)

INSERT INTO ShoppingBasket VALUES(
'P23465784938',
'diki'
)

INSERT INTO ShoppingBasket VALUES(
'P23674567348',
'rian'
)

INSERT INTO ShoppingBasketBook VALUES(
'P23826784983',
'349-0-38349',
5

)

INSERT INTO ShoppingBasketBook VALUES(
'P24563782930',
'657-34-444',
4
)

INSERT INTO ShoppingBasketBook VALUES(
'P23645783928',
'34-67-432',
6
)

INSERT INTO ShoppingBasketBook VALUES(
'P23465784938',
'543-7-344',
8
)

INSERT INTO ShoppingBasketBook VALUES(
'P23674567348',
'35-9-7647',
7
)

INSERT INTO Book VALUES(
'349-0-38349',
'budi',
'rika',
'jn.kompas',
'2000',
'langit',
5000
)

INSERT INTO Book VALUES(
'657-34-444',
'susanto',
'rianbudiman',
'jln.anggrek',
'2001',
'hujan',
6000
)

INSERT INTO Book VALUES(
'34-67-432',
'sinta',
'bryan',
'jn.pendidikan',
'2001',
'gersang',
5500
)

INSERT INTO Book VALUES(
'543-7-344',
'rysan',
'rian',
'jn.lurus',
'2002',
'penderitaan',
6000
)

INSERT INTO Book VALUES(
'35-9-7647',
'gerard',
'susanto',
'jn.penghargaan',
'2004',
'pengalaman',
6800
)
UPDATE Book SET Price=Price+0.05*Price
SELECT *FROM Book


--2
-- A) SELECT *FROM Book 
--    where 2020-year <=5

--B)SELECT Email ,Name ,FROM Address ,FROM Customer AS c JOIN ShoppingBasket AS sb on SB.Customer email

--C) SELECT Email FROM Customer MINUS
--   SELECT Customer Email FROM ShoppingBasket

--D) SELECT ISBN FROM Book MINUS
--   SELECT Book ISBN FROM ShoppingBasket_Book

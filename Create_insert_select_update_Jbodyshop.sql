USE JBodyShop

--1
CREATE TABLE StaffPosition(
StaffPositionID CHAR(5) PRIMARY KEY CHECK(ID LIKE 'PO[0-3]'),
StaffPositionName VARCHAR(30) NOT NULL,
StaffPositionBonus NUMERIC (11,2)
)

--2
ALTER TABLE Customer ADD CustomerAddress VARCHAR (100),
ALTER TABLE Customer ADD CONSTRAINT CustomerID VARCHAR(6) PRIMARY KEY


--3
INSERT INTO Customer VALUES(
'CU011',
'Alicia Hemsworth',
'alicia.hemsworth@gmail.com',
'0812121233',
'Female',
'2000-11-01'
)

--4
SELECT *FROM Staff
WHERE StaffName LIKE ' ',
WHERE StaffGender LIKE '%Female',
WHERE StaffSalary LIKE ' '


--5
UPDATE Staff SET StaffDateOfBirth,
StaffSalary = StaffSalary + 1000000
WHERE EXISTS(
SELECT *FROM TransactionHeader WHERE DATEPART (DAY ,TransactionDate)=2020)

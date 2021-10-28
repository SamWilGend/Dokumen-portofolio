CREATE DATABASE TStore
go
USE TStore
go
-- B. 
CREATE TABLE MsStaff (
 [StaffID]  CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
 [StaffName] VARCHAR (50) NOT NULL,
 [StaffAddress] VARCHAR (100) NOT NULL,
 [StaffPhoneNumber] VARCHAR (13) NOT NULL CHECK (StaffPhoneNumber LIKE '08%'),
 [StaffGender] CHAR (10) NOT NULL CHECK([StaffGender] in ('Male', 'Female')),
 [StaffEmail] VARCHAR (100) NOT NULL,
 [StaffSalary] INT NOT NULL CHECK (StaffSalary >=3000000)
)
drop table MsStaff

CREATE TABLE MsCustomer (
 [CustomerID]  CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
 [CustomerName] VARCHAR (50) NOT NULL,
 [CustomerAddress] VARCHAR (100) NOT NULL,
 [CustomerPhoneNumber] VARCHAR (13) NOT NULL CHECK (CustomerPhoneNumber LIKE '08%'),
 [CustomerGender] CHAR (10) NOT NULL CHECK([CustomerGender] in ('Male', 'Female')),
 [CustomerEmail] VARCHAR (100) NOT NULL,
)
drop table MsCustomer

CREATE TABLE MsVendor (
 [VendorID]  CHAR(5) PRIMARY KEY CHECK (VendorID LIKE 'VE[0-9][0-9][0-9]'),
 [VendorName] VARCHAR (50) NOT NULL,
 [VendorAddress] VARCHAR (100) NOT NULL,
 [VendorPhoneNumber] VARCHAR (13) NOT NULL CHECK (VendorPhoneNumber LIKE '08%'),
 [VendorEmail] VARCHAR (100) NOT NULL,
)
drop table MsVendor

CREATE TABLE MsClothCategory (
 [ClothCategoryID]  CHAR(5) PRIMARY KEY CHECK (ClothCategoryID LIKE 'CA[0-9][0-9][0-9]'),
 [ClothCategoryName] VARCHAR (100) NOT NULL,
)
drop table MsClothCategory

CREATE TABLE MsCloth (
 [ClothID]  CHAR(5) PRIMARY KEY CHECK (ClothID LIKE 'CL[0-9][0-9][0-9]'),
 [ClothBrand] VARCHAR (100) NOT NULL CHECK( LEN (ClothBrand) >5),
 [ClothPrice] INT NOT NULL CHECK (ClothPrice >= 20000),
 [ClothCategory] CHAR (5) FOREIGN KEY REFERENCES [MsClothCategory](ClothCategoryID) 
									ON UPDATE CASCADE
									ON DELETE CASCADE,
 [ClothStock] INT NOT NULL
)
drop table MsCloth

CREATE TABLE HeaderPurchaseTransaction (
 [PurchaseID]  CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PU[0-9][0-9][0-9]'),
 [StaffID] CHAR (5) FOREIGN KEY REFERENCES [MsStaff](StaffID) 
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [VendorID] CHAR (5) FOREIGN KEY REFERENCES [MsVendor](VendorID) 
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [PurchaseDate] DATETIME NOT NULL-- CHECK (DATEDIFF(MINUTE,SalesDate,GETDATE())<=60)
)
drop table HeaderPurchaseTransaction

CREATE TABLE DetailPurchaseTransaction (
 [PurchaseID]  CHAR(5) FOREIGN KEY REFERENCES [HeaderPurchaseTransaction](PurchaseID)
 						ON UPDATE CASCADE
						ON DELETE CASCADE,
 [ClothID]  CHAR(5) FOREIGN KEY REFERENCES [MsCloth](ClothID) 
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [ClothQuantity] INT NOT NULL
 PRIMARY KEY (PurchaseID,ClothID)
)
drop table DetailPurchaseTransaction

 CREATE TABLE HeaderSalesTransaction (
 [SalesID]  CHAR(5) PRIMARY KEY CHECK (SalesID LIKE 'SA[0-9][0-9][0-9]'),
 [StaffID] CHAR (5) FOREIGN KEY REFERENCES [MsStaff](StaffID) 
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [CustomerID] CHAR (5) FOREIGN KEY REFERENCES [MsCustomer](CustomerID) 
						ON UPDATE CASCADE
						ON DELETE CASCADE,
 [SalesDate] DATETIME NOT NULL -- CHECK (DATEDIFF(MINUTE,SalesDate,GETDATE())<=60)
 )

 drop table  HeaderSalesTransaction

 CREATE TABLE DetailSalesTransaction (
 [SalesID]  CHAR(5) FOREIGN KEY REFERENCES [HeaderSalesTransaction](SalesID)
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [ClothID] CHAR (5) REFERENCES [MsCloth](ClothID)
					ON UPDATE CASCADE
					ON DELETE CASCADE,
 [ClothQuantity] INT NOT NULL
 )
  drop table  DetailSalesTransaction
-- Kelompok 3 BI01 
-- E. Answer the 10 cases

USE TStore
GO

-- 1.
SELECT COUNT(hpt.PurchaseID) AS [Transaction Count] , ms.StaffName, mv.VendorName
FROM HeaderPurchaseTransaction hpt 
INNER JOIN MsStaff ms ON hpt.StaffID = ms.StaffID  
INNER JOIN MsVendor mv ON hpt.[VendorID] = mv.[VendorID]
WHERE ms.StaffSalary BETWEEN 5000000 AND 10000000 AND mv.VendorName LIKE '%o%'
GROUP BY  ms.StaffName, mv.VendorName

-- 2.
SELECT hst.SalesID, hst.SalesDate, mcu.CustomerName, mcu.CustomerAddress
FROM HeaderSalesTransaction hst 
INNER JOIN MsCustomer mcu  ON hst.CustomerID = mcu.CustomerID
INNER JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
INNER JOIN MsCloth mcl ON dst.ClothID = mcl.ClothID
WHERE DAY(hst.SalesDate) LIKE '15' 
group by hst.SalesID, hst.SalesDate, mcu.CustomerName, mcu.CustomerAddress
HAVING SUM(mcl.ClothPrice*dst.ClothQuantity)>150000

-- 3. 
SELECT DATENAME (MONTH,hst.SalesDate) AS [Month Name], hst.SalesID AS [Transaction Count]
, dst.ClothQuantity AS [Cloth Sold Count]
from HeaderSalesTransaction hst
INNER JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
INNER JOIN MsStaff ms ON hst.StaffID = ms.StaffID
INNER JOIN MsCloth mc ON mc.ClothID = dst.ClothID
WHERE ms.StaffGender LIKE 'Female' AND DATENAME (MONTH,hst.SalesDate) = DATENAME (MONTH,GETDATE()-30) 
AND mc.clothPrice>70000 

-- 4.
SELECT SUBSTRING(mc.ClothBrand,CHARINDEX(' ',mc.ClothBrand)+1, LEN(mc.ClothBrand)) AS [Brand Last Name]
, max(dst.ClothQuantity) AS [MAX Cloth Sold]
FROM DetailSalesTransaction dst 
INNER JOIN MsCloth mc ON dst.clothID = mc.clothID 
INNER JOIN HeaderSalesTransaction hst ON hst.salesID = dst.salesID
INNER JOIN MsCustomer mcr ON mcr.CustomerID = hst.CustomerID 
GROUP BY SUBSTRING(mc.ClothBrand, CHARINDEX(' ',mc.ClothBrand)+1, LEN(mc.ClothBrand))
HAVING MAX(dst.ClothQuantity) between 5 AND 10

-- 5.
SELECT mc.ClothBrand, mc.ClothPrice, dpt.ClothQuantity
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
INNER JOIN MsCloth mc ON dpt.ClothID=mc.ClothID , (
	SELECT AVG(mc.ClothPrice) AS ClothAVGPrice
	FROM MsCloth mc 
	INNER JOIN DetailPurchaseTransaction dpt ON dpt.ClothID=mc.ClothID
	INNER JOIN HeaderPurchaseTransaction hpt ON hpt.PurchaseID= dpt.PurchaseID
	INNER JOIN MsVendor mv ON hpt.VendorID = mv.VendorID
	WHERE mv.VendorName LIKE 'Saad%'
)ClothAvg
Where mc.ClothPrice between ClothAvg.[ClothAVGPrice]-35000 AND 
ClothAvg.[ClothAVGPrice]

-- 6.	
SELECT CONVERT( varchar, hst.SalesDate , 101) AS [Sales Date], mc.ClothBrand, dst.ClothQuantity
from HeaderSalesTransaction hst
INNER JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
INNER JOIN  MsStaff ms ON hst.StaffID = ms.StaffID
INNER JOIN MsCloth mc ON mc.ClothID = dst.ClothID,(
SELECT SUM (dst.ClothQuantity) AS [MayClothQuantity]
from HeaderSalesTransaction hst
INNER JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
INNER JOIN  MsStaff ms ON hst.StaffID = ms.StaffID
INNER JOIN MsCloth mc ON mc.ClothID = dst.ClothID
WHERE MONTH(hst.SalesDate) LIKE '5'
)MayQuantity
WHERE MayQuantity.[MayClothQuantity] < dst.ClothQuantity

-- 7.
SELECT hpt.PurchaseId,  LOWER(ms.StaffName) AS [Staff Name] , 'IDR ' + CAST(ms.StaffSalary AS varchar) AS [Staff Salary] ,
CONVERT( varchar, hpt.PurchaseDate , 107) AS [Purchase Date], SUM (dpt.ClothQuantity) AS [Total Quantity]
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
INNER JOIN MsCloth mc  ON dpt.ClothID=mc.ClothID
INNER JOIN MsStaff ms ON hpt.StaffID = ms.StaffID,(
SELECT MIN(dpt.ClothQuantity) AS [MinQuantity]
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
WHERE  MONTH(hpt.PurchaseDate) LIKE '4'
) MinimalQuantity
WHERE MinimalQuantity.[MinQuantity] < dpt.ClothQuantity
GROUP BY hpt.PurchaseID,LOWER(ms.StaffName)  , 'IDR ' + CAST(ms.StaffSalary AS varchar)  
, CONVERT( VARCHAR, hpt.PurchaseDate , 107) 

-- 8.
SELECT RIGHT(hpt.VendorID,3)AS [Vendor Id], mv.VendorName,CAST (SUM(dpt.ClothQuantity) AS varchar)+  ' piece(s)' AS [Clothes Bought]
,REPLACE(mv.VendorPhoneNumber,'08','+628') AS [Vendor Phone]
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
INNER JOIN MsCloth mc  ON dpt.ClothID=mc.ClothID
INNER JOIN MsVendor mv ON hpt.VendorID = mv.VendorID,(
SELECT AVG(dpt.ClothQuantity) AS [ClothAVGQuantity]
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
INNER JOIN MsCloth mc  ON dpt.ClothID=mc.ClothID
INNER JOIN MsVendor mv ON hpt.VendorID = mv.VendorID
) ClothAVG
WHERE dpt.ClothQuantity BETWEEN ClothAVG.[ClothAVGQuantity] AND 100
GROUP BY RIGHT(hpt.VendorID,3), mv.VendorName, REPLACE(mv.VendorPhoneNumber,'08','+628')

-- 9.
CREATE VIEW StoreSalesView AS
SELECT hst.SalesID, mc.CustomerName, mc.CustomerPhoneNumber, 'IDR '+ CAST(AVG(mcl.CLothPrice) AS VARCHAR) AS [Cloth Average Price]
, CAST(SUM(dst.ClothQuantity) AS VARCHAR) + ' piece(s)' AS [Sales Quantity]
from HeaderSalesTransaction hst
INNER JOIN DetailSalesTransaction dst ON hst.SalesID = dst.SalesID
INNER JOIN  MsCustomer mc ON hst.CustomerID = mc.CustomerID
INNER JOIN MsCloth mcl ON mcl.ClothID = dst.ClothID
GROUP BY hst.SalesID, mc.CustomerName, mc.CustomerPhoneNumber
HAVING SUM(clothQuantity) > 4 AND AVG(mcl.CLothPrice)> 100000

-- 10.	
CREATE VIEW StorePurchaseView AS
SELECT DATENAME (MONTH,hpt.PurchaseDate) AS [Month Name], MIN(dpt.ClothQuantity) AS[Minimum Purchase Quantity]
, SUM(dpt.ClothQuantity) AS[Total Purchase Quantity]
FROM HeaderPurchaseTransaction hpt 
INNER JOIN DetailPurchaseTransaction dpt ON hpt.PurchaseID= dpt.PurchaseID
INNER JOIN MsCloth mc  ON dpt.ClothID=mc.ClothID
INNER JOIN MsVendor mv ON hpt.VendorID = mv.VendorID
GROUP BY  DATENAME (MONTH,hpt.PurchaseDate)
HAVING MIN(dpt.ClothQuantity) > 10 AND SUM(dpt.ClothQuantity) >1

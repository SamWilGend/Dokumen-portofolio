USE OOVEO_Salon

--1

INSERT INTO MsStaff VALUES(
'SF006',
'Jeklin Harefa',
'Female',
'085265433322',
'Kebon Jeruk Street no 140',
3000000,
'Stylist'
)

INSERT INTO MsStaff VALUES(
'SF007',
'Lavinia',
'Female',
'085755500011',
'Kebon Jeruk Street no 153',
3000000,
'Stylist'
)

INSERT INTO MsStaff VALUES(
'SF008',
'Stephen Adrianto',
'Male',
'085564223311',
'Mandala Street no 14',
3000000,
'Stylist'
)

INSERT INTO MsStaff VALUES(
'SF009',
'Rico Wijaya',
'Male',
'085710252525',
'Keluarga Street no 78',
3000000,
'Stylist'
)


INSERT INTO HeaderSalonServices VALUES(
'TR010',
'CU001',
'SF004',
'2012/12/23',
'Credit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR011',
'CU002',
'SF006',
'2012/12/24',
'Credit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR012',
'CU007',
'SF007',
'2012/12/24',
'Cash'
)

INSERT INTO HeaderSalonServices VALUES(
'TR013',
'CU004',
'SF005',
'2012/12/25',
'Debit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR014',
'CU005',
'SF007',
'2012/12/25',
'Debit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR015',
'CU005',
'SF005',
'2012/12/26',
'Credit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR016',
'CU002',
'SF001',
'2012/12/26',
'Cash'
)

INSERT INTO HeaderSalonServices VALUES(
'TR017',
'CU003',
'SF002',
'2012/12/26',
'Credit'
)

INSERT INTO HeaderSalonServices VALUES(
'TR018',
'CU005',
'SF005',
'2012/12/27',
'Debit'
)


INSERT INTO DetailSalonServices VALUES(
'TR010',
'TM003'
)

INSERT INTO DetailSalonServices VALUES(
'TR010',
'TM005'
)

INSERT INTO DetailSalonServices VALUES(
'TR010',
'TM010'
)

INSERT INTO DetailSalonServices VALUES(
'TR011',
'TM015'
)

INSERT INTO DetailSalonServices VALUES(
'TR011',
'TM025'
)

INSERT INTO DetailSalonServices VALUES(
'TR012',
'TM009'
)

INSERT INTO DetailSalonServices VALUES(
'TR013',
'TM003'
)

INSERT INTO DetailSalonServices VALUES(
'TR013',
'TM006'
)

INSERT INTO DetailSalonServices VALUES(
'TR013',
'TM015'
)

INSERT INTO DetailSalonServices VALUES(
'TR014',
'TM016'
)

INSERT INTO DetailSalonServices VALUES(
'TR015',
'TM016'
)

INSERT INTO DetailSalonServices VALUES(
'TR015',
'TM006'
)

INSERT INTO DetailSalonServices VALUES(
'TR016',
'TM015'
)

INSERT INTO DetailSalonServices VALUES(
'TR016',
'TM003'
)

INSERT INTO DetailSalonServices VALUES(
'TR016',
'TM005'
)

INSERT INTO DetailSalonServices VALUES(
'TR017',
'TM003'
)

INSERT INTO DetailSalonServices VALUES(
'TR018',
'TM006'
)

INSERT INTO DetailSalonServices VALUES(
'TR018',
'TM005'
)

INSERT INTO DetailSalonServices VALUES(
'TR018',
'TM007'
)

--2

INSERT INTO HeaderSalonServices VALUES(
'TR019',
'CU005',
'SF004',
DATEADD(day ,3 ,GETDATE()),
'CREDIT'
)

--3

INSERT INTO MsStaff VALUES(
'SF010',
'Effendy Lesmana',
'Male',
'085218587878',
'Tanggerang City Street no 88',
ROUND(RAND() *2000000+3000000 ,0),
'Stylist'
)

--4

UPDATE MsCustomer SET CustomerPhone = REPLACE(CustomerPhone ,'08' ,'628')
SELECT * FROM MsCustomer

--5
UPDATE MsStaff SET StaffPosition = 'Top Stylist' ,StaffSalary = StaffSalary + 7000000
WHERE StaffName LIKE 'Effendy Lesmana'

--6
UPDATE MsCustomer SET CustomerName = LEFT (CustomerName ,CHARINDEX(' ', CustomerName))
WHERE EXISTS
(SELECT * FROM HeaderSalonServices 
WHERE DATEPART (DAY ,TransactionDate) = 24)

--7
UPDATE MsCustomer SET CustomerName = 'Ms. ' + CustomerName
WHERE CustomerId in ('CU002' ,'CU003')

--8
UPDATE MsCustomer SET CustomerAddress = 'Daan Mogot Baru Street No. 23'
WHERE EXISTS (SELECT *FROM HeaderSalonServices
WHERE EXISTS(SELECT *FROM MsStaff 
WHERE StaffName in ('Indra Saswita'))and DATENAME(WEEKDAY ,TransactionDate ) in ('Thursday'))

--9
DELETE h FROM HeaderSalonServices AS h  JOIN 
MsCustomer AS c ON h.CustomerId = c.CustomerId
WHERE CHARINDEX(' ' ,c.CustomerName)= 0

--10
DELETE FROM MsTreatment
WHERE TreatmentTypeId in 
(SELECT TreatmentTypeId FROM MsTreatmentType WHERE TreatmentTypeName NOT LIKE '%Treatment')

SELECT *FROM HeaderSalonServices
USE OOVEO_Salon
SELECT *FROM MsCustomer
SELECT *FROM MsStaff
SELECT *FROM HeaderSalonServices AS h join MsCustomer As m ON h.CustomerId = m.CustomerId join MsStaff AS s ON h.StaffId = s.StaffId